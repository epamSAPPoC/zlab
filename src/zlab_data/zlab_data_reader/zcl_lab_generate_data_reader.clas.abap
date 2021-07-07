CLASS zcl_lab_generate_data_reader DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_reader.
ENDCLASS.



CLASS zcl_lab_generate_data_reader IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    me->fill_reader(  ).

  ENDMETHOD.

  METHOD fill_reader.

    DATA: lt_data TYPE TABLE OF zlab_d_reader_a.

    lt_data  = VALUE #(
    ( person_id = '1' birth_date = '20000920' phone_number = '+375(29)546-32-11')
    ( person_id = '2' birth_date = '19800921' phone_number = '+375(29)546-32-12')
    ( person_id = '3' birth_date = '19701016' phone_number = '+375(29)546-32-13')
    ( person_id = '4' birth_date = '19950515' phone_number = '+375(29)546-32-14')
    ( person_id = '5' birth_date = '20010112' phone_number = '+375(29)546-32-15')
    ).
         DELETE FROM zlab_d_reader_a.
         INSERT zlab_d_reader_a FROM TABLE @lt_data.

  ENDMETHOD.
ENDCLASS.
