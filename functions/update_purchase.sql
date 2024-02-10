CREATE OR REPLACE FUNCTION jmg.update_purchase(_purchase JSONB)
RETURNS VOID 
AS $$
DECLARE

BEGIN
    UPDATE jmg.purchase
    SET
        status = (_purchase->> 'status')::jmg.status
    WHERE id = (_purchase ->> 'id')::INTEGER;
    
END;
$$
LANGUAGE plpgsql;
