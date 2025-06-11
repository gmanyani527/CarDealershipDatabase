# CarDealershipDatabase 🚗

A **self‑contained MySQL workshop** that spins up a complete car‑dealership data model, pre‑populated with realistic seed data.  
Run a single script to build (or rebuild) the schema, then fire off ready‑made test queries to explore it.

---

## Why you might love this repo

| ✅  | What’s in it for you? |
|----|-----------------------|
| **Zero‑to‑DB** in one command | Drops the old schema and re‑creates everything from scratch. |
| Seed data included | Two dealerships, three demo cars, and matching sales/lease examples. |
| Stand‑alone test scripts | Six tiny `.sql` files that prove each part works—copy them into any tool. |
| Flexible design | Optional `lease_contracts`, clean FKs, and ready for extra triggers or views. |
| Works anywhere | MySQL 8.x, MariaDB 10.4+, CLI or Workbench/DBeaver. |

---

## Quick Start

```bash
# clone to your workshop folder
cd C:/pluralsight/workshops
git clone https://github.com/<you>/CarDealershipDatabase.git
cd CarDealershipDatabase

# build or rebuild the DB (password prompt appears)
mysql -u root -p < car_dealership_setup.sql

# smoke‑test: list all dealerships
mysql -u root -p car_dealership < tests/01_get_all_dealerships.sql
