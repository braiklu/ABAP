" -------- Exercise 001 --------
" Declare a TYPE as a character with 10 positions
" Resolução comentada: Variável name do tipo char com tamanho de 10 caracteres.

TYPES name TYPE c LENGTH 10.



" -------- Exercise 002 --------
" Declare an integer
" Resolução comentada: Variável integer_number do tipo inteiro.

DATA integer_number TYPE i.



" -------- Exercise 003 --------
" Declare a type as a number with 7 positions
" Resolução comentada: Variável numerical_number do tipo NUMERICAL (numeric string até 65 mil caracteres - número não-matemático)

TYPES numerical_number TYPE n LENGTH 7.



" -------- Exercise 004 --------
" Declare a date type.
" Resolução comentada: Variável date do tipo DATE (8 caracteres de formato AAAAMMDD)

TYPES date TYPE d.



" -------- Exercise 005 --------
" Declare a time type.
" Resolução comentada: Variável time do tipo TIME (6 caracteres de formato HHMMSS)

TYPES time TYPE t.



" -------- Exercise 006 --------
" Declare a structure type with 5 fields, each field with the same types from exercises 1 to 5.
" Resolução comentada: Declaração de 5 campos do tipo dos exercícios anteriores e a criação de uma estrutura
" com os tipos deles.

TYPES name TYPE c LENGTH 10.
DATA integer_number TYPE i.
TYPES numerical_number TYPE n LENGTH 7.
TYPES date TYPE d.
TYPES time TYPE t.

TYPES: BEGIN OF ty_exercises,
         employee_name TYPE name,
         zipcode       LIKE integer_number,
         registration  TYPE numerical_number,
         birthday_date TYPE date,
         local_time    TYPE time,
       END OF ty_exercises.

"or

TYPES: BEGIN OF ty_exercises,
         name             TYPE c LENGTH 10,
         integer_number   TYPE i,
         numerical_number TYPE n LENGTH 7,
         birthday_date    TYPE d,
         local_time       TYPE t,
       END OF ty_exercises.



" -------- Exercise 007 --------
" Declare a type using the global structure SFLIGHT.
" Resolução comentada: Campo flights_ty do tipo da tabela interna SFLIGHT.

TYPES flights_ty TYPE sflights.



" -------- Exercise 008 --------
" Declare a structure type with the following components of the global structure SFLIGHT: CARRID, CONNID, FLDATE, PRICE, CURRENCY, PLANETYPE, SEATSMAX and SEATSOCC.
" Resolução comentada: Estrutura interna ty_american_flights com os campos iguais a tabela interna standard SFLIGHT.

TYPES: BEGIN OF ty_american_flights,
         carrid       TYPE sflight-carrid,
         connid       TYPE sflight-connid,
         fldate       TYPE sflight-fldate,
         price        TYPE sflight-price,
         currency     TYPE sflight-currency,
         planetype    TYPE sflight-planetype,
         seatsmax     TYPE sflight-seatsmax,
         seatoccupied TYPE sflight-seatsocc,
       END OF ty_american_flights.



" -------- Exercise 009 --------
" Declare a structure type with the following components of the global structure SBOOK: CARRID, CONNID, FLDATE, BOOKID, CUSTOMID.
" Resolução comentada: Estutura com campos do tipo da tabela standard SBOOK.

TYPES: BEGIN OF ty_components_book,
         carrid   TYPE sbook-carrid,
         connid   TYPE sbook-connid,
         fldate   TYPE sbook-fldate,
         bookid   TYPE sbook-bookid,
         customid TYPE sbook-customid,
       END OF ty_components_book.



" -------- Exercise 010 --------
" Declare a structure containing all the fields mentioned in exercises 8 and 9. Check it using the ABAP Debugger.
" Resolução comentada:


TYPES: BEGIN OF ty_merge_book_flights,
         carrid       TYPE sflight-carrid,
         connid       TYPE sflight-connid,
         fldate       TYPE sflight-fldate,
         price        TYPE sflight-price,
         currency     TYPE sflight-currency,
         planetype    TYPE sflight-planetype,
         seatsmax     TYPE sflight-seatsmax,
         seatoccupied TYPE sflight-seatsocc,
         bookid       TYPE sbook-bookid,
         customid     TYPE sbook-customid,
       END OF ty_merge_book_flights.

START-OF-SELECTION.

  DATA record TYPE ty_merge_book_flights.

  BREAK-POINT.