USE simulador_cne;

-- Candidatos con la mayor votación de su cantón; incluye todos los empates.
SELECT c.nombres, c.apellidos, ca.nombre AS canton, r.votos
FROM candidato AS c
JOIN canton AS ca ON ca.id_canton = c.id_canton
JOIN resultado AS r ON r.id_candidato = c.id_candidato
WHERE r.votos = (
	SELECT MAX(r_canton.votos)
	FROM candidato AS c_canton
	JOIN resultado AS r_canton ON r_canton.id_candidato = c_canton.id_candidato
	WHERE c_canton.id_canton = c.id_canton
);