SELECT count(countrycode) FROM public.countrylanguage;

SELECT avg(lifeexpectancy) FROM public.country;

SELECT avg(population) FROM public.city WHERE countrycode = 'NLD';