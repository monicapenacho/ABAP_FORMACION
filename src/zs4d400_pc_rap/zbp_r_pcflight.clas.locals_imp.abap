CLASS LHC_ZR_PC_FLIGHT DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR Vuelo
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
            IMPORTING keys FOR Vuelo~validatePrice,
      validateCurrencyCode FOR VALIDATE ON SAVE
            IMPORTING keys FOR Vuelo~validateCurrencyCode.
ENDCLASS.

CLASS LHC_ZR_PC_FLIGHT IMPLEMENTATION.

  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

  METHOD validatePrice.
  "Declaración objeto de datos estructurado
  DATA failed_record LIKE LINE OF failed-vuelo.
  DATA reported_record LIKE LINE OF reported-vuelo.
  "READ ENTITIES para leer la entrada de usuario de la memoria intermedia transaccional
*  Nota:
*    No es necesario enumerar los campos clave después del suplemento FIELDS.
*    LEER ENTIDADES siempre lee los campos clave.
  READ ENTITIES OF ZR_PC_flight IN LOCAL MODE
    ENTITY Vuelo
    FIELDS ( Price )
        WITH CORRESPONDING #( keys )
    RESULT DATA(flights).
  "Implementar LOOP: verificar con IF si precio >0
*  En los business objects habilitados para borradores,
*  se recomienda
*  utilizar el componente %tky para asignar la clave.
  "Para crear el objeto de mensaje, llame el método me->new_message
  LOOP AT flights INTO DATA(flight).
   IF flight-price <= 0.
    failed_record-%tky = flight-%tky.
    APPEND failed_record TO failed-vuelo.
    reported_record-%tky = flight-%tky.
    reported_record-%msg =
        new_message(
            id = '/LRN/S4D400'
            number = '101'
            severity = if_abap_behv_message=>severity-error
            ).
    APPEND reported_record TO reported-vuelo.
   ENDIF.
  ENDLOOP.
  ENDMETHOD.


  METHOD validateCurrencyCode.

  "declare los objetos de datos estructurados failed_record y reported_record
  DATA failed_record LIKE LINE OF failed-Vuelo.
  DATA reported_record LIKE LINE OF reported-Vuelo.
  " En la validación de CurrencyCode, necesitas comprobar si la moneda existe en la vista CDS I_Currency.
  " abap_bool es un tipo estándar de ABAP que representa un booleano (verdadero / falso).
  DATA exists TYPE abap_bool.

  "READ ENTITIES para leer la entrada de usuario de la memoria intermedia transaccional
*  Nota:
*    No es necesario enumerar los campos clave después del suplemento FIELDS.
*    LEER ENTIDADES siempre lee los campos clave.
  READ ENTITIES OF ZR_PC_flight IN LOCAL MODE
    ENTITY Vuelo
    FIELDS ( currencycode )
        WITH CORRESPONDING #( keys )
    RESULT DATA(flights).

  "Implementar LOOP: verificar con IF si CurrencyCode es correcto
*  En los business objects habilitados para borradores,
*  se recomienda
*  utilizar el componente %tky para asignar la clave.
  LOOP AT flights INTO DATA(flight).
    exists = abap_false.

    SELECT SINGLE FROM i_currency
        FIELDS @abap_true
        WHERE currency = @flight-currencycode
        INTO @exists.

    IF exists = abap_false. " the currency code is not valid

    failed_record-%tky = flight-%tky.
    APPEND failed_record TO failed-vuelo.
    reported_record-%tky = flight-%tky.
    reported_record-%msg =
        new_message(
            id = '/LRN/S4D400'
            number = '102'
            severity = if_abap_behv_message=>severity-error
            v1 = flight-currencycode
            ).
    APPEND reported_record TO reported-vuelo.

    ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
