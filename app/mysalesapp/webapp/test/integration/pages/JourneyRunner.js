sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"mdp/mysalesapp/test/integration/pages/SalesOrdersList",
	"mdp/mysalesapp/test/integration/pages/SalesOrdersObjectPage",
	"mdp/mysalesapp/test/integration/pages/SalesOrderItemsObjectPage"
], function (JourneyRunner, SalesOrdersList, SalesOrdersObjectPage, SalesOrderItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('mdp/mysalesapp') + '/test/flpSandbox.html#mdpmysalesapp-tile',
        pages: {
			onTheSalesOrdersList: SalesOrdersList,
			onTheSalesOrdersObjectPage: SalesOrdersObjectPage,
			onTheSalesOrderItemsObjectPage: SalesOrderItemsObjectPage
        },
        async: true
    });

    return runner;
});

