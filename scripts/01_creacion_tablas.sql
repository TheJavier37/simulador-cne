-- ============================================================================
-- Proyecto: Sistema CNE Simulado - Base de Datos Relacional
-- Archivo:  scripts/01_creacion_tablas.sql
-- Autores:  Javier Guarnizo Vega & José Valencia
-- Motor:    MySQL 8.0+
-- ============================================================================

CREATE DATABASE IF NOT EXISTS simulador_cne
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE simulador_cne;

-- 1. Tabla: provincia
CREATE TABLE provincia (
    id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Tabla: canton (Relación 1:N con provincia)
CREATE TABLE canton (
    id_canton INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_provincia INT NOT NULL,
    CONSTRAINT fk_canton_provincia
        FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 3. Tabla: organizacion
CREATE TABLE organizacion (
    id_organizacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL UNIQUE,
    siglas VARCHAR(20) NOT NULL,
    numero_lista VARCHAR(10) NOT NULL
);

-- 4. Tabla: dignidad
CREATE TABLE dignidad (
    id_dignidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT NULL
);

-- 5. Tabla: votante (Relación 1:N con canton)
CREATE TABLE votante (
    id_votante INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(10) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    sufrago BOOLEAN NOT NULL DEFAULT FALSE,
    id_canton INT NOT NULL,
    CONSTRAINT fk_votante_canton
        FOREIGN KEY (id_canton) REFERENCES canton(id_canton)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 6. Tabla: candidatos (Relación 1:N con organizacion, dignidad y canton)
CREATE TABLE candidatos (
    id_candidato INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(60) NOT NULL,
    id_organizacion INT NOT NULL,
    id_dignidad INT NOT NULL,
    id_canton INT NOT NULL,
    CONSTRAINT fk_candidato_organizacion
        FOREIGN KEY (id_organizacion) REFERENCES organizacion(id_organizacion)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_candidato_dignidad
        FOREIGN KEY (id_dignidad) REFERENCES dignidad(id_dignidad)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_candidato_canton
        FOREIGN KEY (id_canton) REFERENCES canton(id_canton)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 7. Tabla: resultados (Relación 1:0..1 con candidatos)
CREATE TABLE resultados (
    id_resultado INT AUTO_INCREMENT PRIMARY KEY,
    votos INT NOT NULL,
    fecha DATE NOT NULL,
    id_candidato INT NOT NULL UNIQUE,
    CONSTRAINT chk_votos_no_negativos CHECK (votos >= 0),
    CONSTRAINT fk_resultado_candidato
        FOREIGN KEY (id_candidato) REFERENCES candidatos(id_candidato)
        ON DELETE RESTRICT ON UPDATE CASCADE
);