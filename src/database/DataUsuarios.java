package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.*;

public class DataUsuarios {
	
	public DataUsuarios(){
		
	}
	
	public void add(Usuario u) throws SQLException{		
		
		PreparedStatement stmt = null;
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("insert into usuario(nombre, "
					+ "apellido, mail, contraseña, dni, fecha_nac, fecha_venc_licencia, direccion, telefono, admin) "
					+ "values(?,?,?,?,?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, u.getNombre());
			stmt.setString(2, u.getApellido());
			stmt.setString(3, u.getMail());
			stmt.setString(4, u.getPassword());
			stmt.setInt(5, u.getDni());
			stmt.setString(6, u.getFechaNacimiento());
			stmt.setString(7, u.getFechaVencimientoLicencia());
			stmt.setString(8, u.getDireccion());
			stmt.setString(9, u.getTelefono());
			stmt.setString(10, u.getAdmin());
			
			stmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} 
	}
	
	public boolean authenticate(String email, String password) throws SQLException{
    
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT * FROM usuario "
					+ "WHERE mail = ? AND contraseña = ?");
			stmt.setString(1, email);
			stmt.setString(2, password);
			
	        rs = stmt.executeQuery();
	        
	        if(rs!=null && rs.next()){
	        	return true;
	        }else{
				throw new SQLException("Usuario Inexistente, mail y/o contraseña incorrectos");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
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
    }
	
	public Usuario getById(String mail) throws SQLException{
		
		Usuario p = null;
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT nombre, apellido, mail, contraseña, dni, fecha_nac, fecha_venc_licencia, direccion, telefono, admin FROM usuario WHERE mail = ?");
			stmt.setString(1, mail);
			rs = stmt.executeQuery();
						
			while(rs!=null && rs.next()){
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
				}
			} catch (SQLException e) {
				throw e;
			} finally{
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

}

