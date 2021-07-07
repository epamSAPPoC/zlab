@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Reader'
define root view entity zlab_i_reader
  as select from zlab_d_reader_a
  association [0..1] to zlab_i_reader_t as _ReaderTxt on  _ReaderTxt.Language = $session.system_language
                                                      and _ReaderTxt.PersonId = $projection.PersonId
{
  key person_id       as PersonId,
      birth_date      as BirthDate,
      phone_number    as PhoneNumber,
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
      _ReaderTxt
}
