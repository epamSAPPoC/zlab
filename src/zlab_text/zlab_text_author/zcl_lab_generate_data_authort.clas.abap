CLASS zcl_lab_generate_data_authort DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_author_txt.
ENDCLASS.



CLASS zcl_lab_generate_data_authort IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    me->fill_author_txt(  ).

  ENDMETHOD.

  METHOD fill_author_txt.

    DATA: lt_data TYPE TABLE OF zlab_d_author_t.

    lt_data  = VALUE #(
    (
      spras = 'E' author_id         = '1'
      author_first_name = 'George' author_last_name  = 'Martin'
    )
    (
      spras = 'E' author_id         = '2'
      author_first_name = 'Stephen' author_last_name  = 'King'
    )
    (
      spras = 'E' author_id         = '3'
      author_first_name = 'Oscar' author_last_name  = 'Wilde'
    )
    (
      spras = 'E' author_id         = '4'
      author_first_name = 'Mikhail' author_last_name  = 'Bulgakov'
    )
    (
      spras = 'E' author_id         = '5'
      author_first_name = 'Haruki' author_last_name  = 'Murakami'
    )
    (
      spras = 'E' author_id         = '6'
      author_first_name = 'Jules' author_last_name  = 'Verne'
    )
    (
      spras = 'R' author_id         = '1'
      author_first_name = 'Джордж' author_last_name  = 'Мартин'
    )
    (
      spras = 'R' author_id         = '2'
      author_first_name = 'Стивен' author_last_name  = 'Кинг'
    )
    (
      spras = 'R' author_id         = '3'
      author_first_name = 'Оскар' author_last_name  = 'Уайлд'
    )
    (
      spras = 'R' author_id         = '4'
      author_first_name = 'Михаил' author_last_name  = 'Булгаков'
    )
    (
      spras = 'R' author_id         = '5'
      author_first_name = 'Харуки' author_last_name  = 'Мураками'
    )
    (
      spras = 'R' author_id         = '6'
      author_first_name = 'Жюль' author_last_name  = 'Верн'
    )
    ).
         DELETE FROM zlab_d_author_t.
         INSERT zlab_d_author_t FROM TABLE @lt_data.

  ENDMETHOD.
ENDCLASS.
