@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Book'
define root view entity zlab_i_book
  as select from zlab_d_book_a
  association [1..1] to zlab_i_author as _Author on _Author.AuthorId = $projection.AuthorId 
{
  key book_id         as BookId,
      book_name       as BookName,
      author_id       as AuthorId,
      concat_with_space(_Author._AuthorTxt.AuthorFirstName, _Author._AuthorTxt.AuthorLastName, 1) as AuthorName,
      pages_num       as PagesNum,
      copy_qty        as CopyQty,
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
      'sap-icon://education' as ImageUrl,
      _Author
}
