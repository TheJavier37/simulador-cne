USE simulador_cne;

-- Organizaciones políticas con al menos un candidato inscrito.
SELECT nombre, siglas, numero_lista
FROM organizacion
WHERE id_organizacion IN (
	SELECT id_organizacion
	FROM candidatos
);