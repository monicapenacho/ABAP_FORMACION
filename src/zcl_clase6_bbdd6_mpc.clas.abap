"---------------------------------------------------------
" CLASE ALTA EMPLEADO CON PERSONA RANDOM
"---------------------------------------------------------

CLASS zcl_clase6_bbdd6_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

ENDCLASS.



CLASS zcl_clase6_bbdd6_mpc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "---------------------------------------------------------
    " 1️ Leer base de datos y mostrar datos actuales
    "---------------------------------------------------------
    DATA lt_empleados TYPE STANDARD TABLE OF zbd_empleado_mpc
                      WITH EMPTY KEY.

    SELECT *
      FROM zbd_empleado_mpc
      INTO TABLE @lt_empleados.

    out->write(
      data = lt_empleados
      name = 'Datos actuales en BBDD'
    ).

    "---------------------------------------------------------
    " 2️ Obtener el ID mayor existente
    "---------------------------------------------------------
    DATA lv_max_id TYPE zbd_empleado_mpc-id.

    SELECT MAX( id )
      FROM zbd_empleado_mpc
      INTO @lv_max_id.

    IF lv_max_id IS INITIAL.
      lv_max_id = 0.   " Si tabla vacía, empezamos en 1
    ENDIF.

    out->write( |ID máximo actual: { lv_max_id }| ).

    "---------------------------------------------------------
    " 3️ Obtener persona random desde clase proveedora
    "---------------------------------------------------------
    DATA(ls_persona) =
      zcl_claes6_ti_personas_mpc=>get_random_persona( ).

    IF ls_persona IS INITIAL.
      out->write( 'No se pudo obtener persona random' ).
      RETURN.
    ENDIF.

    "---------------------------------------------------------
    " 4️ Crear estructura nuevo empleado
    "---------------------------------------------------------
    DATA ls_nuevo TYPE zbd_empleado_mpc.

    ls_nuevo-client   = sy-mandt.                          " Mandante actual
    ls_nuevo-id       = lv_max_id + 1.                     " Nuevo ID
    ls_nuevo-nombre   = ls_persona-nombre.                 " Nombre random
    ls_nuevo-mail     = ls_persona-mail.                   " Mail random
    ls_nuevo-telefono = zcl_random_telefono_mpc=>obtener_telefono( ). " Teléfono random

    "---------------------------------------------------------
    " 5️ Insertar en base de datos º
    "---------------------------------------------------------

    INSERT zbd_empleado_mpc FROM @ls_nuevo.

    IF sy-subrc = 0.
      out->write( 'Empleado insertado correctamente' ).
    ELSE.
      out->write( 'Error al insertar empleado' ).
    ENDIF.

    "---------------------------------------------------------
    " 6️ Mostrar datos después del INSERT
    "---------------------------------------------------------
    CLEAR lt_empleados.

    SELECT *
      FROM zbd_empleado_mpc
      INTO TABLE @lt_empleados.

    out->write(
      data = lt_empleados
      name = 'Datos después del INSERT'
    ).

  ENDMETHOD.

ENDCLASS.
