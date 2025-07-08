-- Database: BD_PracticasSoftware

-- DROP DATABASE IF EXISTS "BD_PracticasSoftware";

CREATE DATABASE "BD_PracticasSoftware"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
CREATE TABLE FACULTAD (
    Id_facultad INT PRIMARY KEY,
    Nombre_facultad VARCHAR(100) NOT NULL,
    Estado INT
);


CREATE TABLE CARRERA (
    Id_carrera SERIAL NOT NULL,
    Id_Facultad INT,
    Nombre_carrera VARCHAR(100),
    PRIMARY KEY (Id_carrera)
);

CREATE TABLE PERIODO (
    ID_periodo SERIAL PRIMARY KEY,
    DescripcionPeriodo VARCHAR(100) NOT NULL
);

CREATE TABLE EMPRESA (
    ID_empresa SERIAL PRIMARY KEY,
    Nombre_empresa VARCHAR(100) NOT NULL,
    Provincia_empresa VARCHAR(50) NOT NULL,
    Ciudad_empresa VARCHAR(50) NOT NULL,
    Direccion_empresa VARCHAR(50) NOT NULL,
    Telefono_empresa VARCHAR(10),
    E_mail_empresa VARCHAR(25),
    intEstado INT
);


CREATE TABLE ESTUDIANTE (
    id_estudiante SERIAL PRIMARY KEY,
	CI_estudiante VARCHAR(10),
    idCarrera INT NOT NULL,
    idSemestre INT NOT NULL,
    Nombre_est VARCHAR(50) NOT NULL,
    Apellido_pat VARCHAR(50) NOT NULL,
    Apellido_mat VARCHAR(50) NOT NULL,
    Sexo_est VARCHAR(10),
    Direccion_est VARCHAR(50),
    Ciudad_est VARCHAR(50),
    Provincia_est VARCHAR(50),
    Telefono_est VARCHAR(25),
    E_mail_est VARCHAR(50),
    Estado INT
);


CREATE TABLE CONVENIO (
    id SERIAL PRIMARY KEY,
    Id_empresa INT NOT NULL,
    Convenio varchar (200),
    F_inicioC DATE NOT NULL,
    F_finC DATE NOT NULL
);

CREATE TABLE ESTADO (
    ID SERIAL PRIMARY KEY,
    descripcion VARCHAR(255)
);


CREATE TABLE EVALUACION (
    id SERIAL PRIMARY KEY,
    FechaEvaluacion DATE NOT NULL,
    CI_estudiante int NOT NULL,
    CI_docente int NOT NULL,
    notaDocente DECIMAL(18, 2) NOT NULL,
    datosTutorEmpresa VARCHAR(250) NOT NULL,
    notaResponsableEm DECIMAL(18, 2) NOT NULL,
    sumaNotas DECIMAL(18, 2),
    FileName VARCHAR(200),
    FileSize INT,
    subirPortafolio VARCHAR(255)
);


CREATE TABLE PRACTICA (
    id_practica SERIAL PRIMARY KEY,
    Codigo_practica VARCHAR(15) NOT NULL,
    CI_estudiante int NOT NULL,
    Posee_informe BOOLEAN,
    ID_empresa INT NOT NULL,
    Titulo_proyecto VARCHAR(300) NOT NULL,
    Area VARCHAR(100),
    Fecha_Inscripcion DATE,
    Fecha_inicio_practica DATE,
    Fecha_fin_practica DATE,
    Total_horas_practica VARCHAR(5),
    Id_convenio INT,
    ID_periodo INT NOT NULL,
    Observaciones VARCHAR(200),
    Id_Estado INT
);

CREATE TABLE Semestre (
    Id SERIAL PRIMARY KEY,
    DescripcionSemestre VARCHAR(100) NOT NULL
);

CREATE TABLE DOCENTE (
    id_doc SERIAL PRIMARY KEY,
    CI_docente VARCHAR(10) NOT NULL,
    Nombre_dct VARCHAR(50),
    Apellido_pat VARCHAR(50),
    Apellido_mat VARCHAR(50),
    Sexo_dct VARCHAR(10),
    Direccion_dct VARCHAR(50),
    Ciudad_dct VARCHAR(50),
    Provincia_dct VARCHAR(50),
    Telefono_dct VARCHAR(10),
    E_mail_dct VARCHAR(50)
);

