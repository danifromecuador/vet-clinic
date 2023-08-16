postgres=# CREATE DATABASE vet_clinic;
postgres=# \c vet_clinic

vet_clinic=# CREATE TABLE animals (
    id serial PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);
