@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Search Help: Author'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zlab_sh_author
  as select from zlab_i_author
{
  key AuthorId,
      _AuthorTxt.AuthorFirstName as FirstName,
      _AuthorTxt.AuthorLastName  as LastName,
      Country
}
