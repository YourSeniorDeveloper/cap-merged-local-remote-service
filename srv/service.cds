 
using { cap_simple_req as my } from '../db/schema.cds';

using {
	Northwind.Products as ExternalProducts
} from '../srv/external/Northwind';


@path: '/service/cap_simple_req'
@requires: 'authenticated-user'
service cap_simple_reqSrv {
  @odata.draft.enabled
  entity PurchaseRequisitions as projection on my.PurchaseRequisitions {
    *
  };

  entity RequisitionItems as projection on my.RequisitionItems {
    *,
    to_product: Association to one ExtProducts on to_product.ProductID = product_id
  }
  @readonly
  entity ExtProducts as projection on ExternalProducts;
  
}