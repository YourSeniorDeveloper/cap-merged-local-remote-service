using { Northwind } from './external/Northwind.cds'; 
using { cap_simple_req as my } from '../db/schema.cds';

@path : '/service/cap_simple_req'
service cap_simple_reqSrv
{
    @odata.draft.enabled
    entity PurchaseRequisitions as
        projection on my.PurchaseRequisitions;

    entity RequisitionItems as
        projection on my.RequisitionItems;
}

annotate cap_simple_reqSrv with @requires :
[
    'authenticated-user'
];
