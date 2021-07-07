@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
define root view entity zlab_i_booking
  as select from zlab_d_booking_a
  association [1..1] to zlab_i_reader as _Reader on $projection.PersonId = _Reader.PersonId
  association [1..1] to zlab_i_book   as _Book   on $projection.BookId   = _Book.BookId
  association [1..1] to zlab_i_status as _Status on $projection.BookingStatusId = _Status.StatusId
{
  key booking_uuid     as BookingUuid, 
      booking_id       as BookingId,
      book_id          as BookId,
      person_id        as PersonId,
      concat_with_space(_Reader._ReaderTxt.PersonFirstName, _Reader._ReaderTxt.PersonLastName, 1) as PersonName,
      booking_status_id as BookingStatusId,
      booking_beg_date as BookingBegDate,
      booking_beg_time as BookingBegTime,
      booking_end_date as BookingEndDate,
      booking_end_time as BookingEndTime,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @EndUserText.label : 'Created At'
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @EndUserText.label : 'Last Changed At'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      'sap-icon://course-book' as ImageUrl,
      _Reader,
      _Book,
      _Status
}
