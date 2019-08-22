-- SELECT  CONCAT(dia_dia, " - ",horaInicio," - ",horaFin) as horario FROM hoficial  JOIN dia  ON hoficial.dia_id_dia = id_dia WHERE docente_id_Docente = 3 AND  dia_id_dia = 2;

-- Materia Día	Hora	Docente	Comentario	Acciones	Participantes


DELIMITER //
CREATE PROCEDURE loadUserByID(in idEstudent INT)
BEGIN
SELECT usuario, Nombre_estudiante FROM estudiante est JOIN usuario u ON u.id_User = est.id_estudiante WHERE est.id_estudiante = idEstudent;
END;
DELIMITER ;

CALL loadUserByID(2);
-- SELECT Nombre_mat, 

