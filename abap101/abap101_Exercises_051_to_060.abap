" -------- Exercise 051 --------
" Write an executable program that contains a routine which prints all usernames in the system.
" (Check table USR04 and its content in transaction SE11, SE16 or SE16N).
" Resolução comentada: -

TYPES ty_users TYPE usr04-bname.

DATA gt_users TYPE TABLE OF ty_users.

START-OF-SELECTION.

  SELECT bname
    FROM usr04
    INTO TABLE gt_users.

  PERFORM print.

  BREAK-POINT.

FORM print.

  DATA lwa_users TYPE ty_users.

  LOOP AT gt_users INTO lwa_users.
    WRITE lwa_users. NEW-LINE.
  ENDLOOP.

ENDFORM.



" -------- Exercise 052 --------
* For this exercise, you should Read the help from command FORM completely. Then, write
* an executable program that has a routine that receives four global variables and change their value.
* Each variable will be received in a different way:
* 2 of them using the addition USING and the other 2 using the addition CHANGING from the FORM command.
* For each pair use and omit the adding VALUE. Print the contents of all global variables:
* before the routine is called,
* at the beginning of the routine,
* at the end of the routine (after all values are changed)
* and after the PERFORM statement.
* See how the contents of variables behave using the debugger.
" Resolução comentada: -


DATA gv_a TYPE i VALUE 10.
DATA gv_b TYPE i VALUE 15.
DATA gv_c TYPE i VALUE 20.
DATA gv_d TYPE i VALUE 25.




FORM form_parameters
 USING us_a TYPE i VALUE(usv_b) TYPE i
 CHANGING ch_c TYPE i VALUE(chv_d) TYPE i.

  WRITE '---- Beginning of the routine ----'. NEW-LINE.
  WRITE: 'us_a: ', us_a. NEW-LINE.
  WRITE: 'usv_b: ', usv_b. NEW-LINE.
  WRITE: 'ch_c: ', ch_c. NEW-LINE.
  WRITE: 'chv_d: ', chv_d. NEW-LINE.

  us_a = us_a + 10.
  usv_b = usv_b + 10.
  ch_c = ch_c + 10.
  chv_d = chv_d + 10.

  WRITE '---- Inside FORM ----'. NEW-LINE.
  WRITE: 'us_a: ', us_a. NEW-LINE.
  WRITE: 'usv_b: ', usv_b. NEW-LINE.
  WRITE: 'ch_c: ', ch_c. NEW-LINE.
  WRITE: 'chv_d: ', chv_d. NEW-LINE.

  WRITE: 'gv_a: ', gv_a. NEW-LINE.
  WRITE: 'gv_b: ', gv_b. NEW-LINE.
  WRITE: 'gv_c: ', gv_c. NEW-LINE.
  WRITE: 'gv_d: ', gv_d. NEW-LINE.
ENDFORM.

START-OF-SELECTION.

WRITE '---- Before the routine ----'. NEW-LINE.
WRITE: 'gv_a: ', gv_a. NEW-LINE.
WRITE: 'gv_b: ', gv_b. NEW-LINE.
WRITE: 'gv_c: ', gv_c. NEW-LINE.
WRITE: 'gv_d: ', gv_d. NEW-LINE.

PERFORM form_parameters
USING gv_a gv_b
CHANGING gv_c gv_d.

WRITE '---- After FORM ----'. NEW-LINE.
WRITE: 'gv_a: ', gv_a. NEW-LINE.
WRITE: 'gv_b: ', gv_b. NEW-LINE.
WRITE: 'gv_c: ', gv_c. NEW-LINE.
WRITE: 'gv_d: ', gv_d. NEW-LINE.



" -------- Exercise 052 --------
* Write an executable program that has a routine that receives two numbers and returns the largest of them, If the numbers are equal return the number itself
" Resolução comentada: -

TYPES: ty_num TYPE i.

DATA: ls_num TYPE TABLE OF ty_num.

PARAMETERS: num01 TYPE i,
            num02 TYPE i.

START-OF-SELECTION.

  APPEND num01 TO ls_num.
  APPEND num02 TO ls_num.

  SORT ls_num DESCENDING.

  IF num01 EQ num02.

    cl_demo_output=>write( 'Os números informados são iguais!' ).
    cl_demo_output=>display( ls_num ).

  ELSE.

    READ TABLE ls_num INDEX 1 INTO DATA(resposta).
    cl_demo_output=>write( 'O maior número inteiro informado: ' ).
    cl_demo_output=>display( resposta ).

  ENDIF.



