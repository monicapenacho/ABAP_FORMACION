"---------------------------------------------------------"
" CLASE PROVEEDORA DE PERSONAS CON RANDOM                 "
" Devuelve una persona aleatoria (nombre + mail)          "
"---------------------------------------------------------"

CLASS zcl_claes6_ti_personas_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    "-----------------------------------------------------"
    " Interfaz para ejecutar con F9 en Eclipse (ADT)      "
    "-----------------------------------------------------"
    INTERFACES if_oo_adt_classrun.

    "-----------------------------------------------------"
    " Tipo estructura persona                             "
    "-----------------------------------------------------"
    TYPES: BEGIN OF ty_persona,
             nombre TYPE string,   " Campo nombre
             mail   TYPE string,   " Campo email
           END OF ty_persona.

    "-----------------------------------------------------"
    " Método que devuelve UNA persona aleatoria           "
    "-----------------------------------------------------"
    CLASS-METHODS get_random_persona
      RETURNING VALUE(rs_persona) TYPE ty_persona.

ENDCLASS.



CLASS zcl_claes6_ti_personas_mpc IMPLEMENTATION.

  "---------------------------------------------------------"
  " MÉTODO PRINCIPAL (solo para probar con F9)              "
  "---------------------------------------------------------"
  METHOD if_oo_adt_classrun~main.

    out->write( '--- DEMO PERSONA ALEATORIA ---' ).

    DATA(ls_persona) = get_random_persona( ).  " Llamamos al método random

    out->write( |Nombre: { ls_persona-nombre }| ).
    out->write( |Mail:   { ls_persona-mail }| ).

  ENDMETHOD.



  "---------------------------------------------------------"
  " MÉTODO QUE DEVUELVE UNA PERSONA RANDOM                 "
  "---------------------------------------------------------"
  METHOD get_random_persona.

    "-----------------------------------------------------"
    " 1️ Crear tabla interna y rellenarla                "
    "-----------------------------------------------------"
    DATA lt_personas TYPE STANDARD TABLE OF ty_persona
                     WITH EMPTY KEY.

    lt_personas = VALUE #(
      ( nombre = 'Mónica1' mail = 'monica@gmail.com' )
      ( nombre = 'Juan2'   mail = 'juan@gmail.com' )
      ( nombre = 'Eva3'    mail = 'eva@gmail.com' )
      ( nombre = 'Pedro4'  mail = 'pedro@gmail.com' )
      ( nombre = 'Mónica5' mail = 'monica@gmail.com' )
      ( nombre = 'Juan6'   mail = 'juan@gmail.com' )
      ( nombre = 'Eva7'    mail = 'eva@gmail.com' )
      ( nombre = 'Pedro8'  mail = 'pedro@gmail.com' )
      ( nombre = 'Mónica9' mail = 'monica@gmail.com' )
      ( nombre = 'Juan10'  mail = 'juan@gmail.com' )
      ( nombre = 'Eva11'   mail = 'eva@gmail.com' )
      ( nombre = 'Pedro12' mail = 'pedro@gmail.com' )
      ( nombre = 'Mónica13' mail = 'monica@gmail.com' )
      ( nombre = 'Juan14'   mail = 'juan@gmail.com' )
      ( nombre = 'Eva15'    mail = 'eva@gmail.com' )
      ( nombre = 'Pedro16'  mail = 'pedro@gmail.com' )
    ).

    "-----------------------------------------------------"
    " 2️ Obtener total de registros                     "
    "-----------------------------------------------------"
    DATA(lv_total) = lines( lt_personas ).   " Nº total filas

    "-----------------------------------------------------"
    " 3️ Crear generador random entre 1 y total         "
    "-----------------------------------------------------"
    DATA(lo_random) =
      cl_abap_random_int=>create(
        seed = cl_abap_random=>seed( )   " Semilla automática
        min  = 1                         " Índice mínimo
        max  = lv_total                  " Índice máximo
      ).

    DATA(lv_index) = lo_random->get_next( ).  " Número aleatorio

    "-----------------------------------------------------"
    " 4️ Leer fila random                               "
    "-----------------------------------------------------"
    READ TABLE lt_personas
         INTO rs_persona
         INDEX lv_index.     " Usamos el índice random

    "-----------------------------------------------------"
    " 5️ rs_persona se devuelve automáticamente         "
    "-----------------------------------------------------"

  ENDMETHOD.

ENDCLASS.


