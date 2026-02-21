*********************************************************
* CLASE 8
**********************************************************************


CLASS zcl_clase8_poo_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.





    METHODS get_cliente_name
  IMPORTING iv_cliente_id TYPE string
  RETURNING VALUE(rv_cliente_name) TYPE string.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_clase8_poo_mpc IMPLEMENTATION.






  METHOD get_cliente_name.


  CASE iv_cliente_id.

    WHEN '01'.
      rv_cliente_name = 'Nombre del cliente 01'.

    WHEN '02'.
      rv_cliente_name = 'Nombre del cliente 02'.

    WHEN OTHERS.
      rv_cliente_name = 'Cliente no encontrado'.

  ENDCASE.

  ENDMETHOD.

ENDCLASS.
