sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'capsimplereq/myapplication/test/integration/FirstJourney',
		'capsimplereq/myapplication/test/integration/pages/PurchaseRequisitionsList',
		'capsimplereq/myapplication/test/integration/pages/PurchaseRequisitionsObjectPage',
		'capsimplereq/myapplication/test/integration/pages/RequisitionItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, PurchaseRequisitionsList, PurchaseRequisitionsObjectPage, RequisitionItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('capsimplereq/myapplication') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePurchaseRequisitionsList: PurchaseRequisitionsList,
					onThePurchaseRequisitionsObjectPage: PurchaseRequisitionsObjectPage,
					onTheRequisitionItemsObjectPage: RequisitionItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);