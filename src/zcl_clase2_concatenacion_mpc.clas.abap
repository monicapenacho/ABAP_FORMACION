CLASS zcl_clase2_concatenacion_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CLASE2_CONCATENACION_MPC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*
*      DATA: lv_string_a TYPE string VALUE 'Welcome to Logali Group',
*          lv_string_b TYPE string.
*    "---------------------------------------
*    " 1️⃣ Concatenación con operador &&
*    "---------------------------------------
*    lv_string_b = 'ABAP' && ` ` && 'Student'.
*
*    CONCATENATE lv_string_a lv_string_b
*      INTO DATA(lv_fin_string) "creo de manera lineal la variable
*      SEPARATED BY space.
*
*    out->write( |Concatenation 1: { lv_fin_string }| ).
*
*
*    "---------------------------------------
*    " 2️⃣ CONCATENATE respetando espacios
*    "---------------------------------------
*    CONCATENATE 'x' 'y' 'z'
*      INTO DATA(lv_string_c)
*      RESPECTING BLANKS.
*
*    out->write( |Concatenation 2: { lv_string_c }| ).
*
*
*    "---------------------------------------
*    " 3️⃣ String Template (forma moderna)
*    "---------------------------------------
*    DATA(lv_fin_string2) =
*      |Concatenation 3: { lv_string_a } / { lv_string_b }|.
*
*    out->write( lv_fin_string2 ).

   "/////////////////////////////////////////////////////////////////////
                    "Concatenación Lineas de Tablas"
   "//////////////////////////////////////////////////////////////////

*    SELECT FROM /dmo/flight " el select lo uqe hace es una lectura a la base de datos
*                            "ctrl + click encima de la BD para navegar a BD y luego ejecutar para entrar dentro de bd
*                             "/dmo/ BD no creada por mi
*    FIELDS carrier_id
*    INTO TABLE @DATA(lt_itab). "crea mi Tabla interna
*
*    DATA(lv_string_itab) =      " concateno la info de carrier_id de todas las líneas de la BD
*    concat_lines_of(
*      table = lt_itab
*      sep   = |  |              " si no me salen espacios en blanco con " " las pongo con | |
*    ).
*
*    out->write( lv_string_itab ).


   "/////////////////////////////////////////////////////////////////////
                    "Condensar"
   "//////////////////////////////////////////////////////////////////

*
*    " Texto inicial con muchos espacios
*        out->write( | | ).
*    lv_string_a = '   Welcome     to Logali     Group   '.
*
*    out->write( lv_string_a ).
*
*    " -----------------------------------------
*    " 1) CONDENSE clásico
*    " -----------------------------------------
*    CONDENSE lv_string_a.
*    out->write( lv_string_a ).
*
*    " -----------------------------------------
*    " 2) CONDENSE NO-GAPS
*    " -----------------------------------------
*    lv_string_a = '   Welcome     to Logali     Group   '.
*    CONDENSE lv_string_a NO-GAPS.
*    out->write( lv_string_a ).
*
*    " -----------------------------------------
*    " 3) Versión moderna condense( )
*    " -----------------------------------------
*    lv_string_a = '   Welcome     to Logali     Group   '.
*    lv_string_a = condense( val = lv_string_a ).
*    out->write( lv_string_a ).
*
*    " -----------------------------------------
*    " 4) Reemplazar espacios (TO)
*    " -----------------------------------------
*    lv_string_a = '   Welcome     to Logali     Group   '.
*    lv_string_a = condense( val = lv_string_a to = '_' ).
*    out->write( lv_string_a ).
*
*    " -----------------------------------------
*    " 5) Eliminar carácter específico (DEL)
*    " -----------------------------------------
*    lv_string_a = condense(
*                    val = '!!!ABAP!!!Course!!!'
*                    del = '!' ).
*    out->write( lv_string_a ).
*
*   "/////////////////////////////////////////////////////////////////////
*                    "split"
*   "//////////////////////////////////////////////////////////////////
*
*
*   DATA(lv_string1) = 'Logali-Gro-up-SAP-Academy kljhlkhj-khlkjk '.
*
*    SPLIT lv_string1 AT '-'
*      INTO DATA(lv_word1)
*           DATA(lv_word2)
*           DATA(lv_word3)
*           DATA(lv_word4).
*
*    out->write( lv_word1 ).
*    out->write( lv_word2 ).
*    out->write( lv_word3 ).
*    out->write( lv_word4 ).
*
*   "/////////////////////////////////////////////////////////////////////
*                    "segment"
*   "//////////////////////////////////////////////////////////////////
*    lv_word3 = segment( val = lv_string1 index = 3 sep = '-' ). "SEP en qué se tiene que fijar
*                                                                "de la variable val = para realizar la acción
*    out->write( lv_word3 ).

*
*data(lv) = cl_abap_random_int=>create( seed = conv i( sy-uzeit ) min = 1 max = 100 )->get_next( ).
*
*out->write( lv ).


  ENDMETHOD.
ENDCLASS.
