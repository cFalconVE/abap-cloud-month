class lhc_Vuelos definition inheriting from cl_abap_behavior_handler.
  private section.

    methods get_instance_authorizations for instance authorization
      importing keys request requested_authorizations for Vuelos result result.

    methods get_global_authorizations for global authorization
      importing request requested_authorizations for Vuelos result result.

endclass.

class lhc_Vuelos implementation.

  method get_instance_authorizations.
  endmethod.

  method get_global_authorizations.
  endmethod.

endclass.
