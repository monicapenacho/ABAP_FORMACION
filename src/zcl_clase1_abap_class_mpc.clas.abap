CLASS zcl_clase1_abap_class_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

ENDCLASS.



CLASS ZCL_CLASE1_ABAP_CLASS_MPC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    out->write( '16) TIPOS ABAP CLASS' ).
    out->write( 'Demo mínima funcionando en ABAP Cloud' ).

  ENDMETHOD.
ENDCLASS.
