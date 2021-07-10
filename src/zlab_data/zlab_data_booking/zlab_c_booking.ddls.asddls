@EndUserText.label: 'Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity zlab_c_booking
  provider contract transactional_query
  as projection on zlab_i_booking
{
  key  BookingUuid,
       @Search: { defaultSearchElement: true }
       BookingId,
       @Consumption.valueHelpDefinition: [{ entity: { name: 'ZLAB_SH_BOOK',
                                                      element: 'BookId'} }]
       @Consumption.semanticObject: 'zlab_ui_book'
       @ObjectModel.text.element: ['BookName']
       BookId,
       _Book.BookName     as BookName,
       @Consumption.valueHelpDefinition: [{ entity: { name: 'ZLAB_SH_READER',
                                                      element: 'PersonId'} }]
       @Consumption.semanticObject: 'zlab_ui_reader'
       @ObjectModel.text.element: ['PersonName']
       PersonId,
       PersonName,
       @Consumption.valueHelpDefinition: [{ entity: { name: 'ZLAB_SH_STATUS',
                                                      element: 'StatusId'} }]
       @ObjectModel.text.element: ['StatusName']
       BookingStatusId,
       _Status.StatusName as StatusName,
       @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
       BookingBegDate,
       @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
       BookingBegTime,
       @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
       BookingEndDate,
       @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
       BookingEndTime,
       CreatedBy,
       CreatedAt,
       LastChangedBy,
       LastChangedAt,
       ImageUrl,
       /* Associations */
       _Book,
       _Reader
}
