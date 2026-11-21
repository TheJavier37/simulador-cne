USE simulador_cne;

CREATE OR REPLACE VIEW view_candidatos AS
SELECT
	c.id_candidato,
	c.nombres,
	c.apellidos,
	o.nombre AS organizacion_politica,
	o.siglas,
	d.nombre AS dignidad,
	ca.nombre AS canton,
	p.nombre AS provincia
FROM candidatos AS c
JOIN organizacion AS o ON o.id_organizacion = c.id_organizacion
JOIN dignidad AS d ON d.id_dignidad = c.id_dignidad
JOIN canton AS ca ON ca.id_canton = c.id_canton
JOIN provincia AS p ON p.id_provincia = ca.id_provincia;