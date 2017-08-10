package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.Vehiculos;

public class DataVehiculos { 
	
	
	public Vehiculos getByPatente(String nroPatente){
	
	Vehiculos v = null;
	
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	try{
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT nro_patente, modelo, marca, tipo, imagen FROM vehículos WHERE nro_patente = ?");
		stmt.setString(1, nroPatente);
		rs = stmt.executeQuery();
					
		if(rs!=null && rs.next()){
			v = new Vehiculos();
			v.setPatente(rs.getString("nro_patente"));
			v.setModelo(rs.getString("modelo"));
			v.setMarca(rs.getString("marca"));
			v.setTipo(rs.getString("tipo"));
			v.setFoto(rs.getString("imagen"));
							
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
		System.out.println("El usuario estÃ¡ vacio en BD");
	}*/
	
	return v;
}

}


