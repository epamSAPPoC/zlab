@EndUserText.label: 'Author'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity zlab_c_author
  provider contract transactional_query
  as projection on zlab_i_author
  association [0..*] to zlab_c_book as _Book on _Book.AuthorId = $projection.AuthorId
{
      @Search: { defaultSearchElement: true }
  key AuthorId,
      @Search: { defaultSearchElement: true }
      _AuthorTxt.AuthorFirstName as FirstName,
      @Search: { defaultSearchElement: true }
      _AuthorTxt.AuthorLastName  as LastName,
      @Consumption.filter: { selectionType: #INTERVAL , multipleSelections:  false }
      BirthDate,
      @Search: { defaultSearchElement: true }
      Country,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      ImageUrl,
      _AuthorTxt,
      _Book
}
