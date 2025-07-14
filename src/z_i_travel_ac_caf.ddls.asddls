@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vuelos Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity z_i_travel_ac_caf
  as select from zcaf_travel
{
  key travel_uuid          as TravelUUID,
      travel_id            as TravelID,
      agency_id            as AgencyID,
      custemer_id          as CustemerID,
      begin_date           as BeginDate,
      end_date             as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee          as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price          as TotalPrice,
      currency_code        as CurrencyCode,
      description          as Description,
      overall_status       as OverallStatus,
      @Semantics.user.createdBy: true
      local_created_by     as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at     as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_change_by as LocalLastChangeBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_change_at as LocalLastChangeAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_change_at       as LastChangeAt
}
