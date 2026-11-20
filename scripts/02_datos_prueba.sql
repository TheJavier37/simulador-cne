-- ============================================================================
-- Proyecto: Sistema CNE Simulado - Base de Datos Relacional
-- Archivo:  scripts/02_datos_prueba.sql
-- Autores:  Javier Guarnizo Vega & José Valencia
-- Motor:    MySQL 8.0+
-- ============================================================================

USE simulador_cne;

-- 1. provincia
INSERT INTO provincia (nombre) VALUES
('Loja'),
('Azuay'),
('Pichincha');

-- 2. canton
INSERT INTO canton (nombre, id_provincia) VALUES
('Loja', 1),
('Catamayo', 1),
('Saraguro', 1),
('Cuenca', 2),
('Quito', 3);

-- 3. organizacion
INSERT INTO organizacion (nombre, siglas, numero_lista) VALUES
('Movimiento Renovación Ciudadana', 'MRC', 'Lista 10'),
('Alianza Democrática del Sur', 'ADS', 'Lista 21'),
('Frente Unidad Popular', 'FUP', 'Lista 35'),
('Movimiento Progreso Nacional', 'MPN', 'Lista 42'),
('Partido Acción Juvenil', 'PAJ', 'Lista 55'),
('Movimiento Ecologista Ecuatoriano', 'MEE', 'Lista 68');

-- 4. dignidad
INSERT INTO dignidad (nombre, descripcion) VALUES
('Alcalde', 'Máxima autoridad ejecutiva del Gobierno Autónomo Descentralizado Municipal'),
('Prefecto', 'Máxima autoridad ejecutiva del Gobierno Autónomo Descentralizado Provincial'),
('Concejal Urbano', 'Integrante del cuerpo legislativo del concejo cantonal');

-- 5. candidatos
INSERT INTO candidatos (nombres, apellidos, id_organizacion, id_dignidad, id_canton) VALUES
('Carlos Andrés', 'Mendoza Silva', 1, 1, 1),
('María Fernanda', 'Torres León', 2, 1, 1),
('Diego Patricio', 'Armijos Cueva', 3, 3, 1),
('Lucía Salomé', 'Valdivieso Mora', 1, 1, 2),
('Jorge Luis', 'Cueva Jumbo', 2, 1, 2),
('Sofía Carolina', 'Benítez Ortiz', 4, 3, 2),
('Andrés Felipe', 'Villavicencio Ríos', 1, 2, 3),
('Valeria Estefanía', 'Guamán Pineda', 2, 1, 4),
('Esteban Mauricio', 'Paredes Vela', 3, 1, 5),
('Camila Alejandra', 'Salazar Brito', 4, 2, 4),
('Mateo Sebastián', 'Quizhpe Lozano', 1, 3, 3),
('Gabriela Nicole', 'Ochoa Tandazo', 3, 1, 3);

-- 6. resultados
INSERT INTO resultados (votos, fecha, id_candidato) VALUES
(18500, '2026-11-15', 1),
(18500, '2026-11-15', 2),
(9200,  '2026-11-15', 3),
(7400,  '2026-11-15', 4),
(6100,  '2026-11-15', 5),
(3200,  '2026-11-15', 6),
(5800,  '2026-11-15', 7),
(24000, '2026-11-15', 8),
(28000, '2026-11-15', 9),
(11500, '2026-11-15', 10);

-- 7. votante
INSERT INTO votante (cedula, nombres, apellidos, sufrago, id_canton) VALUES
('1104589632', 'Javier Alexander', 'Guarnizo Vega', TRUE, 1),
('1105124789', 'José Fernando', 'Valencia Ríos', TRUE, 1),
('1103987451', 'Ana Gabriela', 'Samaniego Cruz', FALSE, 1),
('1104785214', 'Luis Alberto', 'Jiménez Pardo', TRUE, 2),
('1102369854', 'Paola Cristina', 'Rojas Aguirre', FALSE, 2),
('1105478963', 'Ángel Rodrigo', 'Macas Lozano', TRUE, 3),
('0104523698', 'Daniela Sofía', 'Cordero Vázquez', TRUE, 4),
('1718956324', 'Sebastián Andrés', 'Almeida Torres', FALSE, 5);