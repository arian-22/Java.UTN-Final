package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Vehiculos;

public class DataVehiculos { 
	
	
	public Vehiculos getByPatente(String nroPatente){
	
	Vehiculos v = null;
	
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	try{
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT nro_patente, modelo, marca, tipo, imagen FROM vehiculos WHERE nro_patente = ?");
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
		System.out.println("El usuario está vacio en BD");
	}*/
	
	return v;
}

	public void add(Vehiculos v){
			
			//ResultSet rs = null;
			PreparedStatement stmt = null;
			
			try {
				stmt = FactoryConexion.getInstancia().getConn().prepareStatement("insert into vehiculos(nro_patente, "
						+ "modelo, marca, cant_asientos, a�o, baul, transmision, km, tipo, estado,imagen) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
				stmt.setString(1, v.getPatente());
				stmt.setString(2, v.getModelo());
				stmt.setString(3, v.getMarca());
				stmt.setInt(4, v.getCantAsientos());
				stmt.setInt(5, v.getAnio());
				stmt.setString(6, v.getBaul());
				stmt.setString(7, v.getTransmision());
				stmt.setInt(8, v.getKm());
				stmt.setString(9, v.getTipo());
				stmt.setString(10, v.getEstado());
				stmt.setString(11, v.getFoto());
				stmt.execute();
				
				
	
				
				/*rs = stmt.getGeneratedKeys();
				if(rs!=null && rs.next()){
					u.setIdPersonaje(rs.getInt(1));
				}*/
				
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			
		}

	public ArrayList<Vehiculos> getVehiculos() {
		ArrayList<Vehiculos> vehiculos = new ArrayList<>();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT * FROM vehiculos");
	
		    rs = stmt.executeQuery();
		    
		    while(rs!=null && rs.next()){
		    	Vehiculos v = new Vehiculos();
		    	
		    	v.setPatente(rs.getString("nro_patente"));
				v.setModelo(rs.getString("modelo"));
				v.setMarca(rs.getString("marca"));
				v.setTipo(rs.getString("tipo"));
				v.setEstado(rs.getString("estado"));
				//v.setFoto(rs.getString("imagen"));
				
				vehiculos.add(v);
		    };
		    
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			FactoryConexion.getInstancia().releaseConn();
		}
		
	
	    
	    
	    return vehiculos;
	}
}


