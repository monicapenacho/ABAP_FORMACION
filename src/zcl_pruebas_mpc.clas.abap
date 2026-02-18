CLASS zcl_pruebas_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PRUEBAS_MPC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*
      "===============================================================
    " 1) VARIABLES ELEMENTALES (TIPOS SIMPLES)
    "===============================================================

    " Entero (números sin decimales)
    DATA lv_entero TYPE i VALUE 10.

    " Número decimal empaquetado (muy usado para importes)
    DATA lv_importe TYPE p LENGTH 8 DECIMALS 2 VALUE '123.45'.

    " Texto fijo (longitud fija)
    DATA lv_texto_fijo TYPE c LENGTH 20 VALUE 'ABAP Nivel 9'.

    " String (longitud variable, moderno)
    DATA lv_string TYPE string VALUE 'Programación ABAP'.

*    " Fecha
*    DATA lv_fecha TYPE d VALUE sy-datum.

*    " Hora
*    DATA lv_hora TYPE t VALUE sy-uzeit.

    out->write( |Entero: { lv_entero }| ).
    out->write( |Importe: { lv_importe }| ).
    out->write( |Texto fijo: { lv_texto_fijo }| ).
    out->write( |String: { lv_string }| ).
*    out->write( |Fecha: { lv_fecha }| ).
*    out->write( |Hora: { lv_hora }| ).
*
*
*
*    "===============================================================
*    " 2) VARIABLES REFERENCIADAS AL DICCIONARIO (TYPE / LIKE)
*    "===============================================================
*
*    " TYPE -> usa el tipo técnico
*    DATA lv_matnr TYPE mara-matnr.
*
*    " LIKE -> copia exactamente la definición de otro objeto
*    DATA lv_matnr_like LIKE lv_matnr.
*
*    out->write( |Variable referenciada a MARA-MATNR creada.| ).
*
*
*
*    "===============================================================
*    " 3) ESTRUCTURAS
*    "===============================================================
*
*    " Estructura basada en tabla estándar SAP
*    DATA ls_mara TYPE mara.
*
*    " Estructura personalizada
*    TYPES: BEGIN OF ty_alumno,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_alumno.
*
*    DATA ls_alumno TYPE ty_alumno.
*
*    ls_alumno-nombre = 'Daniel'.
*    ls_alumno-edad   = 40.
*
*    out->write( |Alumno: { ls_alumno-nombre } - { ls_alumno-edad } años| ).
*
*
*
*    "===============================================================
*    " 4) TABLAS INTERNAS
*    "===============================================================
*
*    " Tabla interna estándar
*    DATA lt_mara TYPE STANDARD TABLE OF mara.
*
*    " Tabla interna ordenada
*    DATA lt_mara_sorted TYPE SORTED TABLE OF mara
*                        WITH UNIQUE KEY matnr.
*
*    " Tabla interna hash (búsqueda ultra rápida por clave)
*    DATA lt_mara_hash TYPE HASHED TABLE OF mara
*                      WITH UNIQUE KEY matnr.
*
*    out->write( |Tablas internas creadas.| ).
*
*
*
*    "===============================================================
*    " 5) CONSTANTES
*    "===============================================================
*
*    "Igual que una variable pero una vez que la creas ya no se puede modiicar
*
*    CONSTANTS gc_empresa TYPE string VALUE 'Logali Group'.
*
*    out->write( |Constante empresa: { gc_empresa }| ).
*
*
*
*    "===============================================================
*    " 6) VARIABLES INLINE (MODERNO)
*    "===============================================================
*
*    DATA(lv_inline) = 'Variable moderna declarada en línea'.
*
*    out->write( lv_inline ).
*
*
*
*    "===============================================================
*    " 7) REFERENCIAS A OBJETOS
*    "===============================================================
*
*    DATA lo_objeto TYPE REF TO zcl_tipos_variables_demo.
*
*    lo_objeto = NEW zcl_tipos_variables_demo( ).
*
*    out->write( |Referencia a objeto creada.| ).
*
*  "/////////////////////////////////////////////////////////////////////
*                    "8) LITERALES"
*"/////////////////////////////////////////////////////////////////////
*
*    "===============================================================
*    " 8.1) LITERALES DE TEXTO (CARACTER)
*    "===============================================================
*
*    " Literal clásico con comillas simples (tipo C)
*    DATA(lv_texto1) = 'ABAP'.
*
*    " Literal tipo STRING con backticks
*    DATA(lv_texto2) = `ABAP Moderno`.
*
*    out->write( |Literal texto fijo: { lv_texto1 }| ).
*    out->write( |Literal string: { lv_texto2 }| ).
*
*
*
*    "===============================================================
*    " 8.2) LITERALES NUMÉRICOS
*    "===============================================================
*
*    " Entero
*    DATA(lv_numero1) = 100.
*
*    " Decimal
*    DATA(lv_numero2) = '123.45'.
*
*    out->write( |Literal entero: { lv_numero1 }| ).
*    out->write( |Literal decimal: { lv_numero2 }| ).
*
*
*
*    "===============================================================
*    " 8.3) LITERALES DE FECHA Y HORA
*    "===============================================================
*
*    DATA(lv_fecha_literal) = '20250101'. " formato AAAAMMDD
*    DATA(lv_hora_literal)  = '153000'.   " formato HHMMSS
*
*    out->write( |Fecha literal: { lv_fecha_literal }| ).
*    out->write( |Hora literal: { lv_hora_literal }| ).
*
*
*
*    "===============================================================
*    " 8.4) STRING TEMPLATE (LITERAL MODERNO)
*    "===============================================================
*
*    DATA(lv_nombre) = 'Daniel'.
*
*    DATA(lv_frase) = |Bienvenido { lv_nombre } al curso ABAP Nivel 9|.
*
*    out->write( lv_frase ).
*
*
*
*    "===============================================================
*    " 8.5) LITERALES BOOLEANOS
*    "===============================================================
*
*    DATA(lv_bool_true)  = abap_true.
*    DATA(lv_bool_false) = abap_false.
*
*    IF lv_bool_true = abap_true.
*      out->write( |Booleano TRUE activado| ).
*    ENDIF.
*
*
*
*    "===============================================================
*    " 8.6) LITERALES HEXADECIMALES
*    "===============================================================
*
*    DATA(lv_hex) = X'FF'.
*
*    out->write( |Literal hexadecimal declarado| ).
*
*
*
*    "===============================================================
*    " 8.7) LITERALES DE TEXTO MULTILÍNEA (STRING TEMPLATE)
*    "===============================================================
*
*check error
**    DATA(lv_multilinea) = |
**        Curso ABAP
**        Nivel 9
**        Programación profesional
**        |.
**
**    out->write( lv_multilinea ).
**
*
*  "/////////////////////////////////////////////////////////////////////
*                    "9) TIPOS DE DATOS"
*"/////////////////////////////////////////////////////////////////////
*
*    "===============================================================
*    " 9.1) TIPOS DE DATOS ELEMENTALES (Built-in Types)
*    "===============================================================
*
*    " 1️ TIPOS ELEMENTALES COMPLETOS
*    "===============================================================
**    Tienen longitud fija definida por el sistema
**
**    No necesitan especificar LENGTH al declararlos
**
**    El compilador ya conoce su tamaño exacto
*
*
*     DATA lv_i     TYPE i.        " Entero (4 bytes)
*     DATA lv_int8  TYPE int8.     " Entero largo
*     DATA lv_d     TYPE d.        " Fecha (8)
*     DATA lv_t     TYPE t.        " Hora (6)
*     DATA lv_f     TYPE f.        " Float
*     DATA lv_string TYPE string.  " String dinámico
*     DATA lv_xstring TYPE xstring." Binario dinámico
*
*
*    " 2️ TIPOS ELEMENTALES INCOMPLETOS
*    "===============================================================
**    Necesitan que el desarrollador indique la longitud
**
**    El tipo base existe, pero no está completamente definido
**
**    Requieren LENGTH
*
*     DATA lv_c TYPE c LENGTH 10.
*     DATA lv_n TYPE n LENGTH 8.
*     DATA lv_x TYPE x LENGTH 4.
*     DATA lv_p TYPE p LENGTH 8 DECIMALS 2.
*
*
*    " EJEMPLOS
*   "===============================================================
*
*    " Entero (4 bytes)
*    DATA lv_i TYPE i VALUE 100.
*
*    " Entero de 8 bytes (más rango)
*    DATA lv_int8 TYPE int8 VALUE 999999999.
*
*    " Decimal empaquetado (muy usado en FI)
*    DATA lv_p TYPE p LENGTH 8 DECIMALS 2 VALUE '123.45'.
*
*    " Número flotante (no recomendado para importes financieros)
*    DATA lv_f TYPE f VALUE '3.14159'.
*
*    " Texto de longitud fija
*    DATA lv_c TYPE c LENGTH 10 VALUE 'ABAP'.
*
*    " String dinámico (longitud variable)
*    DATA lv_string TYPE string VALUE 'ABAP Moderno'.
*
*    " Fecha (formato interno AAAAMMDD)
*    DATA lv_d TYPE d VALUE sy-datum.
*
*    " Hora (formato interno HHMMSS)
*    DATA lv_t TYPE t VALUE sy-uzeit.
*
*    out->write( |Entero: { lv_i }| ).
*    out->write( |Decimal: { lv_p }| ).
*    out->write( |String: { lv_string }| ).
*
*
*
*    "===============================================================
*    " 9.2) TIPOS DE DATOS DEL DICCIONARIO (DDIC Types)
*    "===============================================================
*
*    " Tipo basado en elemento de datos estándar SAP
*    DATA lv_matnr TYPE mara-matnr.
*
*    " Tipo basado en tabla CDS o estructura DDIC
*    DATA ls_mara TYPE mara.
*
*    out->write( |Variables referenciadas al Diccionario creadas.| ).
*
*
*
*    "===============================================================
*    " 9.3) TIPOS DE DATOS COMPLEJOS
*    "===============================================================
*
*    " --- ESTRUCTURA PERSONALIZADA ---
*    TYPES: BEGIN OF ty_persona,
*             nombre TYPE string,
*             edad   TYPE i,
*           END OF ty_persona.
*
*    DATA ls_persona TYPE ty_persona.
*
*    ls_persona-nombre = 'Daniel'.
*    ls_persona-edad   = 40.
*
*    out->write( |Persona: { ls_persona-nombre }| ).
*
*
*    " --- TABLA INTERNA ---
*    TYPES tt_personas TYPE STANDARD TABLE OF ty_persona WITH EMPTY KEY.
*
*    DATA lt_personas TYPE tt_personas.
*
*    APPEND ls_persona TO lt_personas.
*
*    out->write( |Tabla interna creada.| ).
*
*
*
*    "===============================================================
*    " 9.4) TIPOS DE REFERENCIA
*    "===============================================================
*
*    " Referencia a objeto
*    DATA lo_obj TYPE REF TO zcl_tipos_variables_demo.
*
*    " Referencia genérica a datos
*    DATA lr_data TYPE REF TO data.
*
*    out->write( |Referencias declaradas.| ).
*
*
*
*    "===============================================================
*    " 9.5) TIPOS BOOLEANOS
*    "===============================================================
*
*    DATA lv_bool TYPE abap_bool VALUE abap_true.
*
*    IF lv_bool = abap_true.
*      out->write( |Booleano activo| ).
*    ENDIF.
*
*
*
*    "===============================================================
*    " 9.6) TIPOS NUMÉRICOS EXACTOS vs APROXIMADOS
*    "===============================================================
*
*    " Exacto (recomendado para dinero)
*    DATA lv_importe TYPE decfloat34 VALUE '999.99'.
*
*    " Aproximado (científico)
*    DATA lv_float TYPE f VALUE '1.2345'.
*
*    out->write( |Decfloat: { lv_importe }| ).
*
*  "/////////////////////////////////////////////////////////////////////
*                    "10) CONVERSIÓN Y CASTING DE TIPOS"
*"/////////////////////////////////////////////////////////////////////
*
*CLASS zcl_conversion_casting_demo DEFINITION
*  PUBLIC
*  FINAL
*  CREATE PUBLIC.
*
*  PUBLIC SECTION.
*    INTERFACES if_oo_adt_classrun.
*
*ENDCLASS.
*
*
*
*CLASS zcl_conversion_casting_demo IMPLEMENTATION.
*
*  METHOD if_oo_adt_classrun~main.
*
*    "===============================================================
*    " 10.1) CONVERSIÓN IMPLÍCITA
*    "===============================================================
*
*    " ABAP convierte automáticamente cuando es compatible
*
*    DATA lv_i TYPE i VALUE 10.
*    DATA lv_p TYPE p LENGTH 8 DECIMALS 2.
*
*    lv_p = lv_i.   " Conversión implícita (i → p)
*
*    out->write( |Conversión implícita i → p: { lv_p }| ).
*
*
*
*    "===============================================================
*    " 10.2) CONVERSIÓN EXPLÍCITA CON CONV #( )
*    "===============================================================
*
*    DATA lv_string TYPE string VALUE '123'.
*    DATA lv_num    TYPE i.
*
*    lv_num = CONV i( lv_string ).
*
*    out->write( |Conversión explícita string → i: { lv_num }| ).
*
*
*
*    "===============================================================
*    " 10.3) CONVERSIÓN A STRING (muy usada en RAP)
*    "===============================================================
*
*    DATA lv_fecha TYPE d VALUE sy-datum.
*    DATA lv_fecha_string TYPE string.
*
*    lv_fecha_string = CONV string( lv_fecha ).
*
*    out->write( |Fecha convertida a string: { lv_fecha_string }| ).
*
*
*
*    "===============================================================
*    " 10.4) CASTING DE REFERENCIAS (UPCAST / DOWNCAST)
*    "===============================================================
*
*    " Clase padre
*    DATA lo_parent TYPE REF TO object.
*
*    " Clase hija
*    DATA lo_child TYPE REF TO zcl_conversion_casting_demo.
*
*    lo_child = NEW zcl_conversion_casting_demo( ).
*
*    " UPCAST (automático)
*    lo_parent = lo_child.
*
*    out->write( |Upcasting realizado.| ).
*
*
*    " DOWNCAST (requiere CAST)
*    DATA lo_child2 TYPE REF TO zcl_conversion_casting_demo.
*
*    lo_child2 ?= lo_parent.  " Downcast seguro
*
*    IF lo_child2 IS BOUND.
*      out->write( |Downcasting correcto.| ).
*    ENDIF.
*
*
*
*    "===============================================================
*    " 10.5) CONVERSIÓN SEGURA CON TRY...CATCH
*    "===============================================================
*
*    TRY.
*        DATA(lv_error) = CONV i( 'ABC' ). " Provoca error
*      CATCH cx_sy_conversion_no_number.
*        out->write( |Error de conversión capturado.| ).
*    ENDTRY.
*
*
*
*    "===============================================================
*    " 10.6) CONVERSIÓN NUMÉRICA EXACTA (DECFLOAT)
*    "===============================================================
*
*    DATA lv_dec TYPE decfloat34 VALUE '123.456'.
*    DATA lv_int TYPE i.
*
*    lv_int = CONV i( lv_dec ).
*
*    out->write( |Decfloat → Entero: { lv_int }| ).
*
*
*"/////////////////////////////////////////////////////////////////////
*                    "11) TIPOS GENÉRICOS Y FIELD-SYMBOLS"
*"/////////////////////////////////////////////////////////////////////
*
*CLASS zcl_genericos_fieldsymbol_demo DEFINITION
*  PUBLIC
*  FINAL
*  CREATE PUBLIC.
*
*  PUBLIC SECTION.
*    INTERFACES if_oo_adt_classrun.
*
*ENDCLASS.
*
*
*
*CLASS zcl_genericos_fieldsymbol_demo IMPLEMENTATION.
*
*  METHOD if_oo_adt_classrun~main.
*
*    "===============================================================
*    " 11.1) TIPOS GENÉRICOS
*    "===============================================================
*
*    " Tipo completamente genérico
*    DATA lr_data TYPE REF TO data.
*
*    " Tipo ANY (acepta cualquier tipo)
*    DATA lv_any TYPE any.
*
*    " Tipo ANY TABLE (tabla interna genérica)
*    DATA lt_any TYPE STANDARD TABLE OF any WITH EMPTY KEY.
*
*    out->write( |Tipos genéricos declarados.| ).
*
*
*
*    "===============================================================
*    " 11.2) CREACIÓN DINÁMICA DE DATOS
*    "===============================================================
*
*    " Crear una variable dinámica de tipo string
*    CREATE DATA lr_data TYPE string.
*
*    ASSIGN lr_data->* TO FIELD-SYMBOL(<fs_string>).
*
*    IF <fs_string> IS ASSIGNED.
*      <fs_string> = 'ABAP Dinámico Nivel 9'.
*      out->write( <fs_string> ).
*    ENDIF.
*
*
*
*    "===============================================================
*    " 11.3) FIELD-SYMBOLS (punteros de memoria)
*    "===============================================================
*
*    DATA lv_text TYPE string VALUE 'Logali Group'.
*
*    FIELD-SYMBOLS <fs_text> TYPE string.
*
*    ASSIGN lv_text TO <fs_text>.
*
*    IF <fs_text> IS ASSIGNED.
*      <fs_text> = 'Modificado vía Field-Symbol'.
*    ENDIF.
*
*    out->write( lv_text ). " Se modifica el original
*
*
*
*    "===============================================================
*    " 11.4) FIELD-SYMBOL EN LOOP (sin copia de memoria)
*    "===============================================================
*
*    DATA lt_tab TYPE STANDARD TABLE OF string WITH EMPTY KEY.
*
*    APPEND 'ABAP' TO lt_tab.
*    APPEND 'RAP' TO lt_tab.
*    APPEND 'BTP' TO lt_tab.
*
*    LOOP AT lt_tab ASSIGNING FIELD-SYMBOL(<fs_line>).
*
*      " No hay copia en memoria (más eficiente)
*      <fs_line> = |Curso { <fs_line> }|.
*
*    ENDLOOP.
*
*    LOOP AT lt_tab INTO DATA(lv_line).
*      out->write( lv_line ).
*    ENDLOOP.
*
*
*
*    "===============================================================
*    " 11.5) DIFERENCIA ENTRE ASSIGNING e INTO
*    "===============================================================
*
*    " INTO → crea copia
*    LOOP AT lt_tab INTO DATA(lv_copy).
*      lv_copy = 'No modifica tabla original'.
*    ENDLOOP.
*
*    " ASSIGNING → modifica directamente
*    LOOP AT lt_tab ASSIGNING <fs_line>.
*      <fs_line> = 'Modificación real'.
*    ENDLOOP.
*
*    out->write( |Tabla modificada con ASSIGNING.| ).
*
*
*
*    "===============================================================
*    " 11.6) CAST DINÁMICO CON FIELD-SYMBOL GENÉRICO
*    "===============================================================
*
*    FIELD-SYMBOLS <fs_any> TYPE any.
*
*    ASSIGN lv_text TO <fs_any>.
*
*    IF <fs_any> IS ASSIGNED.
*      out->write( |Field-symbol genérico funcionando.| ).
*    ENDIF.
*
*
*"/////////////////////////////////////////////////////////////////////
*                    "12) TIPOS DE CONDICIONALES"
*"/////////////////////////////////////////////////////////////////////
*
*CLASS zcl_condicionales_demo DEFINITION
*  PUBLIC
*  FINAL
*  CREATE PUBLIC.
*
*  PUBLIC SECTION.
*    INTERFACES if_oo_adt_classrun.
*
*ENDCLASS.
*
*
*
*CLASS zcl_condicionales_demo IMPLEMENTATION.
*
*  METHOD if_oo_adt_classrun~main.
*
*    "===============================================================
*    " 12.1) IF - ENDIF (Condicional básico)
*    "===============================================================
*
*    DATA lv_num TYPE i VALUE 10.
*
*    IF lv_num > 5.
*      out->write( |El número es mayor que 5| ).
*    ENDIF.
*
*
*
*    "===============================================================
*    " 12.2) IF - ELSE
*    "===============================================================
*
*    IF lv_num < 5.
*      out->write( |Menor que 5| ).
*    ELSE.
*      out->write( |No es menor que 5| ).
*    ENDIF.
*
*
*
*    "===============================================================
*    " 12.3) IF - ELSEIF - ELSE
*    "===============================================================
*
*    IF lv_num < 5.
*      out->write( |Menor que 5| ).
*    ELSEIF lv_num = 10.
*      out->write( |Es exactamente 10| ).
*    ELSE.
*      out->write( |Otro valor| ).
*    ENDIF.
*
*
*
*    "===============================================================
*    " 12.4) CASE - WHEN
*    "===============================================================
*
*    DATA lv_status TYPE string VALUE 'A'.
*
*    CASE lv_status.
*      WHEN 'A'.
*        out->write( |Status Activo| ).
*      WHEN 'I'.
*        out->write( |Status Inactivo| ).
*      WHEN OTHERS.
*        out->write( |Status desconocido| ).
*    ENDCASE.
*
*
*
*    "===============================================================
*    " 12.5) CONDICIONAL CON OPERADORES LÓGICOS
*    "===============================================================
*
*    DATA lv_edad TYPE i VALUE 30.
*
*    IF lv_edad > 18 AND lv_edad < 65.
*      out->write( |Edad laboral activa| ).
*    ENDIF.
*
*
*
*    "===============================================================
*    " 12.6) CONDICIONAL MODERNO CON COND #( )
*    "===============================================================
*
*    DATA(lv_resultado) =
*      COND string(
*        WHEN lv_num > 10 THEN 'Mayor que 10'
*        WHEN lv_num = 10 THEN 'Es 10'
*        ELSE 'Menor que 10'
*      ).
*
*    out->write( lv_resultado ).
*
*
*
*    "===============================================================
*    " 12.7) SWITCH #( ) (equivalente moderno de CASE)
*    "===============================================================
*
*    DATA(lv_texto_status) =
*      SWITCH string( lv_status
*        WHEN 'A' THEN 'Activo'
*        WHEN 'I' THEN 'Inactivo'
*        ELSE 'Desconocido'
*      ).
*
*    out->write( lv_texto_status ).
*
*
*
*    "===============================================================
*    " 12.8) CHECK (salida temprana del bloque)
*    "===============================================================
*
*    DATA lv_flag TYPE abap_bool VALUE abap_false.
*
*    CHECK lv_flag = abap_true.  " Si no se cumple, termina el método aquí
*
*    out->write( |Este texto no se ejecuta si CHECK falla| ).
*
*
*"/////////////////////////////////////////////////////////////////////
*                    "13) TIPOS DE TABLAS"
*"/////////////////////////////////////////////////////////////////////
*
*CLASS zcl_tipos_tablas_nivel9 DEFINITION
*  PUBLIC
*  FINAL
*  CREATE PUBLIC.
*
*  PUBLIC SECTION.
*    INTERFACES if_oo_adt_classrun.
*
*ENDCLASS.
*
*
*
*CLASS zcl_tipos_tablas_nivel9 IMPLEMENTATION.
*
*  METHOD if_oo_adt_classrun~main.
*
*    "===============================================================
*    " 13.1) STANDARD TABLE
*    "===============================================================
*
*    " Tabla interna estándar (tipo por defecto)
*    DATA lt_standard TYPE STANDARD TABLE OF string WITH EMPTY KEY.
*
*    APPEND 'SAP' TO lt_standard.
*    APPEND 'ABAP' TO lt_standard.
*    APPEND 'BTP' TO lt_standard.
*
*    " Acceso por índice (rápido)
*    READ TABLE lt_standard INTO DATA(lv_line) INDEX 1.
*    out->write( |STANDARD INDEX 1: { lv_line }| ).
*
*    " Búsqueda por clave (recorrido secuencial → más lento)
*    READ TABLE lt_standard INTO lv_line
*         WITH KEY table_line = 'ABAP'.
*
*    IF sy-subrc = 0.
*      out->write( |STANDARD encontrado por clave: { lv_line }| ).
*    ENDIF.
*
*
*
*    "===============================================================
*    " 13.2) SORTED TABLE
*    "===============================================================
*
*    " Siempre ordenada por clave
*    DATA lt_sorted TYPE SORTED TABLE OF string
*                   WITH UNIQUE KEY table_line.
*
*    INSERT 'Z' INTO TABLE lt_sorted.
*    INSERT 'A' INTO TABLE lt_sorted.
*    INSERT 'M' INTO TABLE lt_sorted.
*
*    " Se mantiene ordenada automáticamente
*    LOOP AT lt_sorted INTO lv_line.
*      out->write( |SORTED: { lv_line }| ).
*    ENDLOOP.
*
*    " Búsqueda binaria automática
*    READ TABLE lt_sorted INTO lv_line
*         WITH TABLE KEY table_line = 'M'.
*
*    IF sy-subrc = 0.
*      out->write( |SORTED encontrado: { lv_line }| ).
*    ENDIF.
*
*
*
*    "===============================================================
*    " 13.3) HASHED TABLE
*    "===============================================================
*
*    " Optimizada para acceso por clave exacta
*    DATA lt_hashed TYPE HASHED TABLE OF string
*                   WITH UNIQUE KEY table_line.
*
*    INSERT 'S4HANA' INTO TABLE lt_hashed.
*    INSERT 'RAP' INTO TABLE lt_hashed.
*    INSERT 'Fiori' INTO TABLE lt_hashed.
*
*    " Acceso ultra rápido por clave
*    READ TABLE lt_hashed INTO lv_line
*         WITH TABLE KEY table_line = 'RAP'.
*
*    IF sy-subrc = 0.
*      out->write( |HASHED encontrado: { lv_line }| ).
*    ENDIF.
*
*
*
*    "===============================================================
*    " 13.4) CLAVES ÚNICAS vs NO ÚNICAS
*    "===============================================================
*
*    DATA lt_sorted_non_unique TYPE SORTED TABLE OF string
*                              WITH NON-UNIQUE KEY table_line.
*
*    INSERT 'A' INTO TABLE lt_sorted_non_unique.
*    INSERT 'A' INTO TABLE lt_sorted_non_unique.
*
*    out->write( |SORTED NON-UNIQUE permite duplicados.| ).
*
*
*
*    "===============================================================
*    " 13.5) DIFERENCIAS DE RENDIMIENTO (Conceptual)
*    "===============================================================
*
*    out->write( |STANDARD → acceso por índice eficiente.| ).
*    out->write( |SORTED → búsqueda binaria automática.| ).
*    out->write( |HASHED → acceso por clave en tiempo constante.| ).
*
*
*    "/////////////////////////////////////////////////////////////////////
*    "14) OPERACIONES BÁSICAS DE TABLAS INTERNAS"
*    "/////////////////////////////////////////////////////////////////////
*
*
*```abap
*CLASS zcl_tablas_basicas_demo DEFINITION
*  PUBLIC
*  FINAL
*  CREATE PUBLIC.
*
*  PUBLIC SECTION.
*    INTERFACES if_oo_adt_classrun.
*ENDCLASS.
*
*
*
*CLASS zcl_tablas_basicas_demo IMPLEMENTATION.
*
*  METHOD if_oo_adt_classrun~main.
*
*    "===============================================================
*    " 14.1) DECLARACIÓN
*    "===============================================================
*
*    DATA lt_tab TYPE STANDARD TABLE OF string WITH EMPTY KEY.
*
*
*
*    "===============================================================
*    " 14.2) AÑADIR REGISTROS
*    "===============================================================
*
*    APPEND 'ABAP' TO lt_tab.      " Añade al final
*    INSERT 'RAP' INTO TABLE lt_tab.  " Inserta respetando tipo tabla
*
*
*
*    "===============================================================
*    " 14.3) LEER REGISTROS
*    "===============================================================
*
*    READ TABLE lt_tab INTO DATA(lv_line) INDEX 1.
*
*    IF sy-subrc = 0.
*      out->write( |Leído por índice: { lv_line }| ).
*    ENDIF.
*
*
*
*    "===============================================================
*    " 14.4) MODIFICAR REGISTROS
*    "===============================================================
*
*    MODIFY lt_tab FROM VALUE #( 'MODIFICADO' ) INDEX 1.
*
*
*
*    "===============================================================
*    " 14.5) ELIMINAR REGISTROS
*    "===============================================================
*
*    DELETE lt_tab INDEX 1.
*
*
*
*    "===============================================================
*    " 14.6) RECORRER TABLA
*    "===============================================================
*
*    LOOP AT lt_tab INTO lv_line.
*      out->write( lv_line ).
*    ENDLOOP.
*
*
*
*    "===============================================================
*    " 14.7) LIMPIAR TABLA
*    "===============================================================
*
*    CLEAR lt_tab.   " Vacía contenido
*    FREE lt_tab.    " Libera memoria
*
*  ENDMETHOD.
*
*ENDCLASS.
*
*    "/////////////////////////////////////////////////////////////////////
*    "15) OPERACIONES AVANZADAS CON TABLAS"
*    "/////////////////////////////////////////////////////////////////////
*
*```abap
*CLASS zcl_tablas_avanzadas_demo DEFINITION
*  PUBLIC
*  FINAL
*  CREATE PUBLIC.
*
*  PUBLIC SECTION.
*    INTERFACES if_oo_adt_classrun.
*ENDCLASS.
*
*
*
*CLASS zcl_tablas_avanzadas_demo IMPLEMENTATION.
*
*  METHOD if_oo_adt_classrun~main.
*
*    DATA lt_num TYPE STANDARD TABLE OF i WITH EMPTY KEY.
*    lt_num = VALUE #( ( 5 ) ( 2 ) ( 8 ) ( 2 ) ).
*
*
*
*    "===============================================================
*    " 15.1) SORT
*    "===============================================================
*
*    SORT lt_num ASCENDING.
*
*
*
*    "===============================================================
*    " 15.2) DELETE ADJACENT DUPLICATES
*    "===============================================================
*
*    DELETE ADJACENT DUPLICATES FROM lt_num.
*
*
*
*    "===============================================================
*    " 15.3) FILTER #( )
*    "===============================================================
*
*    DATA(lt_filtrado) =
*      FILTER #( lt_num WHERE table_line > 3 ).
*
*
*
*    "===============================================================
*    " 15.4) REDUCE #( )
*    "===============================================================
*
*    DATA(lv_suma) =
*      REDUCE i(
*        INIT total = 0
*        FOR num IN lt_num
*        NEXT total = total + num
*      ).
*
*
*
*    "===============================================================
*    " 15.5) FOR EXPRESSION
*    "===============================================================
*
*    DATA(lt_cuadrado) =
*      VALUE #( FOR num IN lt_num
*               ( num * num ) ).
*
*
*
*    "===============================================================
*    " 15.6) TABLE EXPRESSIONS
*    "===============================================================
*
*    TRY.
*        DATA(lv_valor) = lt_num[ 1 ].
*      CATCH cx_sy_itab_line_not_found.
*    ENDTRY.
*
*
*
*  ENDMETHOD.
*
*ENDCLASS.
*
*
*  ENDMETHOD.
*
*ENDCLASS.
*
*
*
  ENDMETHOD.
ENDCLASS.
