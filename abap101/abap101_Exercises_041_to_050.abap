" -------- Exercise 041 --------
" Write an executable program that performs the following calculation: 2 + 3 * 5
" Resolução comentada: -

CONSTANTS: n01 TYPE i VALUE 2,
           n02 TYPE i VALUE 3,
           n03 TYPE i VALUE 5.

DATA: calculation TYPE i.

START-OF-SELECTION.

calculation = n01 + n02 * n03.

WRITE: calculation.



" -------- Exercise 042 --------
" Write an executable program that get two integers inside variables and perform the addition, subtraction, multiplication, division and power between them.
" Resolução comentada: -

CONSTANTS: n01 TYPE i VALUE 50,
           n02 TYPE i VALUE 10,
           n03 TYPE i VALUE 2.

DATA: add   TYPE i,
      sub   TYPE i,
      multi TYPE i,
      div   TYPE i,
      power TYPE i.

START-OF-SELECTION.

  add   = n01 + n02.
  sub   = n01 - n02.
  multi = n01 * n02.
  div   = n01 / n02.
  power = n01 ** n03.

  WRITE: 'Adição: ', add  ,/,
         'Subs : ', sub  ,/,
         'Multi: ', multi,/,
         'Divisão: ', div  ,/,
         'Potencia: ', power,/.



" -------- Exercise 043 --------
" Write an executable program that get two integers inside parameters and perform the addition, subtraction, multiplication, division and power between them.
" Resolução comentada: -

PARAMETERS: num01 TYPE i,
            num02 TYPE i.

DATA: add   TYPE i,
      sub   TYPE i,
      multi TYPE i,
      div   TYPE i,
      power TYPE i.

START-OF-SELECTION.

  add   = num01 + num02.
  sub   = num01 - num02.
  multi = num01 * num02.
  div   = num01 / num02.
  power = num01 ** num02.

  WRITE: 'O primeiro numero é: ', num01, /,
         'O segundo numero é: ', num02, /,
         'Com isso, seguem as seguintes operacoes: ', /,
         'Adição: ', add  ,/,
         'Subs : ', sub  ,/,
         'Multi: ', multi,/,
         'Divisão: ', div  ,/,
         'Potencia: ', power,/.



" -------- Exercise 044 --------
" Write an executable program that concatenates two words and write the result.
" Resolução comentada: -

PARAMETERS: name  TYPE string,
            lastn TYPE string.

DATA: result TYPE string.

START-OF-SELECTION.

  CONCATENATE name lastn INTO result SEPARATED BY space.

  WRITE: 'O nome do colaborador é > ', result.



" -------- Exercise 045 --------
" Write an executable program that concatenates two words and the current month, separating each part by a "-" and write the result.
" Resolução comentada: -

PARAMETERS: name  TYPE string,
            lastn TYPE string.

DATA: result  TYPE string.

* O valor de sy-datum é no formato YYYY/MM/DD.
* Codando 'sy-datum + 4' significa que ele vai avançar 4 casas do valor.
* O numeral 2 entre parenteses significa que ele irá escrever as próximas 2 casas do formato.

CONCATENATE name lastn sy-datum+4(2) INTO result SEPARATED BY '-'.

WRITE: result.



" -------- Exercise 046 --------
" Write an executable program that reads the current system date and write it in your language in text format.
" Ex: 20140727 should be written as July the Twenty-Seventh, 2014
" Resolução comentada: -

DATA: gv_day   TYPE string,
      gv_month TYPE string,
      gv_year  TYPE string.

START-OF-SELECTION.

  CASE sy-datum+4(2).
    WHEN '01'.
      gv_month = 'January'.
    WHEN '02'.
      gv_month = 'February'.
    WHEN '03'.
      gv_month = 'March'.
    WHEN '04'.
      gv_month = 'April'.
    WHEN '05'.
      gv_month = 'May'.
    WHEN '06'.
      gv_month = 'June'.
    WHEN '07'.
      gv_month = 'July'.
    WHEN '08'.
      gv_month = 'August'.
    WHEN '09'.
      gv_month = 'September'.
    WHEN '10'.
      gv_month = 'October'.
    WHEN '11'.
      gv_month = 'November'.
    WHEN '12'.
      gv_month = 'December'.
  ENDCASE.
