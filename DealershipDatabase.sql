CREATE DATABASE test;
use car_dealership;

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




