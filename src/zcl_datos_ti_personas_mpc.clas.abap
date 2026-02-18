"---------------------------------------------------------"
" CLASE PROVEEDORA DE PERSONAS (EJECUTABLE EN CONSOLA)   "
"---------------------------------------------------------"

CLASS zcl_datos_ti_personas_mpc DEFINITION          " Definición de la clase
  PUBLIC                                          " Visible desde cualquier programa
  FINAL                                           " No permite herencia
  CREATE PUBLIC.                                  " Se puede instanciar desde fuera

  PUBLIC SECTION.                                 " Sección pública (visible externamente)

    INTERFACES if_oo_adt_classrun.               " Permite ejecutar con F9 en ADT (Eclipse)

    "-----------------------------------------------------"
    " Tipo estructura persona                             "
    "-----------------------------------------------------"
    TYPES: BEGIN OF ty_persona,                  " Declaración de tipo estructura
             nombre TYPE string,                 " Campo nombre tipo texto dinámico
             mail   TYPE string,                 " Campo mail tipo texto dinámico
           END OF ty_persona.                    " Fin estructura

    "-----------------------------------------------------"
    " Método estático que devuelve persona por índice     "
    "-----------------------------------------------------"
    CLASS-METHODS get_total_personas        " Método estático (no requiere NEW)
      RETURNING VALUE(rv_total) TYPE i. " Devuelve total personas

ENDCLASS.                                        " Fin definición clase



CLASS zcl_datos_ti_personas_mpc IMPLEMENTATION.     " Implementación de la clase

  "---------------------------------------------------------"
  " MÉTODO PRINCIPAL (Se ejecuta con F9)                    "
  "---------------------------------------------------------"
  METHOD if_oo_adt_classrun~main.                " Método obligatorio en ABAP Cloud


  ENDMETHOD.                                     " Fin método main



  "---------------------------------------------------------"
  " MÉTODO QUE DEVUELVE PERSONA POR ÍNDICE                 "
  "---------------------------------------------------------"
  METHOD get_total_personas.                   " Implementación método estático

    DATA lt_personas TYPE STANDARD TABLE OF ty_persona
                     WITH EMPTY KEY.             " Tabla interna estándar sin clave

    lt_personas = VALUE #(                       " Rellenamos tabla interna
      ( nombre = 'Mónica1' mail = 'monica@gmail.com' )
      ( nombre = 'Juan2'   mail = 'juan@gmail.com' )
      ( nombre = 'Eva3'    mail = 'eva@gmail.com' )
      ( nombre = 'Pedro4'  mail = 'pedro@gmail.com' )
      ( nombre = 'Mónica5' mail = 'monica@gmail.com' )
      ( nombre = 'Juan6'   mail = 'juan@gmail.com' )
      ( nombre = 'Eva7'    mail = 'eva@gmail.com' )
      ( nombre = 'Pedro8'  mail = 'pedro@gmail.com' )
      ( nombre = 'Mónica9' mail = 'monica@gmail.com' )
      ( nombre = 'Juan10'   mail = 'juan@gmail.com' )
      ( nombre = 'Eva11'    mail = 'eva@gmail.com' )
      ( nombre = 'Pedro12'  mail = 'pedro@gmail.com' )
      ( nombre = 'Mónica13' mail = 'monica@gmail.com' )
      ( nombre = 'Juan14'   mail = 'juan@gmail.com' )
      ( nombre = 'Eva15'    mail = 'eva@gmail.com' )
      ( nombre = 'Pedro16'  mail = 'pedro@gmail.com' )
    ).                                           " Fin carga tabla

    rv_total = lines( lt_personas ).               " El nº de filas es el nº total de personas

  ENDMETHOD.                                     " Fin método get_total_personas

ENDCLASS.                                        " Fin implementación clase
