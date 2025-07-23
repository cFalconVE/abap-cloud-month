class zcl_test_lock_object_caf definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun .
  protected section.
  private section.
endclass.

class zcl_test_lock_object_caf implementation.

  method if_oo_adt_classrun~main.

    try.
        data(lo_lock) = cl_abap_lock_object_factory=>get_instance( iv_name = 'EZCAF_TRAVEL' ).

        out->write( |Init Proccess Time: { cl_abap_context_info=>get_system_time( ) }| ).

        lo_lock->enqueue( it_parameter = value #( ( name = 'TRAVEL_UUID' value = ref #( 'DC4EE4800ABAFF7C1900C15E2407D260' ) ) ) ).

        out->write( |Lock Time: { cl_abap_context_info=>get_system_time( ) }| ).

        update zcaf_travel
           set booking_fee = '40.00'
         where travel_uuid = 'DC4EE4800ABAFF7C1900C15E2407D260'.

        wait up to 30 seconds.

        if sy-subrc eq 0.
          commit work.
          out->write( |Update OK| ).
        endif.

        lo_lock->dequeue( ).

        out->write( |UnLock Time: { cl_abap_context_info=>get_system_time( ) }| ).

      catch cx_abap_lock_failure into data(lx_lock_failure).
        out->write( |Lock Failure: { lx_lock_failure->get_text( ) }| ).

      catch cx_abap_foreign_lock into data(lx_foreign_lock).

        data(lv_locking_user) = lx_foreign_lock->user_name.
*        out->write( |Lock by User: { lx_foreign_lock->user_name }| ).
        out->write( |Lock by User: { lv_locking_user }| ).

    endtry.

  endmethod.
endclass.
