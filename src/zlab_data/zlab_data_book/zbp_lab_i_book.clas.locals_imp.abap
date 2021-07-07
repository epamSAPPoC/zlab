CLASS lhc_Book DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Book RESULT result.


ENDCLASS.

CLASS lhc_Book IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.



ENDCLASS.
