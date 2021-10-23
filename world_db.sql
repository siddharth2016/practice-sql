SELECT count(countrycode) FROM public.countrylanguage;

SELECT avg(lifeexpectancy) FROM public.country;

SELECT avg(population) FROM public.city WHERE countrycode = 'NLD';

SELECT count(id) FROM city
WHERE district IN ('Zuid-Holland', 'Noord-Brabant', 'Utrecht')

SELECT DISTINCT lifeexpectancy FROM country
WHERE lifeexpectancy IS NOT NULL

SELECT DISTINCT continent,
sum(population) OVER (
    PARTITION BY continent
)
FROM country

SELECT
  DISTINCT continent,
  SUM(population) OVER w1 AS"continent population"
FROM country 
WINDOW w1 AS( PARTITION BY continent );

SELECT DISTINCT continent,
round((sum(population::float4) OVER (PARTITION BY continent) / sum(population::float4) OVER()) * 100)
FROM country
