SELECT  sc.contract_id,
        sc.VIN,
        sc.sale_date,
        sc.price,
        v.make, v.model, v.year,
        d.name AS dealership_name
FROM    sales_contracts sc
JOIN    vehicles       v  USING (VIN)
JOIN    inventory      i  USING (VIN)       
JOIN    dealerships    d  USING (dealership_id)
WHERE   d.dealership_id = dealerId           
  AND   sc.sale_date BETWEEN '2025-06-01' AND '2025-06-30'
ORDER  BY sc.sale_date;