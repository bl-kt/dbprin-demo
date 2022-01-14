CREATE TABLE general_practitioner
(
    gp_id      SERIAL PRIMARY KEY,
    gp_name     VARCHAR(60) NOT NULL UNIQUE,
    gp_add1 VARCHAR(40) NOT NULL,
    gp_add2  VARCHAR(40),
    gp_county   VARCHAR(30),
    gp_postcode VARCHAR(8)
);