@EndUserText.label: 'Reader'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity zlab_c_reader
  provider contract transactional_query
  as projection on zlab_i_reader
{
      @Search: { defaultSearchElement: true }
  key PersonId,
      @Search: { defaultSearchElement: true }
      _ReaderTxt.PersonFirstName as FirstName,
      @Search: { defaultSearchElement: true }
      _ReaderTxt.PersonLastName  as LastName,
      @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
      BirthDate,
      PhoneNumber,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      ImageUrl,
      _ReaderTxt
}
