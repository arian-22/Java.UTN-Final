package database;

import java.sql.Date;
import java.sql.PreparedStatement;
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
					+ "apellido, mail, contraseña, dni, fecha_nac, fecha_venc_licencia, direccion, telefono) "
					+ "values(?,?,?,?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, u.getNombre());
			stmt.setString(2, u.getApellido());
			stmt.setString(3, u.getMail());
			stmt.setString(4, u.getPassword());
			stmt.setInt(5, u.getDni());
			stmt.setString(6, u.getFechaNacimientoString());
			stmt.setString(7, u.getFechaVencimientoLicenciaString());
			stmt.setString(8, u.getDireccion());
			stmt.setString(9, u.getTelefono());

			
			stmt.execute();
			
			/*rs = stmt.getGeneratedKeys();
			if(rs!=null && rs.next()){
				u.setIdPersonaje(rs.getInt(1));
			}*/
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
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
		
		
	}
	
public Personaje getById(int id){
		
		Personaje p = null;
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT idPersonaje, nombre, vida, energia, defensa, evasion, puntosTotales FROM personajes WHERE idPersonaje = ?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			if(rs!=null && rs.next()){
				p = new Personaje();
				p.setIdPersonaje(rs.getInt("idPersonaje"));
				p.setNombre(rs.getString("nombre"));
				p.setVida(rs.getInt("vida"));
				p.setEnergia(rs.getInt("energia"));
				p.setDefensa(rs.getInt("defensa"));
				p.setEvasion(rs.getInt("evasion"));
				p.setPuntosTotales(rs.getInt("puntosTotales"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ApplicationException e) {
				e.errorDePuntajes();
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
	}
	
	
public Boolean getByNombre(String nombre){
				
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
