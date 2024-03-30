CREATE OR REPLACE FUNCTION jmg.create_purchase(purchase TEXT)
RETURNS BOOLEAN 
AS $$
DECLARE
    _purchase   jmg.purchase;
    _months     INTEGER;
BEGIN

    _purchase.description := purchase::JSONB ->> 'description';
    _purchase.cost := purchase::JSONB ->> 'cost';
    _purchase.payment_method := purchase::JSONB ->> 'payment_method';
    _purchase.store_id := purchase::JSONB ->> 'store';
    _purchase.user_pay_id := purchase::JSONB ->> 'user_pay';
    _purchase.user_purchase_id := purchase::JSONB ->> 'user_purchase';
    _purchase.status := purchase::JSONB ->> 'status';
    _months := purchase::JSONB ->> 'months';

    IF _months = 1 THEN
        INSERT INTO jmg.purchase(description, cost, payment_method, store_id, user_pay_id, user_purchase_id, status)
        VALUES(_purchase.description, _purchase.cost, _purchase.payment_method,_purchase.store_id, _purchase.user_pay_id, _purchase.user_purchase_id, _purchase.status);
    ELSE
        FOR months IN 1.._months LOOP
            INSERT INTO jmg.purchase(description, cost, payment_method, store_id, user_pay_id, user_purchase_id, status, created)
            VALUES(CONCAT(_purchase.description, ' ', months), (_purchase.cost/_months), _purchase.payment_method,_purchase.store_id, _purchase.user_pay_id, _purchase.user_purchase_id, _purchase.status, NOW() + (months - 1) * INTERVAL '1 month');
        END LOOP;
    END IF;

    
    RETURN TRUE;
    
END;
$$
LANGUAGE plpgsql;
