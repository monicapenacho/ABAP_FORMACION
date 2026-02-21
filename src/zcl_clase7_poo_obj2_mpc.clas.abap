CLASS zcl_clase7_poo_obj2_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_clase7_poo_obj2_mpc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.


*  " Forma clásica
*      DATA lo_contrato TYPE REF TO zcl_carga_estructura_der.
*      CREATE OBJECT lo_contrato.
*
*  " Forma moderna
*      DATA lo_contrato TYPE REF TO zcl_carga_estructura_der.
*      lo_contrato = NEW #( ).

    " Forma moderna declarar y crear en una sola línea:
    DATA(lo_contrato2) = NEW zcl_clase7_estructuras_mpc( ).
    DATA lv_proceso TYPE string.

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

    zcl_clase7_estructuras_mpc=>set_cntr_type(
  EXPORTING iv_cntr_type = 'Construccion'
).

    zcl_clase7_estructuras_mpc=>get_cntr_type(
  IMPORTING ev_cntr_type = data(lv_cntr_type)
).


  ENDMETHOD.


ENDCLASS.
