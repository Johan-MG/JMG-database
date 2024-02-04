CREATE OR REPLACE FUNCTION jmg.create_purchase(purchase TEXT)
RETURNS BOOLEAN 
AS $$
DECLARE
    _purchase   jmg.purchase;
BEGIN

    _purchase.description := purchase::JSONB ->> 'description';
    _purchase.cost := purchase::JSONB ->> 'cost';
    _purchase.payment_method := purchase::JSONB ->> 'payment_method';
    _purchase.store_id := purchase::JSONB ->> 'store';
    _purchase.user_pay_id := purchase::JSONB ->> 'user_pay';
    _purchase.user_purchase_id := purchase::JSONB ->> 'user_purchase';
    _purchase.status := purchase::JSONB ->> 'status';

    INSERT INTO jmg.purchase(description, cost, payment_method, store_id, user_pay_id, user_purchase_id, status)
    VALUES(_purchase.description, _purchase.cost, _purchase.payment_method,_purchase.store_id, _purchase.user_pay_id, _purchase.user_purchase_id, _purchase.status);

    
    RETURN TRUE;
    
END;
$$
LANGUAGE plpgsql;
