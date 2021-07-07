@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Reader'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zlab_sh_reader
  as select from zlab_i_reader
{
  key PersonId,
      _ReaderTxt.PersonFirstName as FirstName,
      _ReaderTxt.PersonLastName  as LastName,
      BirthDate,
      PhoneNumber
}
