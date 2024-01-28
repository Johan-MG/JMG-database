CREATE OR REPLACE FUNCTION jmg.get_purchases()
RETURNS TABLE (id INTEGER, description TEXT, cost NUMERIC(10,2), payment_method jmg.payment_method, store CITEXT, user_pay TEXT, user_purchase TEXT, status JMG.STATUS)
AS $$
DECLARE

BEGIN
    
    RETURN QUERY
    SELECT 
        p.id,
        p.description,
        p.cost,
        p.payment_method,
        s.name,
        u.name,
        up.name,
        p.status
    FROM jmg.purchase p
    LEFT JOIN jmg.store s ON s.id = p.store_id
    LEFT JOIN jmg.user u ON u.id = p.user_pay_id
    LEFT JOIN jmg.user up ON up.id = p.user_purchase_id;
    
END;
$$
LANGUAGE plpgsql;
