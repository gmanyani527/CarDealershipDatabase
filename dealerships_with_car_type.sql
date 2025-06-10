USE car_dealership;
SELECT DISTINCT d.*
FROM   dealerships d
JOIN   inventory   i  USING (dealership_id)
JOIN   vehicles    v  USING (VIN)
WHERE  v.make        = 'Ford'
  AND  v.model       = 'Mustang'
  AND  v.color       = 'Red';