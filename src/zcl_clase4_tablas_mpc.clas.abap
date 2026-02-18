CLASS zcl_clase4_tablas_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CLASE4_TABLAS_MPC IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*       "/////////////////////////////////////////////////////////////////////
*                    "TYPE TABLE OF -TABLAS"
*   "//////////////////////////////////////////////////////////////////
*
*"/////////////////////////////////////////////////////////////////////
*                    "INSERT VALUE #( ) – TABLA INTERNA
*"/////////////////////////////////////////////////////////////////////
*
* "===============================================================
*    " 1️ Declaración de tabla interna
*    "===============================================================
*    " Creamos una tabla interna basada en la estructura
*    " estándar /dmo/airport (tabla de aeropuertos de SAP DMO = BASE DE DATOS)
*
*    DATA lt_aeropuerto TYPE STANDARD TABLE OF /dmo/airport
*                        WITH EMPTY KEY.
*
*
*    "===============================================================
*    " 2️ Insertar registro usando VALUE #( )
*    "===============================================================
*    "2.a) INSERT VALUE #()
*
*    " VALUE #( ) crea una estructura en línea
*    " INSERT la añade a la tabla interna
*    "
*    " # → significa: "infiero el tipo automáticamente"
*    " (lo toma de la tabla lt_aeropuerto)
*    " Client = entorno en el que me encuentro. No borrar. Suele ser automático
*
*    INSERT VALUE #(
*        client     = 100                    "Mandante (100 - testeo, 200-desarrollo, 300-producción)
*        airport_id = 'FRA'
*        name       = 'Frankfurt Airport'
*        city       = 'Frankfurt/Main'
*        country    = 'DE'
*    )
*    INTO TABLE lt_aeropuerto.
*
*    "nota: Con insert value #() forzamos la introudcción de datos de forma lineal
*    "nota: los nombres de los campos de la tabla interna tienen que coincidir con los de la BBDD
*
*    "2.b) INSERT VALUE #() INDEX
*
*    "INTO TABLE INDEX 2 ->
*    " Inserta el registro en la posición física número 2.
*    " IMPORTANTE: Esto solo es válido para STANDARD TABLE.
*    " Si tabla vacía DUMP en runtime
*
*    INSERT VALUE #(
*        client     = 100                    "Mandante (100 - testeo, 200-desarrollo, 300-producción)
*        airport_id = 'FRA'
*        name       = 'Frankfurt Airport'
*        city       = 'Frankfurt/Main'
*        country    = 'DE'
*    )
*    INTO lt_aeropuerto index 2.
*
*
*    "===============================================================
*    " 3️ Mostrar contenido en consola (ADT)
*    "===============================================================
*    " En ABAP Cloud podemos escribir directamente la tabla
*
*    out->write( lt_aeropuerto ).
*
*    "/////////////////////////////////////////////////////////////////////
*    "               "CREAR UN REGISTRO CON UNA LINEA EN BLANCO - TABLAS"
*    "////////////////////////////////////////////////////////////////////
*
*    "---------------------------------------------------------------
*    " 1) Declaración de estructura y tabla
*    "---------------------------------------------------------------
*
*        TYPES: BEGIN OF ty_persona,
*                 nombre TYPE string,
*                 edad   TYPE i,
*               END OF ty_persona.
*
*        DATA lt_personas TYPE STANDARD TABLE OF ty_persona
*                         WITH EMPTY KEY.
*
*    "---------------------------------------------------------------
*    " 2) Crear línea en blanco
*    "---------------------------------------------------------------
*
*    "2.1 Tradicional APPEND
*    "---------------------------------------------------------------
*
*    APPEND INITIAL LINE TO lt_personas.
*
*    " Ahora la tabla tiene 1 línea con valores iniciales:
*    " nombre = ''
*    " edad   = 0
*
*    "2.2 Moderno INSERT
*    "---------------------------------------------------------------
*
*    INSERT INITIAL LINE INTO TABLE lt_personas.
*
*    "/////////////////////////////////////////////////////////////////////
*    "               "LIKE - IGUALAR TABLAS"
*    "/////////////////////////////////////////////////////////////////////
*
*    "===============================================================
*    " 1) CREAR TABLA INTERNA BASE
*    "===============================================================
*    " Creamos una tabla interna basada en la tabla /DMO/AGENCY
*
*    DATA lt_employees TYPE STANDARD TABLE OF /dmo/agency " agency en lugar de employee
*                      WITH EMPTY KEY.
*
*    "===============================================================
*    " 2) INSERTAR UNA LÍNEA VACÍA
*    "===============================================================
*    " INSERT INITIAL LINE crea un registro en blanco
*    " (todas las columnas inicializadas con valores por defecto)
*
*    INSERT INITIAL LINE INTO TABLE lt_employees.
*
*    "===============================================================
*    " 3) CREAR OTRA TABLA CON LIKE
*    "===============================================================
*    " LIKE copia exactamente el tipo técnico de la tabla original
*    " Es decir: misma estructura, mismo tipo de línea
*    " IMPORTANTE tabla destino vacía. Todavía no se han copiado los datos.
*
*    DATA lt_employees2 LIKE lt_employees.
*
*    " Insertamos también una línea en blanco en la segunda tabla
*    INSERT INITIAL LINE INTO TABLE lt_employees2.
*
*    "===============================================================
*    " 4) MOSTRAR RESULTADO
*    "===============================================================
*    out->write( '--- DEMO LIKE TABLAS ---' ).
*    out->write( |Líneas tabla 1: { lines( lt_employees ) }| ).
*    out->write( |Líneas tabla 2: { lines( lt_employees2 ) }| ).
*
*    "/////////////////////////////////////////////////////////////////////
*    " INSERT LINES OF – METER REGISTROS EN TABLA
*    "/////////////////////////////////////////////////////////////////////
*
*    " Copia masiva (todos los registros) de una tabla interna a otra tabla interna
*
*    " ESCENARIO BASE
*    DATA lt_employees  TYPE STANDARD TABLE OF zemployee WITH EMPTY KEY.
*    DATA lt_employees2 TYPE STANDARD TABLE OF zemployee WITH EMPTY KEY.
*
*    " 1) COPIAR TODA LA TABLA
*    "===============================================================
*
*    INSERT LINES OF lt_employees
*    INTO TABLE lt_employees2.
*
*****Copia todos los registros
*****Desde la primera línea hasta la última
*****Los inserta al final de la tabla destino
*****📌 Resultado:
*****lt_employees2 tendrá el mismo contenido que lt_employees.
*
*
**     "/////////////////////////////////////////////////////////////////////
**                    "MOVE CORRESPONDING - TABLAS"
**   "//////////////////////////////////////////////////////////////////
**
**          "------------------------------------------------------------
**        " 1️ Definición de un tipo estructura para vuelos
**        "------------------------------------------------------------
**        TYPES: BEGIN OF lty_flights,
**                 carrier_id    TYPE /dmo/carrier_id,     " Código de aerolínea
**                 connection_id TYPE /dmo/connection_id,  " Número de conexión
**                 flight_date   TYPE /dmo/flight_date,    " Fecha del vuelo
**               END OF lty_flights.
**
**        "------------------------------------------------------------
**        " 2️ Declaración de tabla interna y estructura de trabajo
**        "------------------------------------------------------------
**        DATA: gt_my_flights TYPE STANDARD TABLE OF lty_flights, " Tabla interna destino
**              gs_my_flight  TYPE lty_flights.                   " Work area (no usada aquí)
**
**        "------------------------------------------------------------
**        " 3️ Selección desde base de datos
**        "------------------------------------------------------------
**        SELECT FROM /dmo/flight
**          FIELDS *                                  " Trae TODOS los campos de la tabla
**          WHERE currency_code EQ 'EUR'              " Solo vuelos con moneda EUR
**          INTO TABLE @DATA(gt_flights).             " Tabla interna creada inline
**
**        "🔎 gt_flights tendrá la estructura completa de /dmo/flight
**
**        "------------------------------------------------------------
**        " 4️ MOVE-CORRESPONDING entre tablas internas
**        "------------------------------------------------------------
**        MOVE-CORRESPONDING gt_flights TO gt_my_flights KEEPING TARGET LINES.
**
**        "📌 ¿Qué hace esto?
**        " Copia los campos que tengan el mismo nombre entre:
**        "   - gt_flights (estructura completa de BD)
**        "   - gt_my_flights (estructura reducida lty_flights)
**        "
**        " Solo copiará:
**        "   carrier_id
**        "   connection_id
**        "   flight_date
**        "
**        " Ignora el resto de campos automáticamente.
**        "
**        " Es una conversión estructural automática por nombre.
**
**             "------------------------------------------------------------
**        "PONER KEEPING TARGET LINEes
**        "a) Si no pones nada en el caso de que gt_my_flights tuviera datos
**        "lo machaca con los datos de gt_flights.
**        "b) Con keeping no machaca si los resultados son distintos y
**        "los añade al final los nuevos que no coinciden insertando lineas nuevas
**
**        "MOVE-CORRESPONDING gt_flights TO gt_my_flights KEEPING TARGET LINES.
**
**               "------------------------------------------------------------
**
**        " VERSION MAS MODERNA
**        " gt_my_flights = CORRESPONDING #( gt_flights ).
**
**        "------------------------------------------------------------
**        " 5️ Mostrar resultados en consola (ADT classrun)
**        "------------------------------------------------------------
**        out->write( data = gt_flights name = 'gt_flights' ).
**        out->write( |\n| ). " Salto de línea
**        out->write( data = gt_my_flights name = 'gt_my_flights' ).
*
*
**" Selecciona todos los aeropuertos cuyo país sea Alemania (DE)
**SELECT FROM /dmo/airport
**  FIELDS *
**   WHERE country EQ 'DE'
**  INTO TABLE @DATA(lt_flights).
**
***" Solo continuamos si el SELECT ha devuelto datos
**IF sy-subrc EQ 0.
**  "------------------------------------------------------------
**  " 6️ Leer resultados
**  "------------------------------------------------------------
**  " Leer la primera fila de la tabla interna
**  READ TABLE lt_flights INTO DATA(ls_flight) INDEX 1.
**
**  out->write( data = lt_flights name = 'lt_flights' ).
**  out->write( data = ls_flight  name = 'ls_flight' ).
**
**  " Leer la segunda fila pero solo copiando algunos campos
**  READ TABLE lt_flights  INTO DATA(ls_flight2) INDEX 2 TRANSPORTING airport_id city.
**
**  out->write( data = ls_flight2 name = 'ls_flight2' ).
**
**ENDIF.
**
**
**""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
**" Selecciona todos los aeropuertos cuyo país sea Alemania (DE)
**SELECT FROM /dmo/airport
**  FIELDS *
**   WHERE country EQ 'DE'
**  INTO TABLE @DATA(lt_flights).
**
**" lt_flights es una tabla interna ya rellenada previamente
**" Accedemos directamente a la línea 2 usando una expresión de tabla
**
**DATA(ls_data) = lt_flights[ 2 ].
**
**out->write(
**  data = ls_data
**  name = 'ls_data'
**).
*
*"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*"--------------------------------------------------------------
*" 1️ Declaración de tabla interna tipada con estructura DDIC
*"--------------------------------------------------------------
*DATA: gt_flights TYPE STANDARD TABLE OF /dmo/flight.
*" gt_flights será una tabla interna con la misma estructura
*" que la tabla de base de datos /dmo/flight
*
*
*"--------------------------------------------------------------
*" 2️ Selección de datos desde base de datos
*"--------------------------------------------------------------
*SELECT FROM /dmo/flight
*  FIELDS *
*  WHERE carrier_id EQ 'LH'
*  INTO TABLE @gt_flights.
*
*" Se seleccionan todos los campos (*) de la tabla /dmo/flight
*" Solo los registros donde carrier_id = 'LH'
*" El resultado se guarda en la tabla interna gt_flights
**
**
**"--------------------------------------------------------------
**" 3️ Verificación de que el SELECT fue correcto
**"--------------------------------------------------------------
**IF sy-subrc EQ 0.
**
**  " sy-subrc = 0 significa que el SELECT devolvió al menos un registro
**  " Si no hay registros, no tiene sentido buscar dentro de la tabla
**
**
**  "-----------------------------------------------------------
**  " 4️ Verificar si existe un vuelo concreto en la tabla
**  "-----------------------------------------------------------
**  READ TABLE gt_flights
**       WITH KEY connection_id = '040398789'
***              WITH KEY connection_id = '0403'
**       TRANSPORTING NO FIELDS.
**
**  " READ TABLE busca dentro de la tabla interna
**  " WITH KEY → criterio de búsqueda
**  " TRANSPORTING NO FIELDS → optimización:
**  "     Solo comprueba si existe el registro,
**  "     NO copia los datos a una variable.
**  "
**  " Esto es una búsqueda de existencia (muy eficiente).
**
**
**  "-----------------------------------------------------------
**  " 5️ Comprobación del resultado del READ
**  "-----------------------------------------------------------
**  IF sy-subrc EQ 0.
**
**    out->write( 'The flight exists in the database' ).
**
**  ELSE.
**  out->write( sy-subrc ).
**    out->write( 'The flight does not exist in the database' ).
**
**  ENDIF.
**
**ENDIF.
*
**"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
**---------------------------------------------------------------------*
** Buscar una fila en la tabla interna gt_flights por connection_id
**---------------------------------------------------------------------*
*
*"Intentamos localizar una fila cuya connection_id sea '0403'
*READ TABLE gt_flights
*     WITH KEY connection_id = '0403'
*     TRANSPORTING NO FIELDS.
*
*"TRANSPORTING NO FIELDS significa:
*"No copia los datos a un área de trabajo.
*"Solo verifica si la fila existe.
*"Es una búsqueda optimizada (más eficiente).
*
**---------------------------------------------------------------------*
** Verificamos si la lectura fue exitosa
**---------------------------------------------------------------------*
*
*IF sy-subrc = 0.
*
*  "Si sy-subrc = 0 significa que la fila fue encontrada
*
*  "sy-tabix contiene el índice (posición) de la fila encontrada
*  DATA(lv_index) = sy-tabix.
*
*  "Mostramos la tabla completa (solo para visualizar)
*  out->write(
*    data = gt_flights
*    name = 'gt_flights'
*  ).
*
*  "Mostramos el índice donde se encontró la fila
*  out->write( lv_index ).
*
*ENDIF.
*
**""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*"LOOP AT
*
*
*"--------------------------------------------------------------
*" 1️ Declaración de tabla interna tipada con estructura DDIC  - ESTA YA HECHO EN EJ ANTERIOR
*"--------------------------------------------------------------
**DATA: gt_flights TYPE STANDARD TABLE OF /dmo/flight.
*" gt_flights será una tabla interna con la misma estructura
*" que la tabla de base de datos /dmo/flight
*
*
*"--------------------------------------------------------------
*" 2️ Selección dedatos desde base dedatos
*"--------------------------------------------------------------
*SELECT FROM /dmo/flight
*  FIELDS *
*  WHERE carrier_id EQ 'LH'
*  INTO TABLE @gt_flights.
*
*" Se seleccionan todos los campos (*) de la tabla /dmo/flight
*" Solo los registros donde carrier_id = 'LH'
*" El resultado se guarda en la tabla interna
*
*"------------------------------------------------------------
*" Declaración de una estructura de trabajo del tipo /dmo/flight
*" Representa UNA línea (registro) de la tabla de vuelos
*"------------------------------------------------------------
*DATA gs_flight TYPE /dmo/flight.
*
*"------------------------------------------------------------
*" LOOP 1: Recorrer TODA la tabla interna gt_flights
*" INTO gs_flight copia cada línea en la estructura de trabajo
*"------------------------------------------------------------
*LOOP AT gt_flights INTO gs_flight.
*
*  " Muestra el contenido completo de la estructura actual
*  " name = 'gs_flight' es solo una etiqueta para el output
*  out->write(
*    data = gs_flight
*    name = 'gs_flight'
*  ).
*
*ENDLOOP.
*
*
*
*"------------------------------------------------------------
*" LOOP 2: Recorrer SOLO las líneas que cumplan la condición
*" WHERE connection_id = '0401'
*"
*" DATA(gs_flight2) declara inline la variable de trabajo
*"------------------------------------------------------------
*LOOP AT gt_flights INTO DATA(gs_flight2)
*     WHERE connection_id = '0401'.      " Aquí escribirá tantas filas que incluyan la condición connection_id = '0401'
**     WHERE connection_id = '049999'. " Aqui no saldrá nada porque no existe este registro
*
*  " Solo se mostrará la(s) línea(s) cuyo connection_id sea 0401
*  out->write(
*    data = gs_flight2
*    name = 'gs_flight2'
*  ).
*
*ENDLOOP.


