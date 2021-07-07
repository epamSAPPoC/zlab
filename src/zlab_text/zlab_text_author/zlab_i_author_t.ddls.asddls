@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Author (text)'
@ObjectModel.dataCategory: #TEXT
define view entity zlab_i_author_t
  as select from zlab_d_author_t
{
      @Semantics.language: true
  key spras             as Language,
  key author_id         as AuthorId,
      @Semantics.text: true
      author_first_name as AuthorFirstName,
      @Semantics.text: true
      author_last_name  as AuthorLastName
}
