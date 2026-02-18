CLASS zcl_clase5_bbdd5_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zcl_clase5_bbdd5_mpc IMPLEMENTATION.

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
      name = 'Datos actuales en BBDD (cambios en ZCL_CLASE5_BBDD3)'
    ).

    "---------------------------------------------------------
    " 2️ Obtener el ID mayor existente
    "---------------------------------------------------------

    DATA lv_max_id TYPE zbd_empleado_mpc-id.

    SELECT MAX( id )
     FROM zbd_empleado_mpc
      INTO @lv_max_id.
*
*          SELECT MAX( id )
*      FROM zbd_empleado_mpc
*      INTO @DATA(lv_max_id).

        " Si no hay registros, empezamos en 1
*    IF lv_max_id IS INITIAL.
*      lv_max_id = 1.
*    ELSE.
*      lv_max_id = lv_max_id + 1.
*    ENDIF.

    out->write( |ID maximo actual: { lv_max_id }| ).

    "---------------------------------------------------------
    " 3️ Insertar nuevo empleado con ID = MAX + 1
    "---------------------------------------------------------

    DATA ls_nuevo TYPE zbd_empleado_mpc.

    ls_nuevo-client   = sy-mandt.
    ls_nuevo-id       = lv_max_id + 1.
    ls_nuevo-nombre   = 'Empleado Nuevo'.
    ls_nuevo-mail     = 'nuevo@gmail.com'.
    ls_nuevo-telefono = zcl_random_telefono_mpc=>obtener_telefono( ).

    INSERT zbd_empleado_mpc FROM @ls_nuevo.

    "---------------------------------------------------------
    " 4️ Mostrar datos después del INSERT
    "---------------------------------------------------------

    CLEAR lt_empleados.

    SELECT *
      FROM zbd_empleado_mpc
      INTO TABLE @lt_empleados.

    out->write(
      data = lt_empleados
      name = 'Datos después del INSERT empleado nuevo (cambios en ZCL_CLASE5_BBDD4)'
    ).

  ENDMETHOD.

ENDCLASS.
