@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'OVP: Booking'
@Search.searchable: true
define view entity zlab_i_ovp_booking_flt
  as select from zlab_d_booking_a
  association [1..1] to zlab_i_reader as _Reader on $projection.PersonId = _Reader.PersonId
  association [1..1] to zlab_i_book   as _Book   on $projection.BookId = _Book.BookId
  association [1..1] to zlab_i_status as _Status on $projection.BookingStatusId = _Status.StatusId
{
  key booking_uuid                                                                                as BookingUuid,
      @Search: { defaultSearchElement: true }
      booking_id                                                                                  as BookingId,
      @Search: { defaultSearchElement: true }
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZLAB_SH_BOOK',
                                                      element: 'BookId'} }]
      @Consumption.semanticObject: 'zlab_ui_book'
      @ObjectModel.text.element: ['BookName']
      book_id                                                                                     as BookId,
      _Book.BookName                                                                              as BookName,

      @UI.selectionField: [{ position: 10 }]
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZLAB_SH_READER',
                                                      element: 'PersonId'} }]
      @Consumption.semanticObject: 'zlab_ui_reader'
      @ObjectModel.text.element: ['PersonName']
      person_id                                                                                   as PersonId,
      concat_with_space(_Reader._ReaderTxt.PersonFirstName, _Reader._ReaderTxt.PersonLastName, 1) as PersonName,

      @UI.selectionField: [{ position: 15 }]
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZLAB_SH_STATUS',
                                                      element: 'StatusId'} }]
      @ObjectModel.text.element: ['StatusName']
      booking_status_id                                                                           as BookingStatusId,
      _Status.StatusName,

      @UI.selectionField: [{ position: 20 }]
      @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
      booking_beg_date                                                                            as BookingBegDate,
      @UI.selectionField: [{ position: 25 }]
      @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
      booking_beg_time                                                                            as BookingBegTime,
      @UI.selectionField: [{ position: 30 }]
      @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
      booking_end_date                                                                            as BookingEndDate,
      @UI.selectionField: [{ position: 35 }]
      @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
      booking_end_time                                                                            as BookingEndTime,
      _Reader,
      _Book,
      _Status
}
