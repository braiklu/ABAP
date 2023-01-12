*----------------------------------------------------------------------*
* Program Name                : ZLBF3                                  *
* Title                       : Report flight                          *
* Company                     : AMS                                    *
* Author                      : Lucas Braich Ferreira                  *
* Creation Date               : 09/01/2023                             *
* Developer                   : Lucas Braich Ferreira                  *
*----------------------------------------------------------------------*
* MODIFICATION HISTORY                                                 *
*----------------------------------------------------------------------*
* Date        |     Developer     | Change No.   | Changes             *
*----------------------------------------------------------------------*
*             |                   |              |Initial Development  *
*----------------------------------------------------------------------*
* COMMENTS                                                             *
*----------------------------------------------------------------------*
* Program to rescue data inserted in Selection Screen and insert them  *
* in a table created in se11. Code contains some calculations of       *
* average speed, occupied and free seats.                              *
*----------------------------------------------------------------------*

REPORT zlbf3.

DATA: gv_conn TYPE sflight-connid.

DATA: gt_flights TYPE TABLE OF zlbf_flights,
      gs_flights TYPE zlbf_flights.


SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE TEXT-id1. "Parameters and Select-option.

  PARAMETERS: p_carr TYPE scarr-carrid OBLIGATORY.

  SELECT-OPTIONS: so_date FOR sy-datum,
                  so_conn FOR gv_conn.

SELECTION-SCREEN END OF BLOCK block1.


START-OF-SELECTION.

  SELECT mandt, carrid, connid, carrname, airpfrom, airpto, fldate, seatsmax, seatsocc
    FROM sflights
    INTO CORRESPONDING FIELDS OF TABLE @gt_flights
      WHERE carrid EQ @p_carr
      AND fldate IN @so_date
      AND connid IN @so_conn.


  LOOP AT gt_flights ASSIGNING FIELD-SYMBOL(<fs_flights>).

    SELECT SINGLE fltime
      FROM spfli
      INTO @<fs_flights>-fltime
      WHERE carrid EQ @<fs_flights>-carrid.

    <fs_flights>-fltime = <fs_flights>-fltime / 60. "Pass the time to hours


    SELECT SINGLE distance, distid
      FROM spfli
      INTO @DATA(ls_flights)
      WHERE carrid EQ @<fs_flights>-carrid.

    IF ls_flights-distid EQ 'MI'. "Condition that if Distance ID is Miles, convert to kilometers
      ls_flights-distance = ls_flights-distance * '1.6'.
    ENDIF.

    <fs_flights>-avgspeed = ls_flights-distance / <fs_flights>-fltime. "Average speed calculation


    MOVE-CORRESPONDING ls_flights TO <fs_flights>.
    CLEAR ls_flights.

    IF ( ( <fs_flights>-seatsocc / <fs_flights>-seatsmax ) * 100 ) >= 75. "Calculation if the flight has more than 75% of the seats occupied.
      <fs_flights>-fullflight = 'X'.
    ENDIF.

  ENDLOOP.

  MODIFY zlbf_flights FROM TABLE gt_flights.
  COMMIT WORK.

END-OF-SELECTION.


  LOOP AT gt_flights INTO gs_flights.

    WRITE: /, 'Voo ', gs_flights-connid, ' foi sobescrito.'.

  ENDLOOP.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY' "Function to show table with ALV
    EXPORTING
      i_structure_name = 'ZLBF_SFLIGHTS'
    TABLES
      t_outtab         = gt_flights.