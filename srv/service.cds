using { cap_simple_req as my } from '../db/schema.cds';

@path: '/service/cap_simple_req'
@requires: 'authenticated-user'
service cap_simple_reqSrv {
  @odata.draft.enabled
  entity PurchaseRequisitions as projection on my.PurchaseRequisitions;
  entity RequisitionItems as projection on my.RequisitionItems;
  @odata.draft.enabled
  entity Materials as projection on my.Materials;
}