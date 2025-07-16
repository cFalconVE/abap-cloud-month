@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vuelo Consumption'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity Z_C_TRAVEL_AC_CAF
  provider contract transactional_query
  as projection on z_i_travel_ac_caf
{
  key TravelUUID,
      TravelID,
      @Consumption.valueHelpDefinition: [{ entity : { name : '/DMO/I_Agency_StdVH',
                                                      element: 'AgencyID' },
                                           useForValidation: true }]
      AgencyID,
      CustemerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity : { name : 'I_CurrencyStdVH',
                                                      element: 'Currency' },
                                           useForValidation: true }]
      CurrencyCode,
      Description,
      OverallStatus,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangeBy,
      LocalLastChangeAt,
      LastChangeAt
}
