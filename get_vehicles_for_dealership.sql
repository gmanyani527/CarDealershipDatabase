SELECT  v.*
FROM    vehicles v
JOIN    inventory i USING (VIN)
WHERE   i.dealership_id = dealerId        
ORDER BY v.make, v.model, v.year;
