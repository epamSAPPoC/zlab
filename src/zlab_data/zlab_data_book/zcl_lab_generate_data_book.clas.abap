CLASS zcl_lab_generate_data_book DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_book.
ENDCLASS.



CLASS zcl_lab_generate_data_book IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    me->fill_book(  ).

  ENDMETHOD.

  METHOD fill_book.

    DATA: lt_data TYPE TABLE OF zlab_d_book_a.

    lt_data  = VALUE #(
    (
      book_id = '1' book_name = 'A Song of Ice and Fire' author_id = '1'
      pages_num = 800 copy_qty = 2

    )
    (
      book_id = '2' book_name = 'IT' author_id = '2'
      pages_num = 300 copy_qty = 1

    )
    (
       book_id = '3' book_name = 'The Picture of Dorian Gray' author_id = '3'
      pages_num = 150 copy_qty = 2

    )
    (
      book_id = '4' book_name = 'The Master and Margarita' author_id = '4'
      pages_num = 350 copy_qty = 2

    )
    (
      book_id = '5' book_name = 'Norwegian Wood' author_id = '5'
      pages_num = 300 copy_qty = 2

    )
    (
      book_id = '6' book_name = 'The Mysterious Island' author_id = '6'
      pages_num = 500 copy_qty = 1

    )
    ).
    DELETE FROM zlab_d_book_a.
    INSERT zlab_d_book_a FROM TABLE @lt_data.

  ENDMETHOD.
ENDCLASS.
