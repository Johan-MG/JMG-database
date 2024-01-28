CREATE TABLE jmg.purchase(
    id                  SERIAL,
    description         TEXT NOT NULL,
    cost                NUMERIC(10,2),
    payment_method      jmg.payment_method NOT NULL,
    store_id            INTEGER,
    user_pay_id         INTEGER NOT NULL,
    user_purchase_id    INTEGER NOT NULL,
    status              jmg.status NOT NULL,
    created             TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    paid                TIMESTAMP WITH TIME ZONE,
    PRIMARY KEY (id),
    CONSTRAINT purchase_x_user_pay_fk FOREIGN KEY (user_pay_id)
        REFERENCES jmg.user (id) MATCH FULL
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT purchase_x_user_purchase_fk FOREIGN KEY (user_purchase_id)
        REFERENCES jmg.user (id) MATCH FULL
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT purchase_x_store_fk FOREIGN KEY (store_id)
        REFERENCES jmg.store (id) MATCH FULL
        ON UPDATE CASCADE
        ON DELETE CASCADE
);