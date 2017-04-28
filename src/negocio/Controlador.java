package negocio;

import database.DataUsuarios;
import entidades.Usuario;

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
	
}
