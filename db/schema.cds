namespace cap_simple_req;

using
{
    cuid,
    managed,
    Currency
}
from '@sap/cds/common';

using from '@sap/cds-common-content';

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
    product_id : Integer;
}

annotate RequisitionItems with @assert.unique :
{
    itemId : [ itemId ],
};

