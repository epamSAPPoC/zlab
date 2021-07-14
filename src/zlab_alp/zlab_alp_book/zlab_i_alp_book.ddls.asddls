@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ALP: Book'
define view entity zlab_i_alp_book
  as select from zlab_d_book_a
  association [1..1] to zlab_i_author as _Author on _Author.AuthorId = $projection.AuthorId
{
  key book_id                                                                                     as BookId,
      book_name                                                                                   as BookName,
      author_id                                                                                   as AuthorId,
      concat_with_space(_Author._AuthorTxt.AuthorFirstName, _Author._AuthorTxt.AuthorLastName, 1) as AuthorName,
      pages_num                                                                                   as PagesNum,
      copy_qty                                                                                    as CopyQty,
      'sap-icon://education'                                                                      as ImageUrl,
      _Author
}
