namespace cap_simple_req;

using
{
    cuid,
    managed,
    Currency
}
from '@sap/cds/common';

using from '@sap/cds-common-content';

using {
	Northwind.Products as NorthwindProducts
} from '../srv/external/Northwind';

entity ExternalProducts as projection on NorthwindProducts{
  
  key ProductID,
  ProductName,
  SupplierID,
  CategoryID,
  QuantityPerUnit,
  UnitPrice,
  UnitsInStock,
  UnitsOnOrder,
  ReorderLevel,
  Discontinued

}

entity PurchaseRequisitions : cuid, managed
{
    requisitionId : String(50)
        @mandatory;
    customerId : String(50);
    status : String(20);
    createdDate : Date;
    items : Composition of many RequisitionItems on items.requisition = $self;
}

annotate PurchaseRequisitions with @assert.unique :
{
    requisitionId : [ requisitionId ],
};

entity RequisitionItems : cuid
{
    itemId : String(50)
        @mandatory;
    quantity : Integer;
    unitPrice : Decimal(10,2);
    Currency : Currency;
    requisition : Association to one PurchaseRequisitions;
    ProductID : Association to one ExternalProducts;
}

annotate RequisitionItems with @assert.unique :
{
    itemId : [ itemId ],
};
