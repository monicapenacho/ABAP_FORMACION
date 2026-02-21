CLASS zcl_clase8_poo_obj2_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_clase8_poo_obj2_mpc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.


*  " Forma clásica
*      DATA lo_contrato TYPE REF TO zcl_clase7_poo_fabrica_mpc.
*      CREATE OBJECT lo_contrato.
*
*  " Forma moderna
*      DATA lo_contrato TYPE REF TO zcl_clase7_poo_fabrica_mpc.
*      lo_contrato = NEW #( ).

    " Forma moderna declarar y crear en una sola línea:
    DATA(lo_contrato2) = NEW zcl_clase7_poo_fabrica_mpc( ).
    DATA lv_proceso TYPE string.
*
*" Si quiero traer caracteresiticas de otra fabrica tengo que crear otro objeto
* DATA(lo_contrato1) = NEW zcl_clase8_poo_mpc( ).



    IF lo_contrato2 IS BOUND.

      lo_contrato2->set_cliente(

        EXPORTING
          iv_cliente      = 'experis'
          iv_localizacion = space  "palabra RESERVADA para crear espacio
        IMPORTING
          ev_status = DATA(lv_status)
        CHANGING
        cv_proceso = lv_proceso

      ).

      lo_contrato2->get_cliente(
        IMPORTING
          ev_cliente = DATA(lv_cliente)
      ).

      lo_contrato2->region = 'EU'.

    ENDIF.

    out->write(
    |{ lv_cliente } - { lv_status } - { lv_proceso } - { lo_contrato2->region }|
    ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Propiedades de la clase

        zcl_clase7_poo_fabrica_mpc=>set_cntr_type(
      EXPORTING iv_cntr_type = 'Construccion'
    ).

        zcl_clase7_poo_fabrica_mpc=>get_cntr_type(
      IMPORTING ev_cntr_type = data(lv_cntr_type)
    ).


    out->write( lv_cntr_type ).

*********************************************************
* CLASE 8 MEOTODO FUNCIONAL
**********************************************************************
"FORMA 1
*    lo_contrato2->get_cliente_name(
*      EXPORTING
*        iv_cliente_id = '01'
*      RECEIVING
*        rv_cliente_name = DATA(lv_cliente_name)
*    ).

"FORMA 2***
   DATA(lv_cliente_name) = lo_contrato2->get_cliente_name( EXPORTING iv_cliente_id = '02' ).

*   "segundo objeto con el método creado en la fabirca 2
*    DATA(lv_cliente_name) = lo_contrato1->get_cliente_name( EXPORTING iv_cliente_id = '02' ).

" CONDICIONAL Si existe un nombre para el cliente '01', lo escribo en la salida.
IF NOT lo_contrato2->get_cliente_name( iv_cliente_id = '01' ) IS INITIAL.
  out->write(
    lo_contrato2->get_cliente_name( iv_cliente_id = '01' )
  ).
ENDIF.


  ENDMETHOD.


ENDCLASS.
