USE simulador_cne;

-- Candidatos inscritos para la dignidad de alcalde.
SELECT nombres, apellidos
FROM candidatos
WHERE id_dignidad = (
	SELECT id_dignidad
	FROM dignidad
	WHERE nombre = 'Alcalde'
);