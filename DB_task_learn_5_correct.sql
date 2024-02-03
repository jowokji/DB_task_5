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
CREATE VIEW rental_customer AS
SELECT *
FROM rental
WHERE customer_id = 33;

CREATE VIEW payment_customer AS
SELECT *
FROM payment
WHERE customer_id = 33;

CREATE ROLE client_anna_hill LOGIN PASSWORD 'password_for_anna_hill'

GRANT SELECT ON rental_customer TO client_anna_hill;
GRANT SELECT ON payment_customer TO client_anna_hill;

SET ROLE client_anna_hill;

SELECT * FROM rental_customer;

SELECT * FROM payment_customer;

--reset role;