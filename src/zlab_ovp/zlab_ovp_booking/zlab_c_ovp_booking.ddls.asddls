@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'OVP: Booking'
@Metadata.allowExtensions: true
define view entity zlab_c_ovp_booking
  as select from zlab_i_ovp_booking
{
  key BookingUuid,
      @Consumption.semanticObject: 'zlab_ui_booking'
      BookingId,
      @Consumption.semanticObject: 'zlab_ui_book'
      @ObjectModel.text.element: ['BookName']
      BookId,
      _Book.BookName as BookName,
      @Consumption.semanticObject: 'zlab_ui_reader'
      @ObjectModel.text.element: ['PersonName']
      PersonId,
      PersonName,
      @ObjectModel.text.element: ['StatusName']
      BookingStatusId,
      _Status.StatusName as StatusName,
      BookingBegDate,
      BookingBegTime,
      BookingEndDate,
      BookingEndTime,
      @Aggregation.default: #SUM
      BookQuantity,
      _Book,
      _Reader,
      _Status
}
