@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Author'
define root view entity zlab_i_author
  as select from zlab_d_author_a
  association [0..1] to zlab_i_author_t as _AuthorTxt on  _AuthorTxt.Language = $session.system_language
                                                      and _AuthorTxt.AuthorId = $projection.AuthorId
{
  key author_id       as AuthorId,
      birth_date      as BirthDate,
      country         as Country,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @EndUserText.label : 'Created At'
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @EndUserText.label : 'Last Changed At'
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      'sap-icon://customer' as ImageUrl,
       _AuthorTxt
//       _Book
}
