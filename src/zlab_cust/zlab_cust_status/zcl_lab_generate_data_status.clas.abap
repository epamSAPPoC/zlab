CLASS zcl_lab_generate_data_status DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_status.
ENDCLASS.



CLASS zcl_lab_generate_data_status IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    me->fill_status(  ).

  ENDMETHOD.

  METHOD fill_status.

    DATA: lt_data TYPE TABLE OF zlab_c_status_a.

    lt_data  = VALUE #(
    (
        status_id = '1' status_name = 'Available'
    )
    (
        status_id = '2' status_name = 'Taken'
    )
    (
        status_id = '3' status_name = 'Repair'
    )
    (
        status_id = '4' status_name = 'Maintenance'
    )
    (
        status_id = '5' status_name = 'Conservated'
    )
    ).
    DELETE FROM zlab_c_status_a.
    INSERT zlab_c_status_a FROM TABLE @lt_data.

  ENDMETHOD.
ENDCLASS.
