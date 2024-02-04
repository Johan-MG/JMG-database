CREATE OR REPLACE FUNCTION jmg.get_users()
RETURNS TABLE (id INTEGER, user_name CITEXT)
AS $$
DECLARE

BEGIN
    
    RETURN QUERY
    SELECT 
        u.id,
        u.user_name
    FROM jmg.user u;
    
END;
$$
LANGUAGE plpgsql;
