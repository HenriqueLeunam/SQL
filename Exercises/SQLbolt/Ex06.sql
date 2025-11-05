-- 1. Find the domestic and international sales for each movie.
SELECT Id, Title, Domestic_sales, International_sales
FROM Movies m
INNER JOIN Boxoffice b
    ON m.id = b.Movie_id

-- 2. Show the sales numbers for each movie that did better internationaly
-- rather then domestically.
SELECT Id, Title, International_sales, Domestic_sales
FROM Movies m
INNER JOIN Boxoffice b
    ON m.Id = b.Movie_id
WHERE International_sales > Domestic_sales

-- 3. List all the movies by their ratings in descending order.
SELECT Id, Title, Rating
FROM Movies m
INNER JOIN Boxoffice b
    ON m.Id = b.Movie_id
ORDER BY Rating DESC