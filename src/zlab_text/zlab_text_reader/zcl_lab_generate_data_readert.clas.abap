CLASS zcl_lab_generate_data_readert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_reader_txt.
ENDCLASS.



CLASS zcl_lab_generate_data_readert IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    me->fill_reader_txt(  ).

  ENDMETHOD.

  METHOD fill_reader_txt.

    DATA: lt_data TYPE TABLE OF zlab_d_reader_t.

    lt_data  = VALUE #(
    ( spras = 'E' person_id = '1' person_first_name = 'Sergey'  person_last_name  = 'Petrov'   )
    ( spras = 'E' person_id = '2' person_first_name = 'Ivan'    person_last_name  = 'Ivanov'   )
    ( spras = 'E' person_id = '3' person_first_name = 'Anna'    person_last_name  = 'Adamova'  )
    ( spras = 'E' person_id = '4' person_first_name = 'Mikhail' person_last_name  = 'Popov'    )
    ( spras = 'E' person_id = '5' person_first_name = 'Elena'   person_last_name  = 'Sergeeva' )
    ( spras = 'R' person_id = '1' person_first_name = 'Сергей'  person_last_name  = 'Петров'   )
    ( spras = 'R' person_id = '2' person_first_name = 'Иван'    person_last_name  = 'Иванов'   )
    ( spras = 'R' person_id = '3' person_first_name = 'Анна'    person_last_name  = 'Адамова'  )
    ( spras = 'R' person_id = '4' person_first_name = 'Михаил'  person_last_name  = 'Попов'    )
    ( spras = 'R' person_id = '5' person_first_name = 'Елена'   person_last_name  = 'Сергеева' )
    ).
    DELETE FROM zlab_d_reader_t.
    INSERT zlab_d_reader_t FROM TABLE @lt_data.

  ENDMETHOD.
ENDCLASS.
