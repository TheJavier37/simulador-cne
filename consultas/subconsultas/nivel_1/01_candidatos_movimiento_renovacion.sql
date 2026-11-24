USE simulador_cne;

-- Candidatos pertenecientes al Movimiento Renovación Ciudadana.
SELECT nombres, apellidos
FROM candidato
WHERE id_organizacion = (
	SELECT id_organizacion
	FROM organizacion
	WHERE nombre = 'Movimiento Renovación Ciudadana'
);