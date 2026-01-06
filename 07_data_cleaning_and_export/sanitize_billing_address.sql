-- Objetivo:
-- Ajustar a coluna de endereço de cobrança removendo
-- caracteres especiais para exportação em CSV

SELECT
    InvoiceId,
    CustomerId,
    InvoiceDate,
    REGEXP_REPLACE(BillingAddress, '[^a-zA-Z0-9 ]', '') AS billing_address_clean,
    BillingCity,
    BillingCountry,
    Total
FROM Invoice;
