using { cap_simple_reqSrv } from '../srv/service.cds';

annotate cap_simple_reqSrv.PurchaseRequisitions with @UI.HeaderInfo: { TypeName: 'Purchase Requisition', TypeNamePlural: 'Purchase Requisitions', Title: { Value: requisitionId } };
annotate cap_simple_reqSrv.PurchaseRequisitions with {
  ID @UI.Hidden @Common.Text: { $value: requisitionId, ![@UI.TextArrangement]: #TextOnly }
};
annotate cap_simple_reqSrv.PurchaseRequisitions with @UI.Identification: [{ Value: requisitionId }];
annotate cap_simple_reqSrv.PurchaseRequisitions with @UI.DataPoint #customerId: {
  Value: customerId,
  Title: 'Customer ID',
};
annotate cap_simple_reqSrv.PurchaseRequisitions with @UI.DataPoint #status: {
  Value: status,
  Title: 'Status',
};
annotate cap_simple_reqSrv.PurchaseRequisitions with {
  requisitionId @title: 'Requisition ID';
  customerId @title: 'Customer ID';
  status @title: 'Status';
  createdDate @title: 'Created Date';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate cap_simple_reqSrv.PurchaseRequisitions with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: requisitionId },
 { $Type: 'UI.DataField', Value: customerId },
 { $Type: 'UI.DataField', Value: status },
 { $Type: 'UI.DataField', Value: createdDate }
];

annotate cap_simple_reqSrv.PurchaseRequisitions with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: requisitionId },
 { $Type: 'UI.DataField', Value: customerId },
 { $Type: 'UI.DataField', Value: status },
 { $Type: 'UI.DataField', Value: createdDate },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy }
  ]
};

annotate cap_simple_reqSrv.PurchaseRequisitions with {
  items @Common.Label: 'Requisition Items'
};

annotate cap_simple_reqSrv.PurchaseRequisitions with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#customerId' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status' }
];

annotate cap_simple_reqSrv.PurchaseRequisitions with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'RequisitionItems', Target : 'items/@UI.LineItem' }
];

annotate cap_simple_reqSrv.PurchaseRequisitions with @UI.SelectionFields: [
  requisitionId
];

annotate cap_simple_reqSrv.RequisitionItems with @UI.HeaderInfo: { TypeName: 'Requisition Item', TypeNamePlural: 'Requisition Items', Title: { Value: itemId } };
annotate cap_simple_reqSrv.RequisitionItems with {
  ID @UI.Hidden @Common.Text: { $value: itemId, ![@UI.TextArrangement]: #TextOnly }
};
annotate cap_simple_reqSrv.RequisitionItems with @UI.Identification: [{ Value: itemId }];
annotate cap_simple_reqSrv.RequisitionItems with {
  requisition @Common.ValueList: {
    CollectionPath: 'PurchaseRequisitions',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: requisition_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'requisitionId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedBy'
      },
    ],
  }
};
annotate cap_simple_reqSrv.RequisitionItems with {
  material @Common.ValueList: {
    CollectionPath: 'Materials',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: material_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'materialId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
    ],
  }
};
annotate cap_simple_reqSrv.RequisitionItems with @UI.DataPoint #quantity: {
  Value: quantity,
  Title: 'Quantity',
};
annotate cap_simple_reqSrv.RequisitionItems with {
  itemId @title: 'Item ID';
  quantity @title: 'Quantity';
  unitPrice @title: 'Unit Price'
};

annotate cap_simple_reqSrv.RequisitionItems with {
  unitPrice @Measures.ISOCurrency: Currency_code
};

annotate cap_simple_reqSrv.RequisitionItems with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: itemId },
 { $Type: 'UI.DataField', Value: quantity },
 { $Type: 'UI.DataField', Value: unitPrice },
    { $Type: 'UI.DataField', Label: 'Material', Value: material_ID }
];

annotate cap_simple_reqSrv.RequisitionItems with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: itemId },
 { $Type: 'UI.DataField', Value: quantity },
 { $Type: 'UI.DataField', Value: unitPrice },
    { $Type: 'UI.DataField', Label: 'Material', Value: material_ID }
  ]
};

annotate cap_simple_reqSrv.RequisitionItems with {
  requisition @Common.Text: { $value: requisition.requisitionId, ![@UI.TextArrangement]: #TextOnly };
  material @Common.Text: { $value: material.materialId, ![@UI.TextArrangement]: #TextOnly }
};

annotate cap_simple_reqSrv.RequisitionItems with {
  requisition @Common.Label: 'Purchase Requisition';
  material @Common.Label: 'Material'
};

annotate cap_simple_reqSrv.RequisitionItems with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#quantity' }
];

annotate cap_simple_reqSrv.RequisitionItems with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate cap_simple_reqSrv.RequisitionItems with @UI.SelectionFields: [
  requisition_ID,
  material_ID
];

annotate cap_simple_reqSrv.Materials with @UI.HeaderInfo: { TypeName: 'Material', TypeNamePlural: 'Materials', Title: { Value: materialId } };
annotate cap_simple_reqSrv.Materials with {
  ID @UI.Hidden @Common.Text: { $value: materialId, ![@UI.TextArrangement]: #TextOnly }
};
annotate cap_simple_reqSrv.Materials with @UI.Identification: [{ Value: materialId }];
annotate cap_simple_reqSrv.Materials with {
  materialId @title: 'Material ID';
  description @title: 'Description';
  price @title: 'Price'
};

annotate cap_simple_reqSrv.Materials with {
  price @Measures.ISOCurrency: Currency_code
};

annotate cap_simple_reqSrv.Materials with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: materialId },
 { $Type: 'UI.DataField', Value: description },
 { $Type: 'UI.DataField', Value: price }
];

annotate cap_simple_reqSrv.Materials with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: materialId },
 { $Type: 'UI.DataField', Value: description },
 { $Type: 'UI.DataField', Value: price }
  ]
};

annotate cap_simple_reqSrv.Materials with {
  items @Common.Label: 'Requisition Items'
};

annotate cap_simple_reqSrv.Materials with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate cap_simple_reqSrv.Materials with @UI.SelectionFields: [
  materialId
];

