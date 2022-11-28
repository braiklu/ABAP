REPORT zlbf2.

" Programa para printar o maior número inserido no parameters.
SELECTION-SCREEN BEGIN OF BLOCK bloco1 WITH FRAME TITLE TEXT-id1.
  PARAMETERS: number_1 TYPE i,
              number_2 TYPE i,
              number_3 TYPE i.
SELECTION-SCREEN END OF BLOCK bloco1.

DATA: t_numbers TYPE TABLE OF i.

APPEND number_1 TO t_numbers.
APPEND number_2 TO t_numbers.
APPEND number_3 TO t_numbers.

SORT t_numbers DESCENDING.

READ TABLE t_numbers INDEX 1 INTO DATA(response).
WRITE response.