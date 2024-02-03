--1
CREATE USER rentaluser WITH PASSWORD 'rentalpassword';
GRANT CONNECT ON DATABASE dvdrental TO rentaluser;
--2
GRANT SELECT ON customer TO rentaluser;
--3
CREATE ROLE rental;
GRANT rental TO rentaluser;
--4
GRANT INSERT, UPDATE ON rental TO rental;
--5
REVOKE INSERT ON rental FROM rental;
--6
CREATE VIEW rental_customer_1 AS
SELECT *
FROM rental
WHERE customer_id = 1;

CREATE VIEW payment_customer_1 AS
SELECT *
FROM payment
WHERE customer_id = 1;

CREATE ROLE client_name_surname LOGIN PASSWORD 'password_for_name_surname'

GRANT SELECT ON rc TO client_name_surname;
GRANT SELECT ON pc TO client_name_surname;
