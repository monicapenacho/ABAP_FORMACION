CLASS zcl_clase1_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CLASE1_MPC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



*    data lv_decimal type p length 3 decimals 2 value '444.4444'.
*  OUT->WRITE( lv_decimal ).
*
*    types: begin of lty_empleado,
*        id type i,
*         nombre type string,
*         edad type i,
*     end of lty_empleado.
*
*
*    Data ls_empleado type lty_empleado.
*
*
*    ls_empleado = value #( id = 1234
*            nombre = 'Laura'
*            edad = 25 ).
*           " out->write( ls_empleado  )  .
*     out->write( | ID: { ls_empleado-id } name : { ls_empleado-nombre }  | ).

*data(lv_date) = '20260210'.
*out->write( lv_date ).
*
*data(lv_date2) = conv d( lv_date ).
*out->write( lv_date2 ).
*
*data lo_ref type ref to zcl_pc_cds.

    DATA: lv_string_a TYPE string VALUE 'Welcome to Logali Group',
          lv_string_b TYPE string.

    "---------------------------------------
    " 1️⃣ Concatenación con operador &&
    "---------------------------------------
    lv_string_b = 'ABAP' && ` ` && 'Student'.

    CONCATENATE lv_string_a lv_string_b
      INTO DATA(lv_fin_string) "creo de manera lineal la variable
      SEPARATED BY space.

    out->write( |Concatenation 1: { lv_fin_string }| ).


    "---------------------------------------
    " 2️⃣ CONCATENATE respetando espacios
    "---------------------------------------
    CONCATENATE 'x' 'y' 'z'
      INTO DATA(lv_string_c)
      RESPECTING BLANKS.

    out->write( |Concatenation 2: { lv_string_c }| ).


    "---------------------------------------
    " 3️⃣ String Template (forma moderna)
    "---------------------------------------
    DATA(lv_fin_string2) =
      |Concatenation 3: { lv_string_a } / { lv_string_b }|.

    out->write( lv_fin_string2 ).


  ENDMETHOD.
ENDCLASS.
