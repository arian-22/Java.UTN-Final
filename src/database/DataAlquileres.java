package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Alquiler;
import entidades.Cli_Veh_Alq;
import entidades.Usuario;
import entidades.Vehiculos;

public class DataAlquileres {

	public ArrayList<Cli_Veh_Alq> getVehiculosAlquilados() {
		
		ArrayList<Cli_Veh_Alq> cvaList = new ArrayList<Cli_Veh_Alq>();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT * FROM `cli-veh-alq` cva INNER JOIN usuario u ON cva.mail = u.mail INNER JOIN vehículos v ON cva.nro_patente = v.nro_patente INNER JOIN alquileres a ON cva.nro_alquiler = a.nro_alquiler");
	
		    rs = stmt.executeQuery();
		    
		    while(rs!=null && rs.next()){
		    	Cli_Veh_Alq cva = new Cli_Veh_Alq();
		
		    	Usuario u = new Usuario();
		    	u.setMail(rs.getString("mail"));
		    	u.setPassword(rs.getString("contraseña"));
		    	u.setDni(rs.getInt("dni"));
		    	u.setNombre(rs.getString("nombre"));
		    	u.setApellido(rs.getString("apellido"));
		    	u.setDireccion(rs.getString("direccion"));
		    	//u.setFechaNacimiento(rs.getDate("fecha_nac"));
		    	u.setTelefono(rs.getString("telefono"));
		    	//u.setFechaVencimientoLicencia(rs.getDate("fecha_venc_licencia"));
		    	u.setNro_tarjeta(rs.getString("nro_tarjeta"));
		    	u.setAdmin(rs.getString("admin"));
		    	
		    	
		    	Vehiculos v = new Vehiculos();
		    	v.setPatente(rs.getString("nro_patente"));
				v.setModelo(rs.getString("modelo"));
				v.setMarca(rs.getString("marca"));
				v.setCantAsientos(rs.getInt("cant_asientos"));
				v.setAnio(rs.getInt("año"));
				v.setTransmision(rs.getString("transmision"));
				v.setEstado(rs.getString("estado"));
				v.setBaul(rs.getString("baul"));
				v.setTipo(rs.getString("tipo"));
				v.setImagen(rs.getString("imagen"));
				v.setKm(rs.getFloat("km"));
				
		    	Alquiler a = new Alquiler();
		    	a.setNro_alquiler(rs.getInt("nro_alquiler"));
		    	a.setHora(rs.getDate("hora"));
		    	a.setFechaDesde(rs.getDate("fecha_desde"));
		    	a.setFechaHasta(rs.getDate("fecha_hasta"));
		    	a.setFechaCancelacion(rs.getDate("fecha_cancelacion"));
		    	a.setImporteCancelacion(rs.getFloat("importe_cancelacion"));
		    	
		    	cva.setCliente(u);
		    	cva.setVehiculo(v);
		    	cva.setAlquiler(a);
		    	
		    	cvaList.add(cva);
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
	   
	    return cvaList;
	}
	
	
	public ArrayList<Cli_Veh_Alq> getVehiculosAlquiladosActualmente() {
		
		ArrayList<Cli_Veh_Alq> cvaList = new ArrayList<Cli_Veh_Alq>();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT * FROM `cli-veh-alq` cva INNER JOIN usuario u ON cva.mail = u.mail INNER JOIN vehículos v ON cva.nro_patente = v.nro_patente INNER JOIN alquileres a ON cva.nro_alquiler = a.nro_alquiler where estado = 'En uso'");
	
		    rs = stmt.executeQuery();
		    
		    while(rs!=null && rs.next()){
		    	Cli_Veh_Alq cva = new Cli_Veh_Alq();
		
		    	Usuario u = new Usuario();
		    	u.setMail(rs.getString("mail"));
		    	u.setPassword(rs.getString("contraseña"));
		    	u.setDni(rs.getInt("dni"));
		    	u.setNombre(rs.getString("nombre"));
		    	u.setApellido(rs.getString("apellido"));
		    	u.setDireccion(rs.getString("direccion"));
		    	//u.setFechaNacimiento(rs.getDate("fecha_nac"));
		    	u.setTelefono(rs.getString("telefono"));
		    	//u.setFechaVencimientoLicencia(rs.getDate("fecha_venc_licencia"));
		    	u.setNro_tarjeta(rs.getString("nro_tarjeta"));
		    	u.setAdmin(rs.getString("admin"));
		    	
		    	
		    	Vehiculos v = new Vehiculos();
		    	v.setPatente(rs.getString("nro_patente"));
				v.setModelo(rs.getString("modelo"));
				v.setMarca(rs.getString("marca"));
				v.setCantAsientos(rs.getInt("cant_asientos"));
				v.setAnio(rs.getInt("año"));
				v.setTransmision(rs.getString("transmision"));
				v.setEstado(rs.getString("estado"));
				v.setBaul(rs.getString("baul"));
				v.setTipo(rs.getString("tipo"));
				v.setImagen(rs.getString("imagen"));
				v.setKm(rs.getFloat("km"));
				
		    	Alquiler a = new Alquiler();
		    	a.setNro_alquiler(rs.getInt("nro_alquiler"));
		    	a.setHora(rs.getDate("hora"));
		    	a.setFechaDesde(rs.getDate("fecha_desde"));
		    	a.setFechaHasta(rs.getDate("fecha_hasta"));
		    	a.setFechaCancelacion(rs.getDate("fecha_cancelacion"));
		    	a.setImporteCancelacion(rs.getFloat("importe_cancelacion"));
		    	
		    	cva.setCliente(u);
		    	cva.setVehiculo(v);
		    	cva.setAlquiler(a);
		    	
		    	cvaList.add(cva);
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
		
	    return cvaList;
	}


	public Cli_Veh_Alq getByNroAlquiler(int nro_alquiler) {
		
		Cli_Veh_Alq cva = new Cli_Veh_Alq();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT * FROM `cli-veh-alq` cva INNER JOIN usuario u ON cva.mail = u.mail INNER JOIN vehículos v ON cva.nro_patente = v.nro_patente INNER JOIN alquileres a ON cva.nro_alquiler = a.nro_alquiler where cva.nro_alquiler = ?");
			stmt.setInt(1, nro_alquiler);
		    rs = stmt.executeQuery();
		    
		    while(rs!=null && rs.next()){
		
		    	Usuario u = new Usuario();
		    	u.setMail(rs.getString("mail"));
		    	u.setPassword(rs.getString("contraseña"));
		    	u.setDni(rs.getInt("dni"));
		    	u.setNombre(rs.getString("nombre"));
		    	u.setApellido(rs.getString("apellido"));
		    	u.setDireccion(rs.getString("direccion"));
		    	//u.setFechaNacimiento(rs.getDate("fecha_nac"));
		    	u.setTelefono(rs.getString("telefono"));
		    	//u.setFechaVencimientoLicencia(rs.getDate("fecha_venc_licencia"));
		    	u.setNro_tarjeta(rs.getString("nro_tarjeta"));
		    	u.setAdmin(rs.getString("admin"));
		    	
		    	
		    	Vehiculos v = new Vehiculos();
		    	v.setPatente(rs.getString("nro_patente"));
				v.setModelo(rs.getString("modelo"));
				v.setMarca(rs.getString("marca"));
				v.setCantAsientos(rs.getInt("cant_asientos"));
				v.setAnio(rs.getInt("año"));
				v.setTransmision(rs.getString("transmision"));
				v.setEstado(rs.getString("estado"));
				v.setBaul(rs.getString("baul"));
				v.setTipo(rs.getString("tipo"));
				v.setImagen(rs.getString("imagen"));
				v.setKm(rs.getFloat("km"));
				
		    	Alquiler a = new Alquiler();
		    	a.setNro_alquiler(rs.getInt("nro_alquiler"));
		    	a.setHora(rs.getDate("hora"));
		    	a.setFechaDesde(rs.getDate("fecha_desde"));
		    	a.setFechaHasta(rs.getDate("fecha_hasta"));
		    	a.setFechaCancelacion(rs.getDate("fecha_cancelacion"));
		    	a.setImporteCancelacion(rs.getFloat("importe_cancelacion"));
		    	
		    	
		    	cva.setVehiculo(v);
		    	cva.setAlquiler(a);
		    	cva.setCliente(u);
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
		return cva;
		
		
		
		/*try{
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT *  FROM alquileres WHERE nro_alquiler = ?");
			stmt.setInt(1, nro_alquiler);
			rs = stmt.executeQuery();
						
			if(rs!=null && rs.next()){
				a = new Alquiler();
				a.setNro_alquiler(rs.getInt("nro_alquiler"));
				a.setHora(rs.getDate("hora"));
				a.setFechaDesde(rs.getDate("fecha_desde"));
				a.setFechaHasta(rs.getDate("fecha_hasta"));
				a.setFechaCancelacion(rs.getDate("fecha_cancelacion"));
				a.setImporteCancelacion(rs.getFloat("importe_cancelacion"));
							
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
		
		return a;*/
	}
		


}
