" -------- Exercise 031 --------
" Declare a constant which contains your name.
" Resolução comentada: -

CONSTANTS: my_name TYPE string VALUE 'Lucas Ferreira'.

WRITE: 'Meu nome é:', /, my_name.



" -------- Exercise 032 --------
" Declare two constants which contain the values 'X' (true) and ' ' (false).
" Note: This is a common practice as ABAP does not contain a boolean primitive type.
" Resolução comentada: -

CONSTANTS: verdadeiro TYPE c LENGTH 1 VALUE 'X',
           falso      TYPE c LENGTH 1 VALUE ' '.

WRITE: 'O numero 2 é par: ', verdadeiro,
/, 'O numero 2 é impar: ', falso.



" -------- Exercise 033 --------
" Declare a constants which contains the 5 first decimals of Pi.
" Resolução comentada: -

CONSTANTS pi_number TYPE p DECIMALS 5 VALUE '3.141592653589'.

WRITE pi_number.



" -------- Exercise 034 --------
" Declare a work area of constants. All components must be integers.
" Resolução comentada: -

CONSTANTS: n_01 TYPE i VALUE '1',
           n_02 TYPE i VALUE '2',
           n_03 TYPE i VALUE '3',
           n_04 TYPE i VALUE '4'.



" -------- Exercise 035 --------
" declare a work area of 5 constant components. All of them should have different primitive types.
" Resolução comentada: -

CONSTANTS: BEGIN OF ty_constants,
             phonenumber TYPE i VALUE '40028922',
             my_name     TYPE string VALUE 'Lucas Ferreira',
             time        TYPE t VALUE '164353',
             married     TYPE c VALUE 'X',
             delivery    TYPE p LENGTH 7 VALUE '1237654',
           END OF ty_constants.

BREAK-POINT.



" -------- Exercise 036 --------
" Is it possible to declare an internal table of constants?
" Resolução comentada: -

" No. No initial value can be specified for internal tables and references



" -------- Exercise 038 --------
" Declare a constant which type is the same of another constant.
" Resolução comentada: -

CONSTANTS: bh_zip TYPE p LENGTH 8 VALUE '30445456',
           sp_zip LIKE bh_zip VALUE '12345678'.

WRITE: 'O zipCode de BH é: ', bh_zip,
/, 'O zipCode de SP é: ', sp_zip.



" -------- Exercise 039 --------
" Declare a type which is used in another type, variable, work area, internal table and constant.
" Resolução comentada: -

TYPES ty_global TYPE c.

TYPES ty_01 TYPE ty_global. "type

DATA ty_02 TYPE ty_global. "variable

TYPES: BEGIN OF ty_03, "W.A.
         name     TYPE string,
         under_18 TYPE ty_global,
         marries  TYPE ty_global,
       END OF ty_03.

DATA ty_04 TYPE TABLE OF ty_03. "internal table

CONSTANTS ty_05 TYPE ty_global VALUE 'x'. "constant

BREAK-POINT.



" -------- Exercise 040 --------
" Declare a variable which is used in another variable, type, work area, internal table and constant.
" Resolução comentada: -

DATA name TYPE string.

DATA employee_name TYPE name.

TYPES dog_name TYPE name.

TYPES: BEGIN OF ty_name,
         father_name    TYPE name,
         mom_name       TYPE name,
         still_together TYPE abap_bool,
       END OF ty_name.

DATA marriage TYPE TABLE OF ty_name.

CONSTANTS pc_name TYPE name VALUE 'BRAIK-pc'.

BREAK-POINT.