* Handle day
  IF sy-datum+6(2) = '01'.
    gv_day = 'first'.
  ELSEIF sy-datum+6(2) = '02'.
    gv_day = 'second'.
  ELSEIF sy-datum+6(2) = '03'.
    gv_day = 'third'.
  ELSE. " 04-31
    IF sy-datum+6(2) BETWEEN 04 AND 19. " 04-19
      CASE sy-datum+6(2).
        WHEN '04'.
          gv_day = 'four'.
        WHEN '05'.
          gv_day = 'fif'.
        WHEN '06'.
          gv_day = 'six'.
        WHEN '07'.
          gv_day = 'seven'.
        WHEN '08'.
          gv_day = 'eigh'.
        WHEN '09'.
          gv_day = 'nin'.
        WHEN '10'.
          gv_day = 'ten'.
        WHEN '11'.
          gv_day = 'eleven'.
        WHEN '12'.
          gv_day = 'twelf'.
        WHEN '13'.
          gv_day = 'thirteen'.
        WHEN '14'.
          gv_day = 'fourteen'.
        WHEN '15'.
          gv_day = 'fitteen'.
        WHEN '16'.
          gv_day = 'sixteen'.
        WHEN '17'.
          gv_day = 'seventeen'.
        WHEN '18'.
          gv_day = 'eighteen'.
        WHEN '19'.
          gv_day = 'nineteen'.
      ENDCASE.
      CONCATENATE gv_day 'th' INTO gv_day.
    ELSE.

      CASE sy-datum+6(2). " 20-31
        WHEN '20'.
          gv_day = 'twentieth'.
        WHEN '21'.
          gv_day = 'twenty-first'.
        WHEN '22'.
          gv_day = 'twenty-second'.
        WHEN '23'.
          gv_day = 'twenty-third'.
        WHEN '24'.
          gv_day = 'twenty-fourth'.
        WHEN '25'.
          gv_day = 'twenty-fifth'.
        WHEN '26'.
          gv_day = 'twenty-six'.
        WHEN '27'.
          gv_day = 'twenty-seventh'.
        WHEN '28'.
          gv_day = 'twenty-eighth'.
        WHEN '29'.
          gv_day = 'twenty-first'.
        WHEN '30'.
          gv_day = 'thirtieth'.
        WHEN '31'.
          gv_day = 'thirty-first'.
      ENDCASE.
    ENDIF.
  ENDIF.

  gv_year = sy-datum(4).

  WRITE: gv_month, ' the ', gv_day, ', ', gv_year, /.



" -------- Exercise 047 --------
" Write an executable program that reads the current system time and write the time in 4 different zones.
" Resolução comentada: -

DATA: time_1 TYPE t,
      time_2 TYPE t,
      time_3 TYPE t,
      time_4 TYPE t.

START-OF-SELECTION.

time_1 = sy-uzeit.
time_2 = sy-uzeit + 10800.
time_3 = sy-uzeit + 28800.
time_4 = sy-uzeit + 25200.

WRITE /(60) time_1 USING EDIT MASK 'The time in Brasilia is: __:__:__'. NEW-LINE.
WRITE /(60) time_2 USING EDIT MASK 'The time in Moscow is: __:__:__'. NEW-LINE.
WRITE /(60) time_3 USING EDIT MASK 'The time in Dubai is: __:__:__'. NEW-LINE.
WRITE /(60) time_4 USING EDIT MASK 'The time in Delhi is: __:__:__'.



" -------- Exercise 048 --------
" Write an executable program that counts how many vowels are in the name of the user running the program and print the result.
" Resolução comentada: -

DATA: gv_vowels   TYPE i,
      gv_vowels_t TYPE i.

PARAMETERS name TYPE string.

START-OF-SELECTION.

  TRANSLATE name TO UPPER CASE.

  FIND ALL OCCURRENCES OF 'A' IN name MATCH COUNT gv_vowels.
  gv_vowels_t = gv_vowels_t + gv_vowels.

  FIND ALL OCCURRENCES OF 'E' IN name MATCH COUNT gv_vowels.
  gv_vowels_t = gv_vowels_t + gv_vowels.

  FIND ALL OCCURRENCES OF 'I' IN name MATCH COUNT gv_vowels.
  gv_vowels_t = gv_vowels_t + gv_vowels.

  FIND ALL OCCURRENCES OF 'O' IN name MATCH COUNT gv_vowels.
  gv_vowels_t = gv_vowels_t + gv_vowels.

  FIND ALL OCCURRENCES OF 'U' IN name MATCH COUNT gv_vowels.
  gv_vowels_t = gv_vowels_t + gv_vowels.


  WRITE: 'There are ', gv_vowels_t, ' vowels in the name'.




" -------- Exercise 049 --------
" Write an executable program that counts a string length and if it's bigger than 2o characteres, write 'Too big'. If not, write the string length
" Resolução comentada: -

DATA gv_lenght TYPE i.

PARAMETERS name TYPE string.


START-OF-SELECTION.

  gv_lenght = strlen( name ).

  IF gv_lenght > 20.
    WRITE 'Too big!'.
  ELSE.
    WRITE: 'The name has a length of ', gv_lenght.
  ENDIF.



" -------- Exercise 050 --------
" Write an executable program that counts from 1 to 100 and for each multiple of 8, write the message: "The number [number] is a multiple of 8 ".
" Resolução comentada: -

DATA num TYPE i.

num = 0.

DO 100 TIMES.
  num = num + 1.

  IF num MOD 8 = 0.
    WRITE: 'The number ', num, ' is a multiple of 8'. NEW-LINE.
  ELSE.
    WRITE num. NEW-LINE.
  ENDIF.
ENDDO.