"/////////////////////////////////////////////////////////////////////
" SELECT – HACER CONSULTAS BASE DATOS
"/////////////////////////////////////////////////////////////////////

"===============================================================
" 1) SELECT DESDE BASE DE DATOS A TABLA INTERNA
"===============================================================
" Leemos datos de la tabla de base de datos /dmo/flight
" En este caso solo vuelos de la compañía LH

SELECT FROM /dmo/flight
  FIELDS *                                  " Selecciona todos los campos (*)
  WHERE carrier_id = 'LH'                   " Filtro
  INTO TABLE @DATA(gt_flights).             " Crea tabla interna automáticamente


" 🔎 ¿Qué ha pasado aquí?
" - Hemos leído la BD
" - Hemos creado una tabla interna gt_flights
" - La tabla ya contiene datos en memoria


"===============================================================
" 2) SELECT DESDE TABLA INTERNA (SELECT INTERNO)
"===============================================================
" Ahora no leemos de base de datos,
" leemos desde la tabla interna anterior

SELECT carrier_id,
       connection_id,
       flight_date
  FROM @gt_flights AS gt                    " Fuente = tabla interna
  INTO TABLE @DATA(gt_flights_copy).        " Nueva tabla interna


" 🔎 ¿Qué hace esto?
" - NO accede a base de datos
" - Trabaja 100% en memoria
" - Copia solo los campos indicados
" - Es equivalente a un “subselect”


