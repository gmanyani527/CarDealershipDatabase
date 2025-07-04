DROP DATABASE IF EXISTS car_dealership;

CREATE DATABASE car_dealership;
use car_dealership;

DROP TABLE IF EXISTS sales_contracts;
DROP TABLE IF EXISTS lease_contracts;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS dealerships;


CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(50)  NOT NULL,
    address       VARCHAR(50),
    phone         VARCHAR(12)  -- store as 999‑999‑9999
);
CREATE TABLE vehicles (
    VIN          VARCHAR(17)  PRIMARY KEY,      -- worldwide VINs are 17 chars max
    make         VARCHAR(50)  NOT NULL,
    model        VARCHAR(50)  NOT NULL,
    year         INT          NOT NULL CHECK (year BETWEEN 1886 AND YEAR(CURDATE()) + 1),
    SOLD         BOOLEAN      DEFAULT 0,
    color        VARCHAR(50),
    vehicleType  VARCHAR(50),
    odometer     INT          UNSIGNED,
    price        DOUBLE
);
CREATE TABLE inventory (
    dealership_id INT        NOT NULL,
    VIN           VARCHAR(17) NOT NULL,
    PRIMARY KEY (dealership_id, VIN),
    CONSTRAINT fk_inventory_dealer  FOREIGN KEY (dealership_id)
              REFERENCES dealerships (dealership_id)
              ON UPDATE CASCADE
              ON DELETE CASCADE,
    CONSTRAINT fk_inventory_vehicle FOREIGN KEY (VIN)
              REFERENCES vehicles (VIN)
              ON UPDATE CASCADE
              ON DELETE CASCADE
);
CREATE TABLE lease_contracts (
    contract_id      INT AUTO_INCREMENT PRIMARY KEY,
    VIN              VARCHAR(17) NOT NULL,
    lease_start      DATE        NOT NULL,
    lease_end        DATE        NOT NULL,
    monthly_payment  DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_lease_vehicle FOREIGN KEY (VIN)
              REFERENCES vehicles (VIN)
              ON UPDATE CASCADE
              ON DELETE RESTRICT,
    CONSTRAINT chk_lease_dates CHECK (lease_end > lease_start)
);

CREATE TABLE sales_contracts (
    contract_id  INT AUTO_INCREMENT PRIMARY KEY,
    VIN          VARCHAR(17) NOT NULL,
    sale_date    DATE        NOT NULL,
    price        DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_sales_vehicle FOREIGN KEY (VIN)
              REFERENCES vehicles (VIN)
              ON UPDATE CASCADE
              ON DELETE RESTRICT
);
INSERT INTO dealerships (name, address, phone) VALUES
  ('Garden State Motors', '123 Main St, Newark NJ',  '973‑555‑0101'),
  ('Hudson Auto Mall',    '456 River Rd, Jersey City NJ', '201‑555‑0123');

INSERT INTO vehicles (VIN, make, model, year, color, vehicleType, odometer, price) VALUES
  ('1HGCM82633A004352', 'Honda',  'Accord', 2022, 'White', 'Sedan',  12250, 24995),
  ('1FTRX18L1XKB88888', 'Ford',   'F‑150', 2021, 'Blue',  'Truck',   8021,  38950),
  ('JH4KA8260MC006789', 'Acura',  'TLX',   2023, 'Red',   'Sedan',   502,   37999);
INSERT INTO inventory (dealership_id, VIN) VALUES
  (1, '1HGCM82633A004352'),
  (1, 'JH4KA8260MC006789'),
  (2, '1FTRX18L1XKB88888');

INSERT INTO sales_contracts (VIN, sale_date, price)
VALUES ('1HGCM82633A004352', '2025-06-09', 23995.00);

INSERT INTO sales_contracts (VIN, sale_date, price)
VALUES ('1FTRX18L1XKB88888', '2025-06-12', 37950.00);

INSERT INTO lease_contracts (VIN, lease_start, lease_end, monthly_payment)
VALUES ('JH4KA8260MC006789', '2025-06-01', '2028-05-31', 499.99);