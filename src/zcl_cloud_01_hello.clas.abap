class zcl_cloud_01_hello definition
  public
  final
  create public .

  public section.

    interfaces if_oo_adt_classrun.

  protected section.
  private section.

endclass.

class zcl_cloud_01_hello implementation.
  method if_oo_adt_classrun~main.
    data lv_hello type string.

    concatenate 'Hello Development for Cloud,' sy-uname
           into lv_hello separated by space.


*    data(lv_hello) = out->get( lv_hello ).

    out->write( lv_hello ).
    out->write( 'Second Commit' ).

  endmethod.

endclass.