"===============================================================
" 3) MOSTRAR RESULTADO
"===============================================================
out->write(
  data = gt_flights_copy        " INFORMACION A MOSTRAR
  name = 'gt_flights_copy'      " TITULO EN CONSOLA
).

"/////////////////////////////////////////////////////////////////////
" SORT – ORDENAR
"/////////////////////////////////////////////////////////////////////

*sort gt_flights_copy. " Por defecto ascendente
*sort gt_flights_copy DESCENDING. " dESCENDENTE
*sort gt_flights_copy BY flight_date. " POR UN campo en concreto
sort gt_flights_copy BY flight_date DESCENDING connection_id ASCENDING. " combinación de campos
out->write(
  data = gt_flights_copy        " INFORMACION A MOSTRAR
  name = 'gt_flights_copy'      " TITULO EN CONSOLA
).

"/////////////////////////////////////////////////////////////////////
" MODIFY – MODIFICAR UN REGISTRO
"/////////////////////////////////////////////////////////////////////

out->write(
  data = gt_flights_copy        " INFORMACION A MOSTRAR
  name = 'BEFORE MODIFY'      " TITULO EN CONSOLA
).

"Recorrer la tabla generando una condición para indicar el registro a modifi
*LOOP AT gt_flights_copy INTO DATA(gs_flights_copy).
* if gs_flights_copy-flight_date < '20260101'.
*
*        gs_flights_copy-flight_date = cl_abap_context_info=>get_system_date( ).
*        MODIFY gt_flights_copy FROM gs_flights_copy.
*endif.
*ENDLOOP.
*out->write(
*  data = gt_flights_copy        " INFORMACION A MOSTRAR
*  name = 'AFTER MODIFY'      " TITULO EN CONSOLA
*).

