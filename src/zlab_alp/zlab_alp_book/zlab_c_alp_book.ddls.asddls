@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ALP: Book'
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity zlab_c_alp_book
  as select from zlab_i_alp_book
{
      @Search: {
          defaultSearchElement: true,
          ranking: #HIGH,
          fuzzinessThreshold: 0.8
      }
  key BookId,
      @Search: {
          defaultSearchElement: true,
          ranking: #HIGH,
          fuzzinessThreshold: 0.8
      }
      BookName,
      
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZLAB_SH_AUTHOR',   
                                                     element: 'AuthorId'} }]
      @Consumption.semanticObject: 'zlab_ui_author'
      @ObjectModel.text.element: ['AuthorName']
      AuthorId,
      AuthorName,
      
      @Aggregation.default: #AVG
      PagesNum,
      
      @Aggregation.default: #SUM
      CopyQty,

      ImageUrl,
      
      _Author
}
