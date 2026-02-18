CLASS zcl_pc_instances DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PC_INSTANCES IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Definición variable
  DATA connection TYPE REF TO lcl_connection.
*Declarar una tabla interna
  DATA connections TYPE TABLE OF REF TO lcl_connection.

*Crear el objeto

  connection = new #( ).

*Valor atributos

   connection->carrier_id = 'LH'.
   connection->connection_id = '0400'.

*Añadir fila a tabla interna
    APPEND connection TO connections.

*Crear más instancias
**********************************************************************
connection = NEW #( ).
connection->carrier_id = 'AA'.
connection->connection_id = '0017'.
APPEND connection TO connections.

connection = NEW #( ).
connection->carrier_id = 'SQ'.
connection->connection_id = '0001'.
APPEND connection TO connections.



  ENDMETHOD.
ENDCLASS.
