""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CARGA DE DATOS EN ESTRUCTURA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

CLASS zcl_clase7_estructuras_mpc DEFINITION

  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-DATA moneda TYPE c LENGTH 3.
    DATA region TYPE string.

    METHODS set_cliente
      IMPORTING iv_cliente      TYPE string
                iv_localizacion TYPE string
      EXPORTING ev_status       TYPE string
      CHANGING  cv_proceso      TYPE string.

    "///////////////////////////

       METHODS get_cliente
      EXPORTING ev_cliente TYPE string.
    "////////////////////////


    CLASS-METHODS:
      set_cntr_type
        IMPORTING iv_cntr_type TYPE string,
      get_cntr_type
        EXPORTING ev_cntr_type TYPE string.



  PROTECTED SECTION.
    DATA creacion_fecha TYPE sydate.

  PRIVATE SECTION.

    DATA cliente TYPE string.
    CLASS-DATA cntr_type TYPE string.

ENDCLASS.



CLASS zcl_clase7_estructuras_mpc IMPLEMENTATION.


  METHOD set_cliente.

    cliente = iv_cliente .
    ev_status = 'ok'.
    cv_proceso = 'Started'.

  ENDMETHOD.

  METHOD get_cliente.

    ev_cliente = cliente.

  ENDMETHOD.


  METHOD get_cntr_type.

    ev_cntr_type = cntr_type.

  ENDMETHOD.


  METHOD set_cntr_type.

    cntr_type = iv_cntr_type.

  ENDMETHOD.

ENDCLASS.


