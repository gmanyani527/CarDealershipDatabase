SELECT  d.*
FROM    dealerships d
JOIN    inventory   i  USING (dealership_id)
WHERE   i.VIN = '1HGCM82633A004352';       
