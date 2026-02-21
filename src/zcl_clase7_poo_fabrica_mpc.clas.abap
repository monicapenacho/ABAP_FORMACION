CLASS zcl_clase7_poo_fabrica_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    types: begin of ty_address, "clase 8 autoreferencia
         country     type string,
         city        type string,
         postal_code type string,
         region      type string,
         street      type string,
         number      type string,
       end of ty_address,
       tty_address type table of ty_address.

    METHODS set_address IMPORTING it_address TYPE tty_address.


    CLASS-DATA moneda TYPE c LENGTH 3.
    DATA region TYPE string.

    METHODS set_cliente
      IMPORTING
        iv_cliente      TYPE string
        iv_localizacion TYPE string
      EXPORTING
        ev_status       TYPE string
      CHANGING
        cv_proceso      TYPE string.

    METHODS get_cliente
      EXPORTING
        ev_cliente TYPE string.

    CLASS-METHODS:
      set_cntr_type
        IMPORTING iv_cntr_type TYPE string,
      get_cntr_type
        EXPORTING ev_cntr_type TYPE string.

  METHODS get_cliente_name " clase8 Método funcIonal
  IMPORTING iv_cliente_id TYPE string
  RETURNING VALUE(rv_cliente_name) TYPE string.

  METHODS set_sales_org "clase 8 Autoreferencia
  IMPORTING sales_org TYPE string.

  METHODS get_sales_org "clase 8 Autoreferencia
  EXPORTING sales_org TYPE string.

    PROTECTED SECTION.
      DATA creacion_fecha TYPE sydate.

    PRIVATE SECTION.
      DATA cliente TYPE string.
      CLASS-DATA cntr_type TYPE string.
      DATA sales_org TYPE string. "clase 8 Autoreferencia

ENDCLASS.



CLASS zcl_clase7_poo_fabrica_mpc IMPLEMENTATION.


  METHOD set_cliente.
    cliente    = iv_cliente.
    ev_status  = 'OK'.
    cv_proceso = 'Started'.
  ENDMETHOD.

  METHOD get_cliente.
    ev_cliente = cliente.
  ENDMETHOD.

  METHOD set_cntr_type.
    cntr_type = iv_cntr_type.
  ENDMETHOD.

  METHOD get_cntr_type.
    ev_cntr_type = cntr_type.
  ENDMETHOD.


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  METHOD get_cliente_name. " clase8 Método funconal


  CASE iv_cliente_id.

    WHEN '01'.
      rv_cliente_name = 'Nombre del cliente 01'.

    WHEN '02'.
      rv_cliente_name = 'Nombre del cliente 02'.

    WHEN OTHERS.
      rv_cliente_name = 'Cliente no encontrado'.

  ENDCASE.

  ENDMETHOD.



  METHOD get_sales_org. "clase 8 autoreferencia me

    sales_org = me->sales_org.

  ENDMETHOD.

  METHOD set_sales_org.   "clase 8 autoreferencia me


     me->sales_org = sales_org.


  ENDMETHOD.

  METHOD set_address.  "clase 8 autoreferencia
    me->sales_org = sales_org.
    me->set_address( it_address = value #( ( country = 'es' ) ) ).


  ENDMETHOD.

ENDCLASS.
