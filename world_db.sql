SELECT count(countrycode) FROM public.countrylanguage;

SELECT avg(lifeexpectancy) FROM public.country;

SELECT avg(population) FROM public.city WHERE countrycode = 'NLD';

SELECT count(id) FROM city
WHERE district IN ('Zuid-Holland', 'Noord-Brabant', 'Utrecht')

SELECT DISTINCT lifeexpectancy FROM country
WHERE lifeexpectancy IS NOT NULL