" -------- Exercise 052 --------
* Write an executable program that has a routine that receives two numbers and returns the largest of them, If the numbers are equal return the number itself
" Resolução comentada: -

DATA gv_greaternum TYPE i.

FORM get_larger
    USING
       num01 TYPE f
       num02 TYPE f
    CHANGING
       greater_num TYPE i.

  IF num01 >= num02.
    greater_num = num01.
  ELSE.
    greater_num = num02.
  ENDIF.

ENDFORM.

START-OF-SELECTION.

  PERFORM get_larger USING 1 2 CHANGING gv_greaternum.
  WRITE gv_greaternum. NEW-LINE.

  PERFORM get_larger USING 45 377 CHANGING gv_greaternum.
  WRITE gv_greaternum. NEW-LINE.

  PERFORM get_larger USING 53 53 CHANGING gv_greaternum.
  WRITE gv_greaternum. NEW-LINE.

  PERFORM get_larger USING 222 333 CHANGING gv_greaternum.
  WRITE gv_greaternum. NEW-LINE.



" -------- Exercise 052 --------
" Write an executable program that has a routine that receives two numbers and return a flag (character with length 1). If the numbers are equal, set the flag with 'X. Otherwise set the flag to space.
" Resolução comentada: -

DATA gv_flag TYPE c LENGTH 1.

FORM set_flag
  USING
        num01 TYPE i
        num02 TYPE i
  CHANGING
        flagger TYPE c.

  IF num01 EQ num02.
    flagger = 'X'.
    WRITE: 'Os números da rotina são iguais! - ', gv_flag. NEW-LINE.
  ELSE.
    flagger = ' '.
    WRITE: 'Os números da rotina NÃO são iguais! - ', gv_flag. NEW-LINE.
  ENDIF.

ENDFORM.

START-OF-SELECTION.

  PERFORM set_flag USING 1 2 CHANGING gv_flag.

  PERFORM set_flag USING 4 4 CHANGING gv_flag.



" -------- Exercise 055 --------
" Write an executable program that has a routine that takes two numbers and writes the result of the operation [higher_number / lower_number] if the numbers are different. If they are equal, write the result of the operation [number ^ 2].
" Resolução comentada: -

DATA gv_ope TYPE i.

FORM operation
  USING
        num01 TYPE i
        num02 TYPE i
  CHANGING
        operation TYPE i.


  IF num01 EQ num02.
    DATA(num03) = num01 * num02.
    WRITE: num03. NEW-LINE.

  ELSEIF num01 > num02.
    WRITE: 'O numero 1> ', num01, ' é maior que o número 2> ', num02. NEW-LINE.
    operation = num01 / num02.
    WRITE: operation. NEW-LINE.

  ELSE.
    WRITE: 'O numero 2> ', num02, ' é maior que o número 1> ', num01. NEW-LINE.
    operation = num02 / num01.
    WRITE: operation. NEW-LINE.

  ENDIF.

ENDFORM.

START-OF-SELECTION.

  PERFORM operation USING 2 2 CHANGING gv_ope.

  PERFORM operation USING 2 4 CHANGING gv_ope.

  PERFORM operation USING 8 2 CHANGING gv_ope.



DATA: BEGIN OF wa_fields,
        zipcode TYPE i,
        name    TYPE string,
        pn      TYPE p LENGTH 5,
        date    TYPE d,
        time    TYPE t,
      END OF wa_fields.


START-OF-SELECTION.

  wa_fields-zipcode = '32142144'.
  wa_fields-name    = 'Lucas Ferreira'.
  wa_fields-pn      = '12345'.
  wa_fields-date    = sy-datum.
  wa_fields-time    = sy-timlo.

  " Before the creation of perform.
