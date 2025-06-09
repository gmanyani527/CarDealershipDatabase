CREATE DATABASE test;
use car_dealership;

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(50)  NOT NULL,
    address       VARCHAR(50),
    phone         VARCHAR(12)  -- store as 999‑999‑9999
);


