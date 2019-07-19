-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sigea
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sigea
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sigea` DEFAULT CHARACTER SET utf8 ;
USE `sigea` ;

-- -----------------------------------------------------
-- Table `sigea`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`rol` (
  `id_rol` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre_rol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`usuario` (
  `id_User` INT(11) NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(20) NULL DEFAULT NULL,
  `contrasena` VARCHAR(20) NULL DEFAULT NULL,
  `rol_id_rol` INT(11) NOT NULL,
  PRIMARY KEY (`id_User`),
  UNIQUE INDEX `idx_usuario_usuario` (`usuario` ASC) VISIBLE,
  INDEX `fk_usuario_rol1_idx` (`rol_id_rol` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_rol1`
    FOREIGN KEY (`rol_id_rol`)
    REFERENCES `sigea`.`rol` (`id_rol`))
ENGINE = InnoDB
AUTO_INCREMENT = 63
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`docente` (
  `id_Docente` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre_docente` VARCHAR(45) NOT NULL,
  `PrimerApellido_Docente` VARCHAR(45) NOT NULL,
  `SegundoApellido_Docente` VARCHAR(45) NOT NULL,
  `usuario_id_User` INT(11) NOT NULL,
  PRIMARY KEY (`id_Docente`),
  INDEX `fk_docente_usuario1_idx` (`usuario_id_User` ASC) VISIBLE,
  CONSTRAINT `fk_docente_usuario1`
    FOREIGN KEY (`usuario_id_User`)
    REFERENCES `sigea`.`usuario` (`id_User`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`carrera` (
  `id_carrera` INT(3) NOT NULL AUTO_INCREMENT,
  `Nombre_Carrera` VARCHAR(45) NOT NULL,
  `idDivision` INT(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id_carrera`),
  INDEX `idDivision_idx` (`idDivision` ASC) VISIBLE,
  CONSTRAINT `idDivision`
    FOREIGN KEY (`idDivision`)
    REFERENCES `sigea`.`carrera` (`id_carrera`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`materia` (
  `id_Mat` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Mat` VARCHAR(45) NOT NULL,
  `Carrera_id` INT(3) NOT NULL,
  PRIMARY KEY (`id_Mat`),
  INDEX `Carrera_id_idx` (`Carrera_id` ASC) VISIBLE,
  CONSTRAINT `Carrera_id`
    FOREIGN KEY (`Carrera_id`)
    REFERENCES `sigea`.`carrera` (`id_carrera`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`asesoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`asesoria` (
  `id_asesorias` INT(11) NOT NULL AUTO_INCREMENT,
  `Estatus_asesorias` VARCHAR(45) NULL DEFAULT NULL,
  `Fecha_asesorias` DATETIME NULL DEFAULT NULL,
  `materia_id_mat` INT(11) NOT NULL,
  `docente_id_docente` INT(11) NOT NULL,
  `Tema_asesoria` VARCHAR(45) NOT NULL,
  `Comentario_asesoria` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_asesorias`),
  INDEX `fk_asesoria_materia_idx` (`materia_id_mat` ASC) VISIBLE,
  INDEX `fk_asesoria_docente1_idx` (`docente_id_docente` ASC) VISIBLE,
  CONSTRAINT `fk_asesoria_docente1`
    FOREIGN KEY (`docente_id_docente`)
    REFERENCES `sigea`.`docente` (`id_Docente`),
  CONSTRAINT `fk_asesoria_materia`
    FOREIGN KEY (`materia_id_mat`)
    REFERENCES `sigea`.`materia` (`id_Mat`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`division`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`division` (
  `id_division` INT(3) NOT NULL AUTO_INCREMENT,
  `nombre_division` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_division`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`estudiante` (
  `id_estudiante` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre_estudiante` VARCHAR(45) NOT NULL,
  `PrimerApellido_estudiante` VARCHAR(45) NOT NULL,
  `SegundoApellido_estudiante` VARCHAR(45) NOT NULL,
  `division_id_division` INT(3) NOT NULL,
  `usuario_id_User` INT(11) NOT NULL,
  `idCarrera` INT(3) NOT NULL,
  PRIMARY KEY (`id_estudiante`),
  INDEX `fk_estudiante_division1_idx` (`division_id_division` ASC) VISIBLE,
  INDEX `fk_estudiante_usuario1_idx` (`usuario_id_User` ASC) VISIBLE,
  INDEX `idCarrera_idx` (`idCarrera` ASC) VISIBLE,
  CONSTRAINT `fk_estudiante_division1`
    FOREIGN KEY (`division_id_division`)
    REFERENCES `sigea`.`division` (`id_division`),
  CONSTRAINT `fk_estudiante_usuario1`
    FOREIGN KEY (`usuario_id_User`)
    REFERENCES `sigea`.`usuario` (`id_User`),
  CONSTRAINT `idCarrera`
    FOREIGN KEY (`idCarrera`)
    REFERENCES `sigea`.`carrera` (`id_carrera`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`periodo` (
  `id_periodo` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre_periodo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_periodo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`grupos` (
  `id_grupo` INT(11) NOT NULL AUTO_INCREMENT,
  `periodo_id_periodo` INT(11) NOT NULL,
  `Nombre_grupo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_grupo`),
  INDEX `fk_grupos_periodo1_idx` (`periodo_id_periodo` ASC) VISIBLE,
  CONSTRAINT `fk_grupos_periodo1`
    FOREIGN KEY (`periodo_id_periodo`)
    REFERENCES `sigea`.`periodo` (`id_periodo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`estudiantegrupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`estudiantegrupo` (
  `id_estudianteGrupo` INT(11) NOT NULL,
  `id_estudiante` INT(11) NOT NULL,
  `grupos_id_grupo` INT(11) NOT NULL,
  PRIMARY KEY (`id_estudianteGrupo`),
  INDEX `fk_estudiante_has_grupo_estudiante1_idx` (`id_estudiante` ASC) VISIBLE,
  INDEX `fk_estudiante_has_grupo_grupos1_idx` (`grupos_id_grupo` ASC) VISIBLE,
  CONSTRAINT `fk_estudiante_has_grupo_estudiante1`
    FOREIGN KEY (`id_estudiante`)
    REFERENCES `sigea`.`estudiante` (`id_estudiante`),
  CONSTRAINT `fk_estudiante_has_grupo_grupos1`
    FOREIGN KEY (`grupos_id_grupo`)
    REFERENCES `sigea`.`grupos` (`id_grupo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`asesoriaestudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`asesoriaestudiante` (
  `id_asesoriaEstudinate` INT(11) NOT NULL AUTO_INCREMENT,
  `id_asesoria` INT(11) NOT NULL,
  `idEstudianteGrupo` INT(11) NOT NULL,
  `Asistio_asesoria` TINYBLOB NOT NULL,
  PRIMARY KEY (`id_asesoriaEstudinate`, `id_asesoria`, `idEstudianteGrupo`),
  INDEX `fk_asesoria_has_estudiante_has_grupo_estudiante_has_grupo1_idx` (`idEstudianteGrupo` ASC) VISIBLE,
  INDEX `fk_asesoria_has_estudiante_has_grupo_asesoria1_idx` (`id_asesoria` ASC) VISIBLE,
  CONSTRAINT `fk_asesoria_has_estudiante_has_grupo_asesoria1`
    FOREIGN KEY (`id_asesoria`)
    REFERENCES `sigea`.`asesoria` (`id_asesorias`),
  CONSTRAINT `fk_asesoria_has_estudiante_has_grupo_estudiante_has_grupo1`
    FOREIGN KEY (`idEstudianteGrupo`)
    REFERENCES `sigea`.`estudiantegrupo` (`id_estudianteGrupo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`dia` (
  `id_dia` INT(11) NOT NULL AUTO_INCREMENT,
  `dia_dia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_dia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`hoficial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`hoficial` (
  `id_HOficial` INT(11) NOT NULL AUTO_INCREMENT,
  `docente_id_Docente` INT(11) NOT NULL,
  `dia_id_dia` INT(11) NOT NULL,
  `horaInicio` DATETIME NOT NULL,
  `horaFin` DATETIME NOT NULL,
  PRIMARY KEY (`id_HOficial`),
  INDEX `fk_HOficial_docente1_idx` (`docente_id_Docente` ASC) VISIBLE,
  INDEX `fk_HOficial_dia1_idx` (`dia_id_dia` ASC) VISIBLE,
  CONSTRAINT `fk_HOficial_dia1`
    FOREIGN KEY (`dia_id_dia`)
    REFERENCES `sigea`.`dia` (`id_dia`),
  CONSTRAINT `fk_HOficial_docente1`
    FOREIGN KEY (`docente_id_Docente`)
    REFERENCES `sigea`.`docente` (`id_Docente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`asesoriahnoficial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`asesoriahnoficial` (
  `id_asesoriaHNOficial` INT(11) NOT NULL AUTO_INCREMENT,
  `asesoria_id_asesorias` INT(11) NOT NULL,
  `HOficial_id_HOficial` INT(11) NOT NULL,
  PRIMARY KEY (`id_asesoriaHNOficial`, `asesoria_id_asesorias`, `HOficial_id_HOficial`),
  INDEX `fk_asesoria_has_HOficial_HOficial2_idx` (`HOficial_id_HOficial` ASC) VISIBLE,
  INDEX `fk_asesoria_has_HOficial_asesoria2_idx` (`asesoria_id_asesorias` ASC) VISIBLE,
  CONSTRAINT `fk_asesoria_has_HOficial_HOficial2`
    FOREIGN KEY (`HOficial_id_HOficial`)
    REFERENCES `sigea`.`hoficial` (`id_HOficial`),
  CONSTRAINT `fk_asesoria_has_HOficial_asesoria2`
    FOREIGN KEY (`asesoria_id_asesorias`)
    REFERENCES `sigea`.`asesoria` (`id_asesorias`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sigea`.`asesoriahoficial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sigea`.`asesoriahoficial` (
  `id_asesoriaHOficial` INT(11) NOT NULL,
  `asesoria_id_asesorias` INT(11) NOT NULL,
  `HOficial_id_HOficial` INT(11) NOT NULL,
  PRIMARY KEY (`id_asesoriaHOficial`, `asesoria_id_asesorias`, `HOficial_id_HOficial`),
  INDEX `fk_asesoria_has_HOficial_HOficial1_idx` (`HOficial_id_HOficial` ASC) VISIBLE,
  INDEX `fk_asesoria_has_HOficial_asesoria1_idx` (`asesoria_id_asesorias` ASC) VISIBLE,
  CONSTRAINT `fk_asesoria_has_HOficial_HOficial1`
    FOREIGN KEY (`HOficial_id_HOficial`)
    REFERENCES `sigea`.`hoficial` (`id_HOficial`),
  CONSTRAINT `fk_asesoria_has_HOficial_asesoria1`
    FOREIGN KEY (`asesoria_id_asesorias`)
    REFERENCES `sigea`.`asesoria` (`id_asesorias`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




-- insertando datos en tabla rol --
insert into rol (Nombre_rol) values('Docente');
insert into rol (Nombre_rol) values('Estudiante');
insert into rol (Nombre_rol) values('Administrador');
select * from rol;
-- corrigiendo nombres de las columnas siguientes-- 



delete from usuario where rol_id_rol = 2;
select * from usuario;
-- insertando datos en la tabla usuario  para estudiantes--
insert into usuario (usuario, contrasena,rol_id_rol) values ('20173ti064','ti064',2);
insert into usuario (usuario, contrasena,rol_id_rol) values ('20173ti025','ti025',2);
insert into usuario (usuario, contrasena,rol_id_rol) values ('20173ti011','ti011',2);
insert into usuario (usuario, contrasena,rol_id_rol) values ('20173ti009','ti009',2);
insert into usuario (usuario, contrasena,rol_id_rol) values ('20173ti004','ti004',2);
insert into usuario (usuario, contrasena,rol_id_rol) values ('20173ti024','ti024',2);
insert into usuario (usuario, contrasena,rol_id_rol) values ('20173ti014','ti014',2);
insert into usuario (usuario, contrasena,rol_id_rol) values ('20173ti054','ti054',2);
insert into usuario (usuario, contrasena,rol_id_rol) values ('20173ti001','ti001',2);
insert into usuario (usuario, contrasena,rol_id_rol) values ('20173ti002','ti002',2);

select * from rol;
use sigea;
select * from usuario;
-- insertando datos en la tabla usuario para docentes --
insert into usuario (usuario, contrasena,rol_id_rol) values ('bernardohuicochea','dc_huicochea',1);
insert into usuario (usuario, contrasena,rol_id_rol) values ('hugoalejandres','dc_alejandres',1);
insert into usuario (usuario, contrasena,rol_id_rol) values ('aracelijacobo','dc_jacobo',1);
insert into usuario (usuario, contrasena,rol_id_rol) values ('migueldelpilar','dc_delpilar',1);
insert into usuario (usuario, contrasena,rol_id_rol) values ('josénarvaez','dc_narvaez',1);
insert into usuario (usuario, contrasena,rol_id_rol) values ('reynelflores','dc_flores',1);
insert into usuario (usuario, contrasena,rol_id_rol) values ('joséespinoza','dc_espinoza',1);
insert into usuario (usuario, contrasena,rol_id_rol) values ('arturovillareal','dc_villareal',1);
insert into usuario (usuario, contrasena,rol_id_rol) values ('oscarsalinas','dc_salinas',1);
insert into usuario (usuario, contrasena,rol_id_rol) values ('oscarsanchez','dc_sanchez',1);
insert into usuario (usuario, contrasena,rol_id_rol) values ('cernamadero','dc_madero',1);


-- data of admin inserted -- 


insert into usuario (usuario, contrasena,rol_id_rol) values ('jazminrogel','dc_rogel',3);
use sigea;

-- muestra los usuarios y sus roles --
select r.Nombre_rol, us.rol_id_rol, us.usuario from usuario us inner join rol r on us.rol_id_rol = r.id_rol;
select * from usuario;

         
select Nombre_rol from rol where id_rol = 1;



-- Ingresando datos de estudiantes --
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('Demetrio', 'Del Carmen', 'Gómez', '1', '2', '2');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('José Edgardo', 'Corrales', 'Gómez', '1', '2', '2');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('María Fernanda', 'Guzmán', 'Cruz', '1', '2', '2');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('Fernando Antonio', 'Pérez', 'Flores', '1', '2', '2');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('Violeta Marlene', 'Arroyo', 'Zarco', '1', '2', '1');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('Juan Carlos', 'De la Cruz', 'Contreras', '1', '2', '1');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('Gerardo Javier', 'Marquez', 'Benitez', '1', '2', '1');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('Rebeca Isabel', 'Adame', 'Bustamante', '1', '2', '3');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('Sarahi', 'Blancas', 'Aguilar', '1', '2', '3');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('Alondra', 'Castillo', 'Saldaña', '1', '2', '3');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('Brayan', 'Castillo', 'Sanchez', '1', '2', '3');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('Samanta', 'Salgado', 'Bahena', '1', '2', '4');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('Jesús Emiliano', 'Barba', 'Hurtado', '1', '2', '4');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('Ana Karen', 'Martínez', 'Gago', '1', '2', '4');
INSERT INTO `sigea`.`estudiante` (`Nombre_estudiante`, `PrimerApellido_estudiante`, `SegundoApellido_estudiante`, `division_id_division`, `usuario_id_User`, `idCarrera`) VALUES ('Ricardo', 'Juárez', 'Flores', '1', '2', '4');
-- ok --

select * from estudiante;

-- creando procedimiento almacenado de consulta de estudiante -- 
/*
DELIMITER $$
CREATE PROCEDURE sp_consultarEstudiante(idEstudiante INT)
BEGIN 		
SELECT e.Nombre_estudiante, c.Nombre_Carrera, d.nombre_division FROM
		estudiante e INNER JOIN carrera c ON e.idCarrera  = c.id_carrera
        INNER JOIN division d  ON e.division_id_division = d.id_division
        WHERE e.id_estudiante = idEstudiante;
        
END;
DELIMITER;


-- probando al procedimiento-- 
-- call sp_consultarEstudiante(1); --
		
*/


select * from usuario;
    /*
select concat(e.Nombre_estudiante," ",e.PrimerApellido_estudiante," ",e.SegundoApellido_estudiante) as Nombre, u.usuario as usuario FROM
	estudiante e  INNER JOIN  usuario  u ON  e.usuario_id_User = u.id_User;
    
    */
    
    
    
    select * from estudiante;
    
	select e.Nombre_estudiante, u.id_User from usuario u inner join 
			estudiante e on u.id_User = e.usuario_id_User 
            WHERE e.usuario_id_User = 15;
      
      select Nombre_carrera  from carrera inner join 
      estudiante on carrera.id_carrera = estudiante.idCarrera
		WHERE estudiante.id_estudiante = 2;
    