USE simulador_cne;

-- Candidatos sin resultados electorales.
SELECT c.nombres, c.apellidos
FROM candidato AS c
WHERE NOT EXISTS (
	SELECT 1
	FROM resultado AS r
	WHERE r.id_candidato = c.id_candidato
);