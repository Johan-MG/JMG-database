CREATE OR REPLACE FUNCTION jmg.get_user(username TEXT)
RETURNS TABLE (id INTEGER, user_name CITEXT)
AS $$
DECLARE

BEGIN
    
    RETURN QUERY
    SELECT 
        u.id,
        u.user_name
    FROM jmg.user u
    WHERE u.user_name = username;
    
END;
$$
LANGUAGE plpgsql;
