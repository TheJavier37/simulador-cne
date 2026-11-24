USE simulador_cne;

-- Organizaciones políticas sin candidatos inscritos.
SELECT o.nombre, o.siglas, o.numero_lista
FROM organizacion AS o
WHERE NOT EXISTS (
	SELECT 1
	FROM candidatos AS c
	WHERE c.id_organizacion = o.id_organizacion
);