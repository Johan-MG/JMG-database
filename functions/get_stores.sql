CREATE OR REPLACE FUNCTION jmg.get_stores()
RETURNS TABLE (id INTEGER, name CITEXT)
AS $$
DECLARE

BEGIN
    
    RETURN QUERY
    SELECT 
        s.id,
        s.name
    FROM jmg.store s;
    
END;
$$
LANGUAGE plpgsql;
