package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.*;

public class DataUsuarios {
	
	public DataUsuarios(){
		
	}
	
	public void add(Usuario u){
		
		//ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("insert into Usuario(nombre, "
					+ "apellido, mail, contraseña, dni, fecha_nac, fecha_venc_licencia, direccion, telefono, admin) "
					+ "values(?,?,?,?,?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, u.getNombre());
			stmt.setString(2, u.getApellido());
			stmt.setString(3, u.getMail());
			stmt.setString(4, u.getPassword());
			stmt.setInt(5, u.getDni());
			stmt.setString(6, u.getFechaNacimientoString());
			stmt.setString(7, u.getFechaVencimientoLicenciaString());
			stmt.setString(8, u.getDireccion());
			stmt.setString(9, u.getTelefono());
			stmt.setString(10, u.getAdmin());
			
			stmt.execute();
			
			/*rs = stmt.getGeneratedKeys();
			if(rs!=null && rs.next()){
				u.setIdPersonaje(rs.getInt(1));
			}*/
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
	}
	
	public boolean authenticate(String email, String password) throws Exception 
    {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//boolean t = false;
		
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT * FROM Usuario "
				+ "WHERE mail = ? AND contraseña = ?");
		stmt.setString(1, email);
		stmt.setString(2, password);
		
        rs = stmt.executeQuery();
        
       /* if(rs!=null && rs.next()){
        	t = true;
        }else{
        	t = false;
        }*/
        
        return rs.next();
    }
	
	/*public void update(Usuario u){
		
		PreparedStatement stmt=null;
		
		try {
			stmt= FactoryConexion.getInstancia().getConn().prepareStatement("UPDATE personajes "
					+ "SET vida=?, energia=?, defensa=?, evasion=?, puntosTotales=? "
					+ "WHERE idPersonaje=?");
			
			stmt.setInt(1, u.getVida());
			stmt.setInt(2, u.getEnergia());
			stmt.setInt(3, u.getDefensa());
			stmt.setInt(4, u.getEvasion());
			stmt.setInt(5, u.getPuntosTotales());
			
			stmt.setInt(6, u.getIdPersonaje());
			
			stmt.execute();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(stmt!=null)stmt.close();
				FactoryConexion.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			
		}
	}
		
	}
	
	public void delete(Personaje p){
		
		
	}*/
	
	public Usuario getById(String mail){
		
		Usuario p = null;
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT nombre, apellido, mail, contraseña, dni, fecha_nac, fecha_venc_licencia, direccion, telefono, admin FROM Usuario WHERE mail = ?");
			stmt.setString(1, mail);
			rs = stmt.executeQuery();
						
			if(rs!=null && rs.next()){
				p = new Usuario();
				p.setNombre(rs.getString("nombre"));
				p.setApellido(rs.getString("apellido"));
				p.setMail(rs.getString("mail"));
				p.setPassword(rs.getString("contraseña"));
				p.setDni(rs.getInt("dni"));
				p.setFechaNacimiento(rs.getString("fecha_nac"));
				p.setFechaVencimientoLicencia(rs.getString("fecha_venc_licencia"));
				p.setDireccion(rs.getString("direccion"));
				p.setTelefono(rs.getString("telefono"));
				p.setAdmin(rs.getString("admin"));
								
				}else{
					System.out.println("La consulta no devuelve nada.");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				if(rs!=null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
				FactoryConexion.getInstancia().releaseConn();
		}
		
		/*if(p != null){
			System.out.println("Usuario en BD: " + p.getNombre() + " " + p.getApellido());
		}else{
			System.out.println("El usuario está vacio en BD");
		}*/
		
		return p;
	}
	
	
	/*public Boolean getByNombre(String nombre){
				
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		Boolean p = true;
		
		try{
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT nombre FROM personajes WHERE nombre like ?");
			stmt.setString(1, nombre);
			rs = stmt.executeQuery();
			
			if(rs!=null && rs.next()){
				p = false;
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
				if(rs!=null) {
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
				FactoryConexion.getInstancia().releaseConn();
		}
		
		
		return p;
	}*/
	
}
