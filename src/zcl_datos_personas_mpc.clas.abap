"---------------------------------------------------------"
" CLASE PROVEEDORA DE PERSONAS (EJECUTABLE EN CONSOLA)   "
"---------------------------------------------------------"

CLASS zcl_datos_personas_mpc DEFINITION          " Definición de la clase
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
    CLASS-METHODS get_persona_by_index           " Método estático (no requiere NEW)
      IMPORTING iv_index TYPE i                  " Parámetro de entrada (posición)
      RETURNING VALUE(rs_persona) TYPE ty_persona. " Devuelve estructura persona

ENDCLASS.                                        " Fin definición clase



CLASS zcl_datos_personas_mpc IMPLEMENTATION.     " Implementación de la clase

  "---------------------------------------------------------"
  " MÉTODO PRINCIPAL (Se ejecuta con F9)                    "
  "---------------------------------------------------------"
  METHOD if_oo_adt_classrun~main.                " Método obligatorio en ABAP Cloud

    out->write( '--- DEMO CLASE DATOS PERSONAS ---' ).  " Mostrar título en consola

    DATA(ls_persona) =                           " Declaramos variable estructura
      zcl_datos_personas_mpc=>get_persona_by_index( 2 ).
                                                 " Llamada al método estático
                                                 " Pedimos el registro en posición 2

    IF ls_persona IS INITIAL.                    " Si no existe registro
      out->write( 'Índice no válido' ).          " Mostrar mensaje error
    ELSE.                                        " Si existe registro
      out->write( |Nombre: { ls_persona-nombre }| ). " Mostrar nombre
      out->write( |Mail:   { ls_persona-mail }| ).   " Mostrar mail
    ENDIF.                                       " Fin IF

  ENDMETHOD.                                     " Fin método main



  "---------------------------------------------------------"
  " MÉTODO QUE DEVUELVE PERSONA POR ÍNDICE                 "
  "---------------------------------------------------------"
  METHOD get_persona_by_index.                   " Implementación método estático

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

    READ TABLE lt_personas                       " Leer tabla interna
         INTO rs_persona                         " Guardar resultado en estructura retorno
         INDEX iv_index.                         " Usar índice recibido como parámetro

  ENDMETHOD.                                     " Fin método get_persona_by_index

ENDCLASS.                                        " Fin implementación clase
