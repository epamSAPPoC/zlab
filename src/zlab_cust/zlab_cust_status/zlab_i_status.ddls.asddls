@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status'
define root view entity zlab_i_status
  as select from zlab_c_status_a
{
  key status_id   as StatusId,
      status_name as StatusName
}
