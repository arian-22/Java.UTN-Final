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
}
