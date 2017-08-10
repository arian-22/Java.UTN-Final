package database;

import java.sql.PreparedStatement;
import java.sql.SQLException;


import entidades.Vehiculos;

public class DataVehiculos {
	public DataVehiculos() {
	
	}
public void add(Vehiculos v){
		
		//ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("insert into vehículos(nro_patente, "
					+ "modelo, marca, cant_asientos, año, baul, transmision, km, tipo, estado,imagen) "
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

}
