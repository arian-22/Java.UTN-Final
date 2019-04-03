package negocio;

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
	
	public void registrarUsuario(Usuario u){
		DataUsuarios dbUsuario = new DataUsuarios();
		
		dbUsuario.add(u);
	}
	
	public boolean auntenticarUsuario(String mail, String pass){
		DataUsuarios dbUsuario = new DataUsuarios();
		boolean logueo = false;
		
		try {
			logueo = dbUsuario.authenticate(mail, pass);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return logueo;
		
	}

	public Usuario recuperarUsuario(String mail) {
		DataUsuarios dbUsuario = new DataUsuarios();
		Usuario user = new Usuario();
		
		user = dbUsuario.getById(mail);
		return user;
	}

	public void registrarVehiculos(Vehiculos v){
		DataVehiculos dbVehiculos = new DataVehiculos();
		
		dbVehiculos.add(v);
	}
	public void actualizarVehiculos(Vehiculos v, boolean seModificoPrecio){
		DataVehiculos dbVehiculos = new DataVehiculos();
		
		dbVehiculos.update(v, seModificoPrecio);
	}
	
	public Vehiculos recuperarVehiculo(String nroPatente) {
		DataVehiculos dbVehiculos = new DataVehiculos();
		Vehiculos vehiculo = new Vehiculos();
		
		vehiculo = dbVehiculos.getByPatente(nroPatente);
		return vehiculo;
	}
	public void eliminarVehiculo(String nroPatente) {
		DataVehiculos dbVehiculos = new DataVehiculos();
		
		dbVehiculos.delete(nroPatente);
	}
	
	public ArrayList<Vehiculos> getVehiculosPorTipo(String tipo) {
		DataVehiculos dv = new DataVehiculos();
		
		ArrayList<Vehiculos> vehiculos = dv.getAutosCamionetas(tipo);
		
		return vehiculos;
	} 
	
}
