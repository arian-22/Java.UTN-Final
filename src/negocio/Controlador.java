package negocio;

import java.sql.SQLException;
import java.util.ArrayList;

import database.DataUsuarios;
import entidades.Usuario;
import entidades.Vehiculos;
import database.DataVehiculos;
public class Controlador {
	
	private Usuario usuario;

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public void registrarUsuario(Usuario u) throws SQLException{
		DataUsuarios dbUsuario = new DataUsuarios();
		
		dbUsuario.add(u);
	}
	
	public boolean auntenticarUsuario(String mail, String pass) throws SQLException{
		DataUsuarios dbUsuario = new DataUsuarios();
		boolean logueo = false;
		
		logueo = dbUsuario.authenticate(mail, pass);
		
		return logueo;
	}

	public Usuario recuperarUsuario(String mail) throws SQLException {
		DataUsuarios dbUsuario = new DataUsuarios();
		Usuario user = new Usuario();
		
		user = dbUsuario.getById(mail);
		return user;
	}

	public void registrarVehiculos(Vehiculos v) throws SQLException {
		DataVehiculos dbVehiculos = new DataVehiculos();
		
		dbVehiculos.add(v);
	}
	public void actualizarVehiculos(Vehiculos v, boolean seModificoPrecio) throws SQLException {
		DataVehiculos dbVehiculos = new DataVehiculos();
		
		dbVehiculos.update(v, seModificoPrecio);
		
	}
	
	public Vehiculos recuperarVehiculo(String nroPatente) throws SQLException {
		DataVehiculos dbVehiculos = new DataVehiculos();
		Vehiculos vehiculo = new Vehiculos();
		
		vehiculo = dbVehiculos.getByPatente(nroPatente);
		return vehiculo;
	}
	public void eliminarVehiculo(String nroPatente) throws SQLException {
		DataVehiculos dbVehiculos = new DataVehiculos();
		
		dbVehiculos.delete(nroPatente);
	}
	
	public ArrayList<Vehiculos> getVehiculosPorTipo(String tipo) throws SQLException {
		DataVehiculos dv = new DataVehiculos();
		
		ArrayList<Vehiculos> vehiculos = dv.getVehiculosPorTipo(tipo);
		
		return vehiculos;
	} 
	
}
