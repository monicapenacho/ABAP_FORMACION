CLASS zcl_clase5_bbdd3_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_clase5_bbdd3_mpc IMPLEMENTATION.

    "

    METHOD if_oo_adt_classrun~main.

      "---------------------------------------------------------
    " 1 Declarar objetos
    "---------------------------------------------------------

    "---------------------------------------------------------
    " Crear variable de número empleado
    "---------------------------------------------------------

    DATA: lv_id TYPE zbd_empleado_mpc-id.          " ID empleado

    "---------------------------------------------------------
    " Crear tabla interna
    "---------------------------------------------------------
    DATA: lt_empleados TYPE STANDARD TABLE OF zbd_empleado_mpc
                        WITH EMPTY KEY.            " Tabla interna

    "---------------------------------------------------------
    " 2 Generamos ID automático
    "---------------------------------------------------------

    lv_id = 1.   " Empezamos en 1

    "---------------------------------------------------------
    " 3 Insertamos empleado
    "---------------------------------------------------------


     APPEND VALUE #(
            client = '100' " client = sy-mandt
            id     = lv_id
            nombre = 'Mónica'
            mail = 'monica@gmail.com'
            telefono = 123456789 )
    TO lt_empleados.

    lv_id = lv_id + 1.

    APPEND VALUE #(
        client   = sy-mandt
        id       = lv_id
        nombre   = 'Juan'
        mail     = 'juan@gmail.com'
        telefono = 123456788 )
    TO lt_empleados.

    lv_id = lv_id + 1.

    APPEND VALUE #(
        client   = sy-mandt
        id       = lv_id
        nombre   = 'Eva'
        mail     = 'eva@gmail.com'
        telefono = 123456787 )
    TO lt_empleados.

    "---------------------------------------------------------
    " 4️ Mostrar contenido de la tabla interna
    "---------------------------------------------------------

    out->write( data = lt_empleados name = 'Tabla Interna Empleados' ).

    "---------------------------------------------------------
    " 5️ Guardar en base de datos
    "---------------------------------------------------------
    MODIFY zbd_empleado_mpc FROM TABLE @lt_empleados.

  ENDMETHOD.
ENDCLASS.
