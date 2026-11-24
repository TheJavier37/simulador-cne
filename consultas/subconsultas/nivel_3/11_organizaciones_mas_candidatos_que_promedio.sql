USE simulador_cne;

-- Organizaciones con más candidatos que el promedio por organización.
SELECT o.nombre, o.siglas, o.numero_lista
FROM organizacion AS o
WHERE (
	SELECT COUNT(*)
	FROM candidato AS c
	WHERE c.id_organizacion = o.id_organizacion
) > (
	SELECT AVG(conteos.cantidad)
	FROM (
		SELECT COUNT(c2.id_candidato) AS cantidad
		FROM organizacion AS o2
		LEFT JOIN candidato AS c2 ON c2.id_organizacion = o2.id_organizacion
		GROUP BY o2.id_organizacion
	) AS conteos
);