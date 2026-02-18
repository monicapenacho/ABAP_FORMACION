CLASS zcl_pc_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PC_COMPUTE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Declarar variables
**********************************************************************
    DATA number1 TYPE i.
    DATA number2 TYPE i.
    DATA result TYPE p LENGTH 8 DECIMALS 2.

*Asignar valor a las variables
**********************************************************************
   number1 = -8.
   number2 = 3.

*Implementar ratio
**********************************************************************
*   DATA(result) = number1 / number2. "with inline declaration
    result = number1 / number2.

*Implementar string
**********************************************************************
   DATA(output) = | { number1 } / { number2 } = { result  }|.

*Escribir en consola
**********************************************************************
    out->write( output ).


  ENDMETHOD.
ENDCLASS.
