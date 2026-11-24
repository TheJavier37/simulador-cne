USE simulador_cne;

-- Candidatos que superan el promedio de votos de su dignidad.
SELECT c.nombres, c.apellidos, d.nombre AS dignidad, r.votos
FROM candidato AS c
JOIN dignidad AS d ON d.id_dignidad = c.id_dignidad
JOIN resultado AS r ON r.id_candidato = c.id_candidato
WHERE r.votos > (
	SELECT AVG(r_dignidad.votos)
	FROM candidato AS c_dignidad
	JOIN resultado AS r_dignidad ON r_dignidad.id_candidato = c_dignidad.id_candidato
	WHERE c_dignidad.id_dignidad = c.id_dignidad
);