CLASS zcl_clase5_bbdd2_mpc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_clase5_bbdd2_mpc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "---------------------------------------------------------
    " Crear variable de número empleado
        "---------------------------------------------------------

    DATA: lv_id TYPE zbd_empleado_mpc-id.


    "---------------------------------------------------------
    " Borramos tabla (solo para pruebas)
    "---------------------------------------------------------
    DELETE FROM zbd_empleado_mpc.

    "---------------------------------------------------------
    " Generamos ID automático
    "---------------------------------------------------------
     " 1️ Obtener el ID más alto existente
    SELECT MAX( id )
      FROM zbd_empleado_mpc
      INTO @lv_id.

    " 2️ Si la tabla está vacía, empezamos en 1
    IF lv_id IS INITIAL.
      lv_id = 1.
    ELSE.
      lv_id = lv_id + 1.
    ENDIF.

    "---------------------------------------------------------
    " Insertamos empleado con ID automático
    "---------------------------------------------------------

    MODIFY zbd_empleado_mpc FROM TABLE @(
        VALUE #(

            (
            client = '100' " client = sy-mandt
            id     = lv_id
            nombre = 'Mónica'
            mail = 'monica@gmail.com'
            telefono = 123456789 )

            (
            client = '100'
            id     = lv_id
            nombre = 'Juan'
            mail = 'juan@gmail.com'
            telefono = 123456788 )

                        (
            client = '100'
            id     = lv_id
            nombre = 'Eva'
            mail = 'eva@gmail.com'
            telefono = 123456787 )

        )



     ).



  ENDMETHOD.
ENDCLASS.
