namespace cap_simple_req;
using { cuid, managed, Currency } from '@sap/cds/common';

@assert.unique: { requisitionId: [requisitionId] }
entity PurchaseRequisitions : cuid, managed {
  requisitionId: String(50) @mandatory;
  customerId: String(50);
  status: String(20);
  createdDate: Date;
  items: Composition of many RequisitionItems on items.requisition = $self;
}

@assert.unique: { itemId: [itemId] }
entity RequisitionItems : cuid {
  itemId: String(50) @mandatory;
  quantity: Integer;
  unitPrice: Decimal(10,2);
  Currency: Currency;
  requisition: Association to PurchaseRequisitions;
  material: Association to Materials;
}

@assert.unique: { materialId: [materialId] }
entity Materials : cuid {
  materialId: String(50) @mandatory;
  description: String(100);
  price: Decimal(10,2);
  Currency: Currency;
  items: Association to many RequisitionItems on items.material = $self;
}

