USE simulador_cne;

-- Candidatos con más votos que al menos un candidato de Catamayo.
SELECT c.nombres, c.apellidos, r.votos
FROM candidato AS c
JOIN resultado AS r ON r.id_candidato = c.id_candidato
WHERE r.votos > ANY (
	SELECT r_catamayo.votos
	FROM resultado AS r_catamayo
	JOIN candidato AS c_catamayo ON c_catamayo.id_candidato = r_catamayo.id_candidato
	JOIN canton AS ca_catamayo ON ca_catamayo.id_canton = c_catamayo.id_canton
	WHERE ca_catamayo.nombre = 'Catamayo'
);