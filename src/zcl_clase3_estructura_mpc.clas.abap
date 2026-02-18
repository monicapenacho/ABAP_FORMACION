CLASS zcl_clase3_estructura_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CLASE3_ESTRUCTURA_MPC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  "/////////////////////////////////////////////////////////////////////
                    "TIPOS ESTRUCTURA EN ABAP CLOUD
  "/////////////////////////////////////////////////////////////////////
      "===============================================================
    " 1) DEFINICIÓN DE TIPO ESTRUCTURADO (TYPE STRUCT)
    "===============================================================
    " Creamos un tipo propio llamado ty_persona

    TYPES: BEGIN OF ty_persona,
             nombre   TYPE string,
             edad     TYPE i,
             telefono TYPE string,
             estado TYPE string ,
           END OF ty_persona.

    " Si queremos incluir el valor junto con el tipo y data

     DATA: BEGIN OF ls_cliente,
             nombre   TYPE string,
             edad     TYPE i value 5,
             telefono TYPE string,
             estado TYPE string ,
           END OF ls_cliente.





    "===============================================================
    " 2) DECLARACIÓN DE VARIABLE DEL TIPO CREADO
    "===============================================================

    "Clásico

    DATA ls_persona TYPE ty_persona.

    "Cloud

    DATA(ls_empleado) = VALUE ty_persona( nombre = 'Daniel' edad = 30 telefono = '600123456' ).

    "===============================================================
    " 3) ASIGNACIÓN DE VALORES A LA ESTRUCTURA
    "===============================================================

     "Clásico

    ls_persona-nombre   = 'Daniel'.
    ls_persona-edad     = 30.
    ls_persona-telefono = '600123456'.

    "===============================================================
    " 4) MOSTRAR RESULTADO EN CONSOLA ADT
    "===============================================================
    out->write( '--- DEMO STRUCT EN ABAP CLOUD ---' ).
    out->write( |Nombre: { ls_persona-nombre }| ).
    out->write( |Edad: { ls_persona-edad }| ).
    out->write( |Teléfono: { ls_persona-telefono }| ).

  "/////////////////////////////////////////////////////////////////////
                    "ESTRUCTURA ANIDADA EN ABAP CLOUD
"/////////////////////////////////////////////////////////////////////




    "===============================================================
    " 1) DEFINICIÓN DE ESTRUCTURA ANIDADA
    "===============================================================
    " Creamos una estructura principal que contiene
    " otras estructuras dentro (info, address, position)

    DATA: BEGIN OF ls_empl_info,

            BEGIN OF info,
              id         TYPE i VALUE 12345,
              first_name TYPE string VALUE 'Laura',
              last_name  TYPE string VALUE 'Martínez',
            END OF info,

            BEGIN OF address,
              city    TYPE string VALUE 'Frankfurt',
              street  TYPE string VALUE '123 Main Street',
              country TYPE string VALUE 'Germany',
            END OF address,

            BEGIN OF position,
              department TYPE string VALUE 'IT',
              salary     TYPE p DECIMALS 2 VALUE '2000.23',
            END OF position,

          END OF ls_empl_info.



    "===============================================================
    " 2) ACCESO A CAMPOS DE ESTRUCTURA ANIDADA
    "===============================================================
    " Accedemos usando notación con guiones:
    " estructura-subestructura-campo

    out->write( '--- DEMO ESTRUCTURA ANIDADA ---' ).

    out->write( ls_empl_info ).

*    out->write( |ID: { ls_empl_info-info-id }| ).
*    out->write( |Nombre: { ls_empl_info-info-first_name }| ).
*    out->write( |Apellido: { ls_empl_info-info-last_name }| ).
*
*    out->write( |Ciudad: { ls_empl_info-address-city }| ).
*    out->write( |Calle: { ls_empl_info-address-street }| ).
*    out->write( |País: { ls_empl_info-address-country }| ).
*
*    out->write( |Departamento: { ls_empl_info-position-department }| ).
*    out->write( |Salario: { ls_empl_info-position-salary }| ).



  ENDMETHOD.
ENDCLASS.
