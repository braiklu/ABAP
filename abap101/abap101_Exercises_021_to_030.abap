" -------- Exercise 021 --------
" Declare a variable of type S_CARR_ID.
" Resolução comentada: O tipo S_CARR_ID é consultado na tabela SFLIGHT, na coluna Data Element.

DATA carr_id TYPE s_carr_id.



" -------- Exercise 022 --------
" Declare a variable of the same type of field carrid from table SPFLI
" Resolução comentada: 

DATA airline_id TYPE spfli-carrid.



" -------- Exercise 023 --------
" Declare a variable of the same type of field FLDATE table SFLIGHT.
" Resolução comentada:

DATA date_flight TYPE sflight-fldate.



" -------- Exercise 024 --------
" Declare a structure of the same type of SBOOK.
" Resolução comentada:


DATA gs_flights_books TYPE sbook.

BREAK-POINT. "Verificar no debug como está a estrutura.



" -------- Exercise 025 --------
" Declare a structure with fields of the table SFLIGHT carrid, CONNID, FLDATE, PRICE, CURRENCY, PLANETYPE, and SEATSMAX
" Resolução comentada:

TYPES: BEGIN OF ty_s_flights,
         carrid    TYPE sflight-carrid,
         connid    TYPE sflight-connid,
         fldate    TYPE sflight-fldate,
         price     TYPE sflight-price,
         currency  TYPE sflight-currency,
         planetype TYPE sflight-planetype,
         seatsmax  TYPE sflight-seatsmax,
         seatsocc  TYPE sflight-seatsocc,
       END OF ty_s_flights.

DATA gs_flights TYPE ty_s_flights.

BREAK-POINT.



" -------- Exercise 026 --------
" Declare a structure with all fields of the table SBOOK and the field TELEPHONE from SCUSTOM table.
" Resolução comentada:

DATA: BEGIN OF gs_book_and_phone.

        INCLUDE STRUCTURE sbook.
DATA phone TYPE scustom-telephone.

DATA END OF gs_book_and_phone.

BREAK-POINT.



" -------- Exercise 027 --------
" Declare an internal table with fields of the table SBOOK CARRID, CONNID, FLDATE, BOOKID, CUSTOMID.
" Resolução comentada:

TYPES: BEGIN OF ty_comp_sbook,
         carrid   TYPE sbook-carrid,
         connid   TYPE sbook-connid,
         fldate   TYPE sbook-fldate,
         bookid   TYPE sbook-bookid,
         customid TYPE sbook-customid,
       END OF ty_comp_sbook.

DATA gt_book TYPE TABLE OF ty_comp_sbook WITH KEY carrid connid bookid.

BREAK-POINT.



" -------- Exercise 028 --------
" Declare an internal table with all table fields from table SCARR.
" Resolução comentada:

DATA itab_carr TYPE TABLE OF scarr.

BREAK-POINT.



" -------- Exercise 029 --------
" Declare an internal table with all table fields SPFLI.
" Resolução comentada:


DATA itab_pfli TYPE STANDARD TABLE OF spfli.

BREAK-POINT.



" -------- Exercise 030 --------
" Declare an internal table with all table fields from SCARR and the field TELEPHONE from table SCUSTOM.
" Resolução comentada:

TYPES: BEGIN OF ty_global.
         INCLUDE STRUCTURE scarr.
TYPES phone TYPE scustom-telephone.
TYPES END OF ty_global.

DATA itab_global TYPE TABLE OF ty_global WITH KEY carrid.

BREAK-POINT.