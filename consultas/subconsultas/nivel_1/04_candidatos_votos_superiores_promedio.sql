USE simulador_cne;

-- Candidatos con votos superiores al promedio de votos registrados.
SELECT c.nombres, c.apellidos, r.votos
FROM candidato AS c
JOIN resultado AS r ON r.id_candidato = c.id_candidato
WHERE r.votos > (
	SELECT AVG(votos)
	FROM resultado
);