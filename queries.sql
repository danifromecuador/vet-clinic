-- Find all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = TRUE;

-- Find all animals not named Gabumon.
SELECT * FROM animals WHERE name <> 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

--Inside a transaction delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/*
- Inside a transaction:
  - Delete all animals born after Jan 1st, 2022.
  - Create a savepoint for the transaction.
  - Update all animals' weight to be their weight multiplied by -1.
  - Rollback to the savepoint
  - Update all animals' weights that are negative to be their weight multiplied by -1.
  - Commit transaction
*/
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT savepoint_1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO savepoint_1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

/*
- Write queries to answer the following questions:
  - How many animals are there?
  - How many animals have never tried to escape?
  - What is the average weight of animals?
  - Who escapes the most, neutered or not neutered animals?
  - What is the minimum and maximum weight of each type of animal?
  - What is the average number of escape attempts per animal type of those born between 1990 and 2000?
*/

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) AS total_escapes FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000
GROUP BY species;

/*
- Write queries (using `JOIN`) to answer the following questions:
  - What animals belong to Melody Pond?
  - List of all animals that are pokemon (their type is Pokemon).
  - List all owners and their animals, remember to include those that don't own any animal.
  - How many animals are there per species?
  - List all Digimon owned by Jennifer Orwell.
  - List all animals owned by Dean Winchester that haven't tried to escape.
  - Who owns the most animals?
  */

SELECT name, full_name
FROM animals
INNER JOIN owners
ON animals.owner_id = owners.id
WHERE full_name ILIKE 'melody pond';

SELECT animals.name, species.name
FROM animals
INNER JOIN species
ON animals.species_id = species.id
WHERE species.name ILIKE 'pokemon';

SELECT owners.full_name AS owner_name, animals.name AS animal_name
FROM owners
LEFT JOIN animals
ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.species_id)
FROM species
FULL JOIN animals
ON species.id = animals.species_id
GROUP BY species.name;

SELECT owners.full_name, animals.name
FROM owners
FULL JOIN animals
ON owners.id = animals.owner_id
WHERE full_name ILIKE 'jennifer orwell' AND name ILIKE '%mon';

SELECT animals.name, animals.escape_attempts, owners.full_name
FROM animals
FULL JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name ilike 'dean winchester' AND animals.escape_attempts > 0;

SELECT owners.full_name, COUNT(*)
FROM owners
FULL JOIN animals
ON owners.id = animals.owner_id
GROUP BY full_name
ORDER BY count DESC
LIMIT 1;
