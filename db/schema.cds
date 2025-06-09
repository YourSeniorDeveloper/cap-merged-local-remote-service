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
	Northwind.Products as ExternalProducts
} from '../srv/external/Northwind';

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
    material : Association to one Materials;
}

annotate RequisitionItems with @assert.unique :
{
    itemId : [ itemId ],
};

entity Materials : cuid
{
    materialId : String(50)
        @mandatory;
    description : String(100);
    price : Decimal(10,2);
    Currency : Currency;
    items : Association to many RequisitionItems on items.material = $self;
}

annotate Materials with @assert.unique :
{
    materialId : [ materialId ],
};

entity ExtProducts as projection on ExternalProducts {

  key ProductID : Integer,
  ProductName : LargeString,
  SupplierID : Integer,
  CategoryID : Integer,
  QuantityPerUnit : LargeString,
  UnitPrice : Decimal,
  UnitsInStock : Integer,
  UnitsOnOrder : Integer,
  ReorderLevel : Integer,
  Discontinued : Boolean,


}