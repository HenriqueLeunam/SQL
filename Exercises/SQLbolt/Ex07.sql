-- 1. Find the list of all buildings that have employees.
SELECT Building_name, Name
FROM Buildings b
INNER JOIN Employees e
    ON b.Building_name = e.Building
GROUP BY Building_name

-- 2. Find the list of all buildings and their capacity.
SELECT *
FROM buildings;

-- 3. List all buildings and the distinct employee roles
-- in each building (including empty buildings)

