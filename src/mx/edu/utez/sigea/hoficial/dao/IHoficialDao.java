package mx.edu.utez.sigea.hoficial.dao;

import mx.edu.utez.sigea.hoficial.model.HOficial;
import mx.edu.utez.sigea.hoficial.model.Hora;

import java.util.List;

public interface IHoficialDao {

    List<Hora> obtenerHoras(int idDocente);


}
