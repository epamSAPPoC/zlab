CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PUBLIC SECTION.

    CONSTANTS: mc_available_status TYPE zlab_d_booking_a-booking_status_id VALUE '1',
               mc_taken_status     TYPE zlab_d_booking_a-booking_status_id VALUE '2'.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING it_keys REQUEST requested_authorizations FOR Booking RESULT et_result.
    METHODS validatebookavailability FOR VALIDATE ON SAVE
      IMPORTING it_keys FOR Booking~validateBookAvailability.
    METHODS bookthebook FOR DETERMINE ON SAVE
      IMPORTING it_keys FOR Booking~bookTheBook.
    METHODS returnTheBook FOR MODIFY
      IMPORTING it_keys FOR ACTION Booking~returnTheBook RESULT et_result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING it_keys REQUEST requested_features FOR Booking RESULT et_result.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD validatebookavailability.

    DATA lt_book_keys      TYPE TABLE FOR READ IMPORT zlab_i_book.

    READ ENTITIES OF zlab_i_booking IN LOCAL MODE
     ENTITY Booking
     FIELDS ( BookId )
     WITH CORRESPONDING #( it_keys )
    RESULT DATA(lt_bookings).

    LOOP AT lt_bookings ASSIGNING FIELD-SYMBOL(<ls_booking>).

      lt_book_keys = VALUE #( ( BookId = <ls_booking>-BookId ) ).

      READ ENTITIES OF zlab_i_book
       ENTITY Book
       FIELDS ( BookName CopyQty )
       WITH CORRESPONDING #( lt_book_keys )
      RESULT DATA(lt_books).

      DATA(lv_book_qty) = lt_books[ 1 ]-CopyQty.

      SELECT SINGLE COUNT( * )
      FROM zlab_d_booking_a
      WHERE book_id           = @<ls_booking>-BookId
        AND booking_status_id = @mc_taken_status
      INTO @DATA(lv_book_reserved).

      IF lv_book_qty - lv_book_reserved < 0.

        APPEND VALUE #(  %tky = <ls_booking>-%tky ) TO failed-booking.
        APPEND VALUE #(  %tky = <ls_booking>-%tky
                         %msg = NEW zcm_booking(
                              bookname = lt_books[ 1 ]-BookName
                              textid   = zcm_booking=>book_unavailable
                              severity = if_abap_behv_message=>severity-error ) )
        TO reported-booking.

      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD bookthebook.

    MODIFY ENTITIES OF zlab_i_booking IN LOCAL MODE
    ENTITY Booking
    UPDATE FROM VALUE #( FOR ls_key IN it_keys ( %tky = ls_key-%tky
                                                 BookingStatusId = mc_taken_status
                                                 BookingBegDate  = cl_abap_context_info=>get_system_date( )
                                                 BookingBegTime  = cl_abap_context_info=>get_system_time( )
                                                 %control-BookingStatusId = if_abap_behv=>mk-on
                                                 %control-BookingBegDate  = if_abap_behv=>mk-on
                                                 %control-BookingBegTime  = if_abap_behv=>mk-on ) )
           FAILED   DATA(lt_failed)
           REPORTED DATA(lt_reported).

    reported = CORRESPONDING #( DEEP lt_reported ).

  ENDMETHOD.

  METHOD returnTheBook.

    MODIFY ENTITIES OF zlab_i_booking IN LOCAL MODE
           ENTITY Booking
           UPDATE FROM VALUE #( FOR ls_key IN it_keys ( %tky = ls_key-%tky
                                                        BookingStatusId = mc_available_status
                                                        BookingEndDate  = cl_abap_context_info=>get_system_date( )
                                                        BookingEndTIme  = cl_abap_context_info=>get_system_time( )
                                                        %control-BookingStatusId = if_abap_behv=>mk-on
                                                        %control-BookingEndDate  = if_abap_behv=>mk-on
                                                        %control-BookingEndTime  = if_abap_behv=>mk-on ) )
           FAILED   failed
           REPORTED reported.


    READ ENTITIES OF zlab_i_booking IN LOCAL MODE
         ENTITY Booking
           ALL FIELDS
             WITH VALUE #( FOR ls_key IN it_keys ( %tky = ls_key-%tky ) )
         RESULT DATA(lt_bookings).

    et_result = VALUE #( FOR ls_booking IN lt_bookings ( %tky      = ls_booking-%tky
                                                         %param    = ls_booking ) ).

  ENDMETHOD.

  METHOD get_instance_features.

    READ ENTITIES OF zlab_i_booking IN LOCAL MODE
      ENTITY Booking
         FIELDS (  BookingStatusId )
         WITH CORRESPONDING #( it_keys )
       RESULT DATA(lt_bookings)
       FAILED failed.


    et_result = VALUE #( FOR ls_booking IN lt_bookings
                       ( %tky                           = ls_booking-%tky
                         %features-%action-returnTheBook = COND #( WHEN ls_booking-BookingStatusId = mc_taken_status
                                                                   THEN if_abap_behv=>fc-o-enabled ELSE if_abap_behv=>fc-o-disabled  )
                      ) ).
  ENDMETHOD.

ENDCLASS.
