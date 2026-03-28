namespace BCTrainingApp.BCTrainingApp;

using Microsoft.Sales.Document;

reportextension 90100 "Agz Standard Sales Conf." extends "Standard Sales - Order Conf."
{
    dataset
    {
        add(Header)
        {
            column(SalespersonCode; "Salesperson Code")
            {
            }
            column(ReasonCode; "Reason Code")
            {
            }
        }
    }
    rendering
    {
        layout(ELBStandardSalesInvoiceWord)
        {
            Type = RDLC;
            Caption = 'EB Sales Order Confiamtion';
            LayoutFile = '.\SalesOrderConfForSubscriptionBilling_EB.rdl';
        }
    }
}