*  WRITE:wa_fields-zipcode USING EDIT MASK '____-___'.ULINE.
*  WRITE:wa_fields-name.ULINE.
*  WRITE:wa_fields-pn.ULINE.
*  WRITE:wa_fields-date.ULINE.
*  WRITE:wa_fields-time .ULINE.


  WRITE:wa_fields-zipcode USING EDIT MASK '_____-___'.
  PERFORM separation.

  WRITE:wa_fields-name.
  PERFORM separation.

  WRITE:wa_fields-pn.
  PERFORM separation.

  WRITE:wa_fields-date DD/MM/YYYY.
  PERFORM separation.

  WRITE /(60): wa_fields-time USING EDIT MASK '__:__:__'.
  PERFORM separation.


FORM separation.
  DO 2 TIMES.
    ULINE.
  ENDDO.
ENDFORM.



" -------- Exercise 057 --------
" Write an executable program with a routine that receives a work area containing five different data types and count how many components are not filled. Finally, print result.
" Resolução comentada: -

TYPES: BEGIN OF wa_house,
         city     TYPE string,
         zipcode  TYPE i,
         painted  TYPE abap_bool,
         timezone TYPE t,
         date     TYPE d,
       END OF wa_house.

DATA gs_house TYPE wa_house.

FORM check_missing_data USING us_house TYPE wa_house.
  DATA lv_count TYPE i.

  IF gs_house-city IS INITIAL.
    lv_count = lv_count + 1.
  ENDIF.

  IF gs_house-zipcode IS INITIAL.
    lv_count = lv_count + 1.
  ENDIF.

  IF gs_house-painted IS INITIAL.
    lv_count = lv_count + 1.
  ENDIF.

  IF gs_house-date IS INITIAL.
    lv_count = lv_count + 1.
  ENDIF.

  IF gs_house-timezone IS INITIAL.
    lv_count = lv_count + 1.
  ENDIF.

  WRITE: 'Numero de componente sem dados: ', lv_count.

ENDFORM.

START-OF-SELECTION.

  PERFORM check_missing_data USING gs_house.
  gs_house-city = 'New York'.
  ULINE.

  PERFORM check_missing_data USING gs_house.
  gs_house-zipcode = '12345678'.
  ULINE.

  PERFORM check_missing_data USING gs_house.
  gs_house-painted = abap_true.
  ULINE.

  PERFORM check_missing_data USING gs_house.
  gs_house-date = sy-datum.
  ULINE.

  PERFORM check_missing_data USING gs_house.
  gs_house-timezone = sy-uzeit.
  ULINE.

  PERFORM check_missing_data USING gs_house.



" -------- Exercise 058 --------
" Write an executable program with a routine that receives a work area with at least 4 components. All components can only be declared using numeric and different primitive types. Yourroutine should sum the values from all components and print the result.
" Resolução comentada: -

TYPES: BEGIN OF ty_numbers,
        n_integer TYPE i,
        n_float   TYPE f,
        n_packet  TYPE p LENGTH 3 DECIMALS 2,
        n_numeric TYPE n,
       END OF ty_numbers.

DATA gs_numbers TYPE ty_numbers.

FORM sum_values USING us_numbers TYPE ty_numbers.

  DATA sums TYPE decfloat34.

  sums = us_numbers-n_integer + us_numbers-n_float + us_numbers-n_packet + us_numbers-n_numeric.

  WRITE: sums.
  ULINE.

ENDFORM.

START-OF-SELECTION.

  gs_numbers-n_integer = 10.
  gs_numbers-n_float = '10.61'.
  gs_numbers-n_packet = '1.80'.
  gs_numbers-n_numeric = 5.

  PERFORM sum_values USING gs_numbers.



" -------- Exercise 059 --------
" Write an executable program which has a routine that receives a work area with 3 char
" components and 3 numeric components. The routine should clear some component values
" according to the following rules:
" 1. Clear char components only if the sum of the numeric components is odd (ignoring possible
" decimal places)
" 2. Clear numeric components only if the sum of vowels in the three char components is even
" (ignoring lower/upper case)

" Resolução comentada: -

TYPES: BEGIN OF ty_c_n,
         char_1 TYPE string,
         char_2 TYPE string,
         char_3 TYPE string,
         num_1  TYPE i,
         num_2  TYPE i,
         num_3  TYPE i,
       END OF ty_c_n.

DATA gs_char_number TYPE ty_c_n.

