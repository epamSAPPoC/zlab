@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Reader (text)'
@ObjectModel.dataCategory: #TEXT
define view entity zlab_i_reader_t
  as select from zlab_d_reader_t
{
      @Semantics.language: true
  key spras             as Language,
  key person_id         as PersonId,
      @Semantics.text: true
      person_first_name as PersonFirstName,
      @Semantics.text: true
      person_last_name  as PersonLastName
}