"Recorrer la tabla generando una condición para indicar el registro a modifi
*LOOP AT gt_flights_copy INTO DATA(gs_flights_copy).*
*        gs_flights_copy-flight_date = cl_abap_context_info=>get_system_date( ).
*        MODIFY gt_flights_copy FROM gs_flights_copy INDEX 2. " SOLO CAMBIO FILA 2

*ENDLOOP.
*out->write(
*  data = gt_flights_copy        " INFORMACION A MOSTRAR
*  name = 'INDEX 2'      " TITULO EN CONSOLA
*).

"Recorrer la tabla generando una condición para indicar el registro a modifi
LOOP AT gt_flights_copy INTO DATA(gs_flights_copy).
 if gs_flights_copy-flight_date < '20260101'.

        gs_flights_copy-flight_date = cl_abap_context_info=>get_system_date( ).
        MODIFY gt_flights_copy FROM gs_flights_copy TRANSPORTING flight_date.  "SE ASEGURA QUE SOLO MODIIFCO FLIGHT_DATE (QUE NO CAMBIE EL RESTO DE COLUMNAS)
endif.
ENDLOOP.
out->write(
  data = gt_flights_copy        " INFORMACION A MOSTRAR
  name = 'AFTER TRANSPORTING'      " TITULO EN CONSOLA
).
  ENDMETHOD.
ENDCLASS.
