"---------------------------------------------------------
" CLASE GENERADORA DE TELÉFONOS RANDOM
"---------------------------------------------------------

CLASS zcl_random_telefono_mpc DEFINITION PUBLIC.

  PUBLIC SECTION.                              " Sección pública (visible desde fuera)

    INTERFACES if_oo_adt_classrun .

    CLASS-METHODS obtener_telefono                    " Método estático (no requiere NEW)
*      RETURNING VALUE(rv_telefono) TYPE string.   " Devuelve el teléfono como STRING
      RETURNING VALUE(rv_telefono) TYPE i.   " Devuelve el teléfono como i

ENDCLASS.



CLASS zcl_random_telefono_mpc IMPLEMENTATION.



    METHOD obtener_telefono.

    "---------------------------------------------------------
    " Crear objeto generador de números aleatorios
    "---------------------------------------------------------

    DATA(lo_random) =                           " Declaramos referencia al objeto random
      cl_abap_random_int=>create(               " Clase estándar SAP para generar números enteros random

        seed = cl_abap_random=>seed( )          " Semilla automática (evita repetir números)
        min  = 600000000                        " Valor mínimo (empieza por 6 tipo móvil España)
        max  = 699999999                        " Valor máximo (9 dígitos tipo móvil España)

      ).                                        " Fin creación objeto random

    "---------------------------------------------------------
    " Obtener siguiente número aleatorio
    "---------------------------------------------------------

    rv_telefono = lo_random->get_next( ).          " Genera el número random y lo devuelve

    ENDMETHOD.

      METHOD if_oo_adt_classrun~main.

        DATA(lv_telefono) = zcl_random_telefono_mpc=>obtener_telefono( ).

         out->write( | Teléfono generado: { lv_telefono } | ).

      ENDMETHOD.


ENDCLASS.
