# 🗳️ Sistema CNE Simulado - Base de Datos Relacional

## 📋 Información Académica

| Campo | Detalle |
| :--- | :--- |
| **Facultad:** | Facultad de la Energía, las Industrias y los Recursos Naturales no Renovables |
| **Carrera:** | Ingeniería en Ciencias de la Computación |
| **Semestre y Paralelo:** | Tercer Ciclo "A" |
| **Periodo Académico:** | Septiembre 2026 - Febrero 2027 |
| **Asignatura:** | Base de Datos |
| **Docente:** | Ing. Rene Guaman |
| **Autores:** | Javier Guarnizo Vega & José Valencia |

---

## 📌 Descripción del Proyecto

Este repositorio contiene el diseño lógico, modelado relacional e implementación en SQL de una base de datos académica orientada a simular el registro y escrutinio de las **elecciones seccionales en Ecuador** para autoridades de los Gobiernos Autónomos Descentralizados (**GAD**): prefectos, alcaldes, concejales y vocales de juntas parroquiales.

El sistema permite administrar organizaciones políticas, candidaturas, dignidades, circunscripciones territoriales (provincias y cantones), padrón de votantes y resultados electorales, garantizando la integridad referencial mediante claves primarias, foráneas y restricciones de dominio.

---

## 🗂️ Estructura del Repositorio

```text
simulador-cne/
├── diagramas/
│   ├── sistema_cne_relacional.drawio   # Archivo editable del diagrama relacional
│   └── sistema_cne_relacional.png      # Exportación visual del esquema
├── scripts/
│   ├── 01_creacion_tablas.sql          # Sentencias DDL (CREATE TABLE, PK, FK, CHECK)
│   └── 02_datos_prueba.sql             # Sentencias DML (INSERT de datos ficticios)
├── consultas/
│   ├── 03_subconsultas.sql             # Resolución de subconsultas (Niveles 1, 2 y 3)
│   └── 04_vistas.sql                   # Definición de la vista Vw_candidatos
└── README.md

## ⚠️ Aviso Legal (Disclaimer)

> **Nota Importante:** Este proyecto tiene fines **estrictamente académicos y educativos**, desarrollado exclusivamente para la asignatura de **Base de Datos** de la Carrera de Ingeniería en Ciencias de la Computación.
>
> * **Sin afiliación institucional:** Este sistema es un modelo académico simplificado que **no representa, replica ni guarda relación oficial alguna** con el **Consejo Nacional Electoral (CNE)** de la República del Ecuador ni con ninguna entidad del Estado.
> * **Datos 100 % ficticios:** Todas las organizaciones políticas, candidatos, números de lista, votantes y escrutinios incluidos en los scripts SQL son completamente ficticios y fueron generados únicamente para validar restricciones relacionales, subconsultas y vistas. Cualquier parecido con personas o movimientos reales es pura coincidencia.