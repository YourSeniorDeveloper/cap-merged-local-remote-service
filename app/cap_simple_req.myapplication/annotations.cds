using cap_simple_reqSrv as service from '../../srv/service';
annotate service.PurchaseRequisitions with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'requisitionId',
                Value : requisitionId,
            },
            {
                $Type : 'UI.DataField',
                Label : 'customerId',
                Value : customerId,
            },
            {
                $Type : 'UI.DataField',
                Label : 'status',
                Value : status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'createdDate',
                Value : createdDate,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Itens',
            ID : 'Itens',
            Target : 'items/@UI.LineItem#Itens',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'requisitionId',
            Value : requisitionId,
        },
        {
            $Type : 'UI.DataField',
            Label : 'customerId',
            Value : customerId,
        },
        {
            $Type : 'UI.DataField',
            Label : 'status',
            Value : status,
        },
        {
            $Type : 'UI.DataField',
            Label : 'createdDate',
            Value : createdDate,
        },
    ],
);

annotate service.RequisitionItems with @(
    UI.LineItem #Itens : [
        {
            $Type : 'UI.DataField',
            Value : itemId,
            Label : 'itemId',
        },
        {
            $Type : 'UI.DataField',
            Value : product_id,
            Label : 'product_id',
        },
        {
            $Type : 'UI.DataField',
            Value : Currency_code,
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : unitPrice,
            Label : 'unitPrice',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Cadastro Item',
            ID : 'CadastroItem',
            Target : '@UI.FieldGroup#CadastroItem',
        },
    ],
    UI.FieldGroup #CadastroItem : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : itemId,
                Label : 'itemId',
            },
            {
                $Type : 'UI.DataField',
                Value : product_id,
                Label : 'product_id',
            },
            {
                $Type : 'UI.DataField',
                Value : quantity,
                Label : 'quantity',
            },
            {
                $Type : 'UI.DataField',
                Value : unitPrice,
                Label : 'unitPrice',
            },
            {
                $Type : 'UI.DataField',
                Value : Currency_code,
            },
        ],
    },
);

annotate service.RequisitionItems with {
    product_id @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ExtProducts',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id,
                    ValueListProperty : 'ProductID',
                },
            ],
            Label : 'xxx',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : {
            $value : to_product.ProductName,
            ![@UI.TextArrangement] : #TextLast
        },
    )
};

annotate service.ExtProducts with {
    ProductID @Common.Text : {
        $value : ProductName,
        ![@UI.TextArrangement] : #TextLast,
    }
};

