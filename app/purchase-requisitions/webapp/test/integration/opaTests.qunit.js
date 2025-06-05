sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'purchaserequisitions/test/integration/FirstJourney',
		'purchaserequisitions/test/integration/pages/PurchaseRequisitionsList',
		'purchaserequisitions/test/integration/pages/PurchaseRequisitionsObjectPage'
    ],
    function(JourneyRunner, opaJourney, PurchaseRequisitionsList, PurchaseRequisitionsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('purchaserequisitions') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePurchaseRequisitionsList: PurchaseRequisitionsList,
					onThePurchaseRequisitionsObjectPage: PurchaseRequisitionsObjectPage
                }
            },
            opaJourney.run
        );
    }
);