USE simulador_cne;

-- Nivel 1: Subconsultas básicas

-- 1. Candidatos pertenecientes al Movimiento Renovación Ciudadana.
SELECT nombres, apellidos
FROM candidatos
WHERE id_organizacion = (
	SELECT id_organizacion
	FROM organizacion
	WHERE nombre = 'Movimiento Renovación Ciudadana'
);

-- 2. Candidatos inscritos para la dignidad de alcalde.
SELECT nombres, apellidos
FROM candidatos
WHERE id_dignidad = (
	SELECT id_dignidad
	FROM dignidad
	WHERE nombre = 'Alcalde'
);

-- 3. Candidatos de cantones pertenecientes a la provincia de Loja.
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

-- 4. Candidatos con votos superiores al promedio de votos registrados.
SELECT c.nombres, c.apellidos, r.votos
FROM candidatos AS c
JOIN resultados AS r ON r.id_candidato = c.id_candidato
WHERE r.votos > (
	SELECT AVG(votos)
	FROM resultados
);

-- Nivel 2: Subconsultas con operadores

-- 5. Organizaciones políticas con al menos un candidato inscrito.
SELECT nombre, siglas, numero_lista
FROM organizacion
WHERE id_organizacion IN (
	SELECT id_organizacion
	FROM candidatos
);

-- 6. Organizaciones políticas sin candidatos inscritos.
SELECT o.nombre, o.siglas, o.numero_lista
FROM organizacion AS o
WHERE NOT EXISTS (
	SELECT 1
	FROM candidatos AS c
	WHERE c.id_organizacion = o.id_organizacion
);

-- 7. Candidatos con más votos que todos los candidatos del cantón Loja.
SELECT c.nombres, c.apellidos, r.votos
FROM candidatos AS c
JOIN resultados AS r ON r.id_candidato = c.id_candidato
WHERE r.votos > ALL (
	SELECT r_loja.votos
	FROM resultados AS r_loja
	JOIN candidatos AS c_loja ON c_loja.id_candidato = r_loja.id_candidato
	JOIN canton AS ca_loja ON ca_loja.id_canton = c_loja.id_canton
	WHERE ca_loja.nombre = 'Loja'
);

-- 8. Candidatos con más votos que al menos un candidato de Catamayo.
SELECT c.nombres, c.apellidos, r.votos
FROM candidatos AS c
JOIN resultados AS r ON r.id_candidato = c.id_candidato
WHERE r.votos > ANY (
	SELECT r_catamayo.votos
	FROM resultados AS r_catamayo
	JOIN candidatos AS c_catamayo ON c_catamayo.id_candidato = r_catamayo.id_candidato
	JOIN canton AS ca_catamayo ON ca_catamayo.id_canton = c_catamayo.id_canton
	WHERE ca_catamayo.nombre = 'Catamayo'
);

-- Nivel 3: Subconsultas correlacionadas

-- 9. Candidatos que superan el promedio de votos de su dignidad.
SELECT c.nombres, c.apellidos, d.nombre AS dignidad, r.votos
FROM candidatos AS c
JOIN dignidad AS d ON d.id_dignidad = c.id_dignidad
JOIN resultados AS r ON r.id_candidato = c.id_candidato
WHERE r.votos > (
	SELECT AVG(r_dignidad.votos)
	FROM candidatos AS c_dignidad
	JOIN resultados AS r_dignidad ON r_dignidad.id_candidato = c_dignidad.id_candidato
	WHERE c_dignidad.id_dignidad = c.id_dignidad
);-- ============================================================================
-- Proyecto: Sistema CNE Simulado - Subconsultas
-- Motor: MySQL 8.0+
-- ============================================================================

-- 10. Candidatos con la mayor votación de su cantón; incluye todos los empates.
SELECT c.nombres, c.apellidos, ca.nombre AS canton, r.votos
FROM candidatos AS c
JOIN canton AS ca ON ca.id_canton = c.id_canton
JOIN resultados AS r ON r.id_candidato = c.id_candidato
WHERE r.votos = (
	SELECT MAX(r_canton.votos)
	FROM candidatos AS c_canton
	JOIN resultados AS r_canton ON r_canton.id_candidato = c_canton.id_candidato
	WHERE c_canton.id_canton = c.id_canton
);

-- 11. Organizaciones con más candidatos que el promedio por organización.
SELECT o.nombre, o.siglas, o.numero_lista
FROM organizacion AS o
WHERE (
	SELECT COUNT(*)
	FROM candidatos AS c
	WHERE c.id_organizacion = o.id_organizacion
) > (
	SELECT AVG(conteos.cantidad)
	FROM (
		SELECT COUNT(c2.id_candidato) AS cantidad
		FROM organizacion AS o2
		LEFT JOIN candidatos AS c2 ON c2.id_organizacion = o2.id_organizacion
		GROUP BY o2.id_organizacion
	) AS conteos
);

-- 12. Candidatos sin resultados electorales.
SELECT c.nombres, c.apellidos
FROM candidatos AS c
WHERE NOT EXISTS (
	SELECT 1
	FROM resultados AS r
	WHERE r.id_candidato = c.id_candidato
);
