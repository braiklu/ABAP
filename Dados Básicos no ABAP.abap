REPORT zlbf1_exemplo.

" ------------------------- c - Text ------------------------- "

DATA: text01     TYPE c LENGTH 05,
      text02     TYPE c LENGTH 08,
      text_final TYPE string.

text01 = 'Lucas'.
text02 = 'Braich'.

CONCATENATE text01 text02 INTO text_final SEPARATED BY space.

WRITE text_final.


" ------------------------- n - Numeric Text Field ------------------------- "

DATA: number01 TYPE n LENGTH 02,
      number02 TYPE n LENGTH 04,
      number03 TYPE n LENGTH 09.

number01 = 23.
number02 = 1500.
number03 = number01 * number02.

WRITE number03.


" ------------------------- d - Date Field ------------------------- "

DATA: date01   TYPE d,
      date_br  TYPE c LENGTH 08,
      date_br2 TYPE c LENGTH 10.

date01 = '20171020'.
date_br = date01.

CONCATENATE date_br+06(02) date_br+04(02) date_br(04) INTO date_br2 SEPARATED BY '.'.

WRITE: date01, sy-datum, date_br2. "sy-datum é a data atual do sistema


" ------------------------- T - Time Field ------------------------- "

DATA: time01 TYPE t.

time01 = sy-uzeit.

WRITE time01.


" ------------------------- h - Hexadecimal ------------------------- "


" ------------------------- p - Packed Number ------------------------- "

DATA: pnumber01 TYPE p DECIMALS 3.

pnumber01 = '10.315'.

WRITE pnumber01.


" ------------------------- i - Integer ------------------------- "

DATA: integer01 TYPE i.

integer01 = '2555' + '455'.

WRITE integer01.

" ------------------------- f - float ------------------------- "

DATA: fnumber01 TYPE f.

fnumber01 = '10.25'.

WRITE fnumber01.