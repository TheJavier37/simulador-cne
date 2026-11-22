USE simulador_cne;

-- Candidatos con más votos que todos los candidatos del cantón Loja.
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