USE simulador_cne;

-- Candidatos de cantones pertenecientes a la provincia de Loja.
SELECT nombres, apellidos
FROM candidatos
WHERE id_canton IN (
	SELECT id_canton
	FROM canton
	WHERE id_provincia = (
		SELECT id_provincia
		FROM provincia
		WHERE nombre = 'Loja'
	)
);