CLASS zcl_pc_structure DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PC_STRUCTURE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Definición variable
  DATA connection TYPE REF TO lcl_connection.
*Declarar una tabla interna
  DATA connections TYPE TABLE OF REF TO lcl_connection.

*Instancia 1
**********************************************************************
  TRY.
   connection = NEW #(
         i_carrier_id = 'LH'
         i_connection_id = '0400'
                  ).
     APPEND connection TO connections.
   CATCH cx_abap_invalid_value.
     out->write( `Method call failed` ).
  ENDTRY.

*Instancia 2
**********************************************************************
  TRY.
   connection = NEW #(
            i_carrier_id = 'AA'
            i_connection_id = '0017'
                  ).
      APPEND connection TO connections.
    CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
  ENDTRY.

*Instancia 3
**********************************************************************
  TRY.
   connection = NEW #(
            i_carrier_id = 'SQ'
            i_connection_id = '0001'
                 ).
      APPEND connection TO connections.
    CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
  ENDTRY.

*Llamada a método funcional
**********************************************************************
  LOOP AT connections INTO connection.
    out->write( connection->get_output( ) ).
  ENDLOOP.

  ENDMETHOD.
ENDCLASS.