FORM check_char_numeric USING us_c_n TYPE ty_c_n.

  " ---------------- Calculate sum ----------------"

  DATA(sum_nums) = us_c_n-num_1 + us_c_n-num_2 + us_c_n-num_3.

  IF sum_nums MOD 2 <> 0.
    CLEAR us_c_n-char_1.
    CLEAR us_c_n-char_2.
    CLEAR us_c_n-char_3.
  ENDIF.

  " ---------------- Calculate numbers of vowels ----------------"

  DATA: lv_vowels   TYPE i,
        lv_vowels_t TYPE i.

  CONCATENATE us_c_n-char_1 us_c_n-char_2 us_c_n-char_3 INTO DATA(result).

*  TRANSLATE result TO UPPER CASE.

  FIND ALL OCCURRENCES OF 'A|a' IN result MATCH COUNT lv_vowels.
  lv_vowels_t = lv_vowels_t + lv_vowels.

  FIND ALL OCCURRENCES OF 'E|e' IN result MATCH COUNT lv_vowels.
  lv_vowels_t = lv_vowels_t + lv_vowels.

  FIND ALL OCCURRENCES OF 'I|i' IN result MATCH COUNT lv_vowels.
  lv_vowels_t = lv_vowels_t + lv_vowels.

  FIND ALL OCCURRENCES OF 'O|o' IN result MATCH COUNT lv_vowels.
  lv_vowels_t = lv_vowels_t + lv_vowels.

  FIND ALL OCCURRENCES OF 'U|u' IN result MATCH COUNT lv_vowels.
  lv_vowels_t = lv_vowels_t + lv_vowels.

  IF lv_vowels_t MOD 2 EQ 0.
    CLEAR us_c_n-num_1.
    CLEAR us_c_n-num_2.
    CLEAR us_c_n-num_3.
  ENDIF.

ENDFORM.


START-OF-SELECTION.

  gs_char_number-char_1 = 'Flights A'.
  gs_char_number-char_2 = 'American Airline'.
  gs_char_number-char_3 = 'Tokyo City'.
  gs_char_number-num_1 = 4.
  gs_char_number-num_2 = 4.
  gs_char_number-num_3 = 5.

  cl_demo_output=>write( 'Before the form' ).
  cl_demo_output=>display( gs_char_number ).


  PERFORM check_char_numeric USING gs_char_number.

  cl_demo_output=>write( 'After the form' ).
  cl_demo_output=>display( gs_char_number ).



" -------- Exercise 060 --------
" Write an executable program which contains three internal tables (their type must contain at
* least three components of different data types). Each table will have a different type (standard,
* sorted and hashed). Add 3 identical values in each table and view the contents of each table in the
* debugger.

" Resolução comentada: -

TYPES: BEGIN OF ty_internal,
         pn   TYPE p LENGTH 5,
         name TYPE string,
         age  TYPE i,
       END OF ty_internal.

DATA: it_01 TYPE STANDARD TABLE OF ty_internal,
      it_02 TYPE SORTED TABLE OF   ty_internal WITH UNIQUE KEY pn,
      it_03 TYPE HASHED TABLE OF   ty_internal WITH UNIQUE KEY pn.

START-OF-SELECTION.

  DATA wa_internal TYPE ty_internal.

* --- First data entry

  wa_internal-pn = 16345.
  wa_internal-name = 'Lucas Ferreira'.
  wa_internal-age = 23.

  APPEND wa_internal TO it_01.
  INSERT wa_internal INTO TABLE it_02.
  INSERT wa_internal INTO TABLE it_03.

  CLEAR wa_internal.

* --- Second data entry

  wa_internal-pn = 15135.
  wa_internal-name = 'Sommer'.
  wa_internal-age = 22.

  APPEND wa_internal TO it_01.
  INSERT wa_internal INTO TABLE it_02.
  INSERT wa_internal INTO TABLE it_03.

  WRITE: 'Test - Work area with data - ', wa_internal-pn. NEW-LINE.

  CLEAR wa_internal.

  WRITE: 'Test - Work area cleared - ', wa_internal-pn.

* --- Third data entry

  wa_internal-pn = 11234.
  wa_internal-name = 'Jota'.
  wa_internal-age = 18.

  APPEND wa_internal TO it_01.
  INSERT wa_internal INTO TABLE it_02.
  INSERT wa_internal INTO TABLE it_03.

  CLEAR wa_internal.

  BREAK-POINT.