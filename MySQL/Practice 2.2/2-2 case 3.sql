-- CASE 3----------------------------------------------------------------------
-- A country is big if:
-- •	it has an area of at least three million (i.e., 3000000 km2), or
-- •	it has a population of at least twenty-five million (i.e., 25000000).
--    Write an SQL query to report the name, population, and area of the big countries.

USE queries2_2;

CREATE TABLE World (
    name VARCHAR(255) NOT NULL,
    continent VARCHAR(255) NOT NULL,
    area INT NOT NULL,
    population INT NOT NULL,
    gdp BIGINT NOT NULL
);
INSERT INTO World (name, continent, area, population, gdp) VALUES
('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
('Albania', 'Europe', 28748, 2831741, 12960000000),
('Algeria', 'Africa', 2381741, 37100000, 188681000000),
('Andorra', 'Europe', 468, 78115, 3712000000),
('Angola', 'Africa', 1246700, 20609294, 100990000000),
('India', 'Asia', 3287263, 1380004385, 3000000000000);

select * FROM World 
WHERE area>3000000 OR population>25000000;

