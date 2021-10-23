SELECT count(id) FROM public.towns

SELECT DISTINCT r.id,
r.name,
count(t.id) OVER (
    PARTITION BY r.id
)
FROM regions AS r
INNER JOIN departments AS d ON r.code = d.region
INNER JOIN towns AS t ON d.code = t.department
ORDER BY r.name