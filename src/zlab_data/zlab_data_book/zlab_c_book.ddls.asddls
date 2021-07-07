@EndUserText.label: 'Book'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity zlab_c_book provider contract transactional_query
  as projection on zlab_i_book
{
      @Search: { defaultSearchElement: true }
  key BookId,
  
      @Search: { defaultSearchElement: true }  
      BookName,
      
      @Search: { defaultSearchElement: true }      
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZLAB_SH_AUTHOR',   
                                                     element: 'AuthorId'} }]
      @Consumption.semanticObject: 'zlab_ui_author'
      @ObjectModel.text.element: ['AuthorName']
      AuthorId,
      AuthorName,
      
      @Search: { defaultSearchElement: true }         
      PagesNum, 

      @Search: { defaultSearchElement: true }         
      CopyQty,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      ImageUrl,
      /* Associations */
      _Author
}
