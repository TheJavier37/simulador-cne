USE simulador_cne;

-- Candidatos con votos superiores al promedio de votos registrados.
SELECT c.nombres, c.apellidos, r.votos
FROM candidatos AS c
JOIN resultados AS r ON r.id_candidato = c.id_candidato
WHERE r.votos > (
	SELECT AVG(votos)
	FROM resultados
);