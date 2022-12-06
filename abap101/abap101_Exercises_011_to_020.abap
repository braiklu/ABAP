" -------- Exercise 011 --------
" Declare a table type of integers.
" Resolução comentada: Criação de tabela interna do tipo INTEGER, criação de 2 variáveis ODD e EVEN do tipo lt_integers
" append de numeros nas tabelas ODD e EVEN, mostrar valores com o DEMO_OUTPUT.

TYPES lt_integers TYPE TABLE OF i.

DATA: odd_numbers  TYPE lt_integers,
      even_numbers TYPE lt_integers.

START-OF-SELECTION.

  APPEND: 1 TO odd_numbers,
          3 TO odd_numbers,
          5 TO odd_numbers,
          7 TO odd_numbers.


  APPEND: 2 TO even_numbers,
          4 TO even_numbers,
          6 TO even_numbers,
          8 TO even_numbers.


  cl_demo_output=>display( odd_numbers ).
  cl_demo_output=>display( even_numbers ).



" -------- Exercise 012 --------
" Declare a table type with all components of the global structure SFLIGHT

TYPES t_sflight TYPE TABLE OF sflight.

DATA: lt_flights TYPE t_sflight,
      wa_flights TYPE LINE OF t_sflight. "means that the variable will be of the table line type.

START-OF-SELECTION.

  wa_flights-carrid = 'AA'.
  wa_flights-connid = '013'.
  wa_flights-fldate = '19990219'.
  wa_flights-seatsmax = '330'.

  APPEND wa_flights TO lt_flights.

  wa_flights-carrid = 'AF'.
  wa_flights-connid = '0103'.
  wa_flights-fldate = '19800223'.
  wa_flights-seatsmax = '180'.

  APPEND wa_flights TO lt_flights.

  cl_demo_output=>display( lt_flights ).



" -------- Exercise 013 --------
" Declare a table type using the structure type created in exercise 8.
" Resolução comentada:

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

TYPES table_american TYPE TABLE OF ty_american_flights WITH KEY carrid connid fldate.

DATA lt_american TYPE table_american.
DATA wa_american TYPE LINE OF table_american.

wa_american-carrid = 'AA'.
wa_american-connid = '123'.
wa_american-fldate = '19990219'.
wa_american-currency = 'USD'.

APPEND wa_american TO lt_american.

wa_american-carrid = 'BB'.
wa_american-connid = '0012'.
wa_american-fldate = '20221206'.
wa_american-currency = 'BRL'.

APPEND wa_american TO lt_american.

SORT lt_american by carrid DESCENDING.

cl_demo_output=>display( lt_american ).



" -------- Exercise 014 --------
" Declare a table type with the following components of the table SBOOK: CARRID, CONNID, FLDATE, BOOKID, CUSTOMID but using CUSTOMID as part of the table key.
" Resolução comentada:

TYPES: BEGIN OF ty_book,
         carrid   TYPE sbook-carrid,
         connid   TYPE sbook-connid,
         fldate   TYPE sbook-fldate,
         bookid   TYPE sbook-bookid,
         customid TYPE sbook-customid,
       END OF ty_book.

TYPES table_book TYPE TABLE OF ty_book WITH KEY carrid connid fldate bookid customid.

DATA gt_book TYPE table_book.

BREAK-POINT.



" -------- Exercise 015 --------
" Declare a variable of type character with 10 positions and give it ‘Hello ABAP’ as an initial value.
" Resolução comentada:

DATA celebration TYPE c LENGTH 10.
celebration = 'Hello ABAP'.

"or

DATA celebration TYPE c LENGTH 10 value 'Hello ABAP'.

WRITE celebration.



" -------- Exercise 016 --------
" Declare a variable of numeric type with 4 positions and initial value 1234.
" Resolução comentada:

DATA matricula TYPE i VALUE '1234'.

WRITE matricula.



" -------- Exercise 017 --------
" Declare a variable of type integer with initial value 42.
" Resolução comentada:

DATA idade TYPE i VALUE '42'.

WRITE idade.



" -------- Exercise 018 --------
" Declare a variable of type integer with initial value 12.72.
" Resolução comentada:

DATA pontuacao TYPE i VALUE '12.72'.

WRITE pontuacao.



" -------- Exercise 019 --------
" Declare a variable of type date and give it halloween day.
" Resolução comentada:

DATA halloween_date TYPE d VALUE '20221031'.

WRITE: / 'A data do halloween no ano de 2022: ', halloween_date DD/MM/YYYY.



" -------- Exercise 020 --------
" Declare a packed number variable with 7 decimal places.
" Resolução comentada:

DATA number01 TYPE p LENGTH 10 DECIMALS 7 VALUE '123456789.987654321'.

WRITE number01.