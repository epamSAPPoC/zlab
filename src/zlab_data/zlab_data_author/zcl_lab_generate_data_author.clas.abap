CLASS zcl_lab_generate_data_author DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_author.
ENDCLASS.



CLASS zcl_lab_generate_data_author IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    me->fill_author(  ).

  ENDMETHOD.

  METHOD fill_author.

    DATA: lt_data TYPE TABLE OF zlab_d_author_a.

    lt_data  = VALUE #(
    (
      author_id = '1' birth_date = '19480920' country = 'USA'

    )
    (
      author_id = '2' birth_date = '19470921' country = 'USA'

    )
    (
      author_id = '3' birth_date = '18541016' country = 'IRL'

    )
    (
      author_id = '4' birth_date = '18910515' country = 'RUS'

    )
    (
      author_id = '5' birth_date = '19490112' country = 'JPN'

    )
    (
      author_id = '6' birth_date = '18280208' country = 'FRA'

    )
    ).
         DELETE FROM zlab_d_author_a.
         INSERT zlab_d_author_a FROM TABLE @lt_data.

  ENDMETHOD.
ENDCLASS.
