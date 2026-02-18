CLASS zcl_pc_branch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PC_BRANCH IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Declaración variables
**********************************************************************
    DATA number1 TYPE i.
    DATA number2 TYPE i.
    DATA result TYPE p LENGTH 8 DECIMALS 2.
    DATA op TYPE c LENGTH 1.
    DATA output TYPE string.

*Input Values
**********************************************************************
   number1 = 1.
   number2 = 2.
   op = '%'.

*Calculation
**********************************************************************
CASE op.
    WHEN '+'.
     result = number1 + number2.
    WHEN '-'.
     result = number1 - number2.
    WHEN '*'.
     result = number1 * number2.
    WHEN '/'.
*Handle Division by Zero
      TRY.
        result = number1 / number2.
       CATCH cx_sy_zerodivide.
        output = |Division by zero is not definided|.
      ENDTRY.

*Handle Invalid Operator
    WHEN OTHERS.
     output = |'{ op }' is not a valid operator!|.


ENDCASE.

*Implementar string: Control para no sobrescribir errores
**********************************************************************
    IF output IS INITIAL. "no error so far
        output = | { number1 } { op } { number2 } = { result  }|.
    ENDIF.

*Output (consola)
**********************************************************************
    out->write( output ).


  ENDMETHOD.
ENDCLASS.
