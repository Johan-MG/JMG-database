CREATE OR REPLACE FUNCTION jmg.update_paid_purchase()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.status = 'PAID' THEN
        NEW.date := NOW();
    END IF;
    IF NEW.status = 'PENDING' THEN
        NEW.date := NULL;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_paid_purchase
BEFORE INSERT OR UPDATE ON jmg.purchase
FOR EACH ROW
EXECUTE FUNCTION jmg.update_paid_purchase();