CREATE TABLE ADMINISTRADOR (
    id_admin SERIAL PRIMARY KEY,  -- Identificador único para el administrador
    nombre_completo VARCHAR(100) NOT NULL,  -- Nombre completo del administrador
    correo_electronico VARCHAR(100) NOT NULL,  -- Correo electrónico del administrador
    rol VARCHAR(50) NOT NULL,  -- Rol del administrador (ejemplo: 'superadmin', 'admin')
    fecha_registro DATE NOT NULL,  -- Fecha en que el administrador fue registrado
    estado VARCHAR(20) NOT NULL  -- Estado del administrador (activo, inactivo, suspendido)
);

-- Relación entre FACULTAD y CARRERA
ALTER TABLE CARRERA
    ADD CONSTRAINT fk_facultad
    FOREIGN KEY (Id_Facultad) REFERENCES FACULTAD(Id_facultad);

-- Relación entre ESTUDIANTE y CARRERA
ALTER TABLE ESTUDIANTE
    ADD CONSTRAINT fk_estudiante_carrera
    FOREIGN KEY (idCarrera) REFERENCES CARRERA(Id_carrera);

-- Relación entre ESTUDIANTE y SEMESTRE
ALTER TABLE ESTUDIANTE
    ADD CONSTRAINT fk_estudiante_semestre
    FOREIGN KEY (idSemestre) REFERENCES Semestre(Id);

-- Relación entre ESTUDIANTE y ESTADO
ALTER TABLE ESTUDIANTE
    ADD CONSTRAINT fk_estudiante_estado
    FOREIGN KEY (Estado) REFERENCES ESTADO(ID);

-- Relación entre CONVENIO y EMPRESA
ALTER TABLE CONVENIO
    ADD CONSTRAINT fk_convenio_empresa
    FOREIGN KEY (Id_empresa) REFERENCES EMPRESA(ID_empresa);

-- Relación entre EVALUACION y ESTUDIANTE
ALTER TABLE EVALUACION
    ADD CONSTRAINT fk_evaluacion_estudiante
    FOREIGN KEY (CI_estudiante) REFERENCES ESTUDIANTE(id_estudiante);
	


-- Relación entre EVALUACION y DOCENTE
ALTER TABLE EVALUACION
    ADD CONSTRAINT fk_evaluacion_docente
    FOREIGN KEY (CI_docente) REFERENCES DOCENTE(id_doc);

-- Relación entre PRACTICA y ESTUDIANTE
ALTER TABLE PRACTICA
    ADD CONSTRAINT fk_practica_estudiante
    FOREIGN KEY (CI_estudiante) REFERENCES ESTUDIANTE(id_estudiante);

-- Relación entre PRACTICA y EMPRESA
ALTER TABLE PRACTICA
    ADD CONSTRAINT fk_practica_empresa
    FOREIGN KEY (ID_empresa) REFERENCES EMPRESA(ID_empresa);




-- Relación entre PRACTICA y CONVENIO
ALTER TABLE PRACTICA
    ADD CONSTRAINT fk_practica_convenio
    FOREIGN KEY (Id_convenio) REFERENCES CONVENIO(id);

-- Relación entre PRACTICA y PERIODO
ALTER TABLE PRACTICA
    ADD CONSTRAINT fk_practica_periodo
    FOREIGN KEY (ID_periodo) REFERENCES PERIODO(ID_periodo);

-- Relación entre PRACTICA y ESTADO
ALTER TABLE PRACTICA
    ADD CONSTRAINT fk_practica_estado
    FOREIGN KEY (Id_Estado) REFERENCES ESTADO(ID);

-- Relación entre PRACTICA y SEMESTRE (esto dependerá de la estructura que quieras, ya que no hay un campo claro en la tabla PRACTICA para SEMESTRE)
-- ALTER TABLE PRACTICA
--     ADD CONSTRAINT fk_practica_semestre
--     FOREIGN KEY (campo_semestre) REFERENCES Semestre(Id);




	

-- Relación entre DOCENTE y EVALUACION
ALTER TABLE EVALUACION
    ADD CONSTRAINT fk_evaluacion_docente
    FOREIGN KEY (CI_docente) REFERENCES DOCENTE(CI_docente);

-- Relación entre PRACTICA y DOCENTE (si decides agregar un campo para el docente responsable en la tabla PRACTICA)
ALTER TABLE PRACTICA
    ADD COLUMN id_docente INT,  -- Nuevo campo para identificar al docente responsable
    ADD CONSTRAINT fk_practica_docente
    FOREIGN KEY (id_docente) REFERENCES DOCENTE(id_doc);
	
CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  rol CHAR(1)
);




