class zcl_cloud_02_data_gen_ac_caf definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.

  protected section.
  private section.
endclass.

class zcl_cloud_02_data_gen_ac_caf implementation.

  method if_oo_adt_classrun~main.
    out->write( 'Add Travel Data...' ).

    delete from zcaf_travel.

    insert zcaf_travel from (
           select from /dmo/travel
           fields
             uuid( ) as travel_uuid,
             travel_id,
             agency_id,
             customer_id,
             begin_date,
             end_date,
             booking_fee,
             total_price,
             currency_code,
             description,
             case status when 'B' then 'A'
                         when 'P' then 'O'
                         when 'N' then 'O'
                         else 'X' end as overall_status,
             createdby as local_created_by,
             createdat as local_created_at,
             lastchangedby as local_last_change_by,
             lastchangedat as local_last_change_at,
             lastchangedat as last_change_at ).

    out->write( |{ sy-dbcnt } rows added.| ).
  endmethod.

endclass.
