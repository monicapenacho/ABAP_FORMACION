CLASS zcl_clase3_tablas_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CLASE3_TABLAS_MPC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



"===============================================================
    " 1) DEFINICIÓN DE ESTRUCTURA
    "===============================================================
    TYPES: BEGIN OF ty_persona,
             nombre TYPE string,
             edad   TYPE i,
           END OF ty_persona.

    "===============================================================
    " 2) DEFINICIÓN DE TIPO TABLA INTERNA
    "===============================================================
    TYPES: ty_tabla_personas TYPE STANDARD TABLE OF ty_persona WITH EMPTY KEY.




    "===============================================================
    " 3) DECLARACIÓN DE TABLA INTERNA
    "===============================================================
    DATA: lt_personas TYPE ty_tabla_personas,
          ls_persona TYPE ty_persona.


    "===============================================================
    " 4) INSERTAR DATOS EN LA ESTRUCTURA
    "===============================================================

    ls_persona-nombre = 'Juan'.
    ls_persona-edad = 20.

    "===============================================================
    " 5) INSERTAR DATOS EN la tabla interna
    "===============================================================

    INSERT ls_persona INTO lt_personas INDEX 1.

    "===============================================================
    " 4) INSERTAR DATOS EN LA ESTRUCTURA
    "===============================================================

    ls_persona-nombre = 'Mónica'.
    ls_persona-edad = 18.

    "===============================================================
    " 5) INSERTAR DATOS EN la tabla interna
    "===============================================================

    INSERT ls_persona INTO lt_personas INDEX 2.

        "===============================================================
    " 4) INSERTAR DATOS EN LA ESTRUCTURA
    "===============================================================

    ls_persona-nombre = 'Diego'.
    ls_persona-edad = 15.

    "===============================================================
    " 5) INSERTAR DATOS EN la tabla interna
    "===============================================================

    "Forma 1
    INSERT ls_persona INTO lt_personas INDEX 3.

    "Forma 2

        "===============================================================
    " 4) INSERTAR DATOS EN LA ESTRUCTURA
    "===============================================================

    ls_persona-nombre = 'NuevoRegistrotrasindex3'.
    ls_persona-edad = 15.

    "===============================================================
    " 5) INSERTAR DATOS EN la tabla interna
    "===============================================================

    "Forma 1
    INSERT ls_persona INTO lt_personas INDEX 2.

    "Forma 2

    "===============================================================
    " 6) recorrer una tabla interna
    "===============================================================

    "toda la tabla
    out->write( lt_personas ).

    "UNA linea de separación
    out->write( |\n| ).

    "recorrer la tabla (se necesita uno por uno la estrcutra
    LOOP AT lt_personas INTO ls_persona.
    "se muestra la estructura
    out->write( |nombre: { ls_persona-nombre } edad:{ ls_persona-edad }| ).

    ENDLOOP.





  ENDMETHOD.
ENDCLASS.
