CREATE TYPE PROVIDER_INFO AS
(
    email       TEXT,
    website     TEXT
);

CREATE TABLE provider
(
    owner_address   TEXT            NOT NULL REFERENCES account (address),
    host_uri        TEXT            NOT NULL,
    attributes      JSONB           NOT NULL DEFAULT '[]'::JSONB,
    info            PROVIDER_INFO   NOT NULL,
    height          BIGINT          NOT NULL,
    CONSTRAINT unique_provider UNIQUE (owner_address)
);
CREATE INDEX provider_address_index ON provider (owner_address);
