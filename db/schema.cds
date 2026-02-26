namespace my.sales;

entity SalesOrders {
    key ID          : UUID;
    orderNumber     : String(20);
    customer        : String(100);
    orderDate       : Date;
    status          : String(20);
    totalAmount     : Decimal(15,2);
    currency        : String(3);
    items           : Composition of many SalesOrderItems on items.order = $self;
}

entity SalesOrderItems {
    key ID          : UUID;
    order           : Association to SalesOrders;
    productName     : String(100);
    quantity        : Integer;
    unitPrice       : Decimal(15,2);
    totalPrice      : Decimal(15,2);
}
