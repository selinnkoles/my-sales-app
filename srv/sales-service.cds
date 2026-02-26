using my.sales as db from '../db/schema';

service SalesService {
    entity SalesOrders as projection on db.SalesOrders;
    entity SalesOrderItems as projection on db.SalesOrderItems;
}

annotate SalesService.SalesOrders with @(
    UI.LineItem: [
        { Value: orderNumber, Label: 'Order Number' },
        { Value: customer, Label: 'Customer' },
        { Value: orderDate, Label: 'Order Date' },
        { Value: status, Label: 'Status' },
        { Value: totalAmount, Label: 'Total Amount' },
        { Value: currency, Label: 'Currency' }
    ],
    UI.SelectionFields: [ customer, status, orderDate ],
    UI.HeaderInfo: {
        TypeName: 'Sales Order',
        TypeNamePlural: 'Sales Orders',
        Title: { Value: orderNumber },
        Description: { Value: customer }
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'General Info',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Items',
            Target: 'items/@UI.LineItem'
        }
    ],
    UI.FieldGroup#General: {
        Data: [
            { Value: orderNumber },
            { Value: customer },
            { Value: orderDate },
            { Value: status },
            { Value: totalAmount },
            { Value: currency }
        ]
    }
);

annotate SalesService.SalesOrderItems with @(
    UI.LineItem: [
        { Value: productName, Label: 'Product' },
        { Value: quantity, Label: 'Quantity' },
        { Value: unitPrice, Label: 'Unit Price' },
        { Value: totalPrice, Label: 'Total Price' }
    ]
);
