package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

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
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT * FROM `cli-veh-alq` cva INNER JOIN usuario u ON cva.mail = u.mail INNER JOIN vehículos v ON cva.nro_patente = v.nro_patente INNER JOIN alquileres a ON cva.nro_alquiler = a.nro_alquiler INNER JOIN (SELECT va.nro_patente, max(va.fecha_desde) as 'fecha_max' FROM valores va group by va.nro_patente) pp on v.nro_patente = pp.nro_patente INNER JOIN valores val ON pp.nro_patente = val.nro_patente where cva.nro_alquiler = ? and fecha_max = val.fecha_desde group by cva.nro_alquiler");
			
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
				v.setKm(rs.getFloat("km"));
				v.setPrecio(rs.getFloat("precio_base"));;
				
				Alquiler a = new Alquiler();
		    	a.setNro_alquiler(rs.getInt("nro_alquiler"));
		    	a.setHora(rs.getDate("hora"));
		    	a.setFechaDesde(rs.getDate("fecha_desde"));
		    	a.setFechaHasta(rs.getDate("fecha_hasta"));
		    	a.setFechaCancelacion(rs.getDate("fecha_cancelacion"));
		    	a.setImporteCancelacion(rs.getFloat("importe_cancelacion"));
		    	a.setPrecioAlquiler(rs.getFloat("precio_alquiler"));
		    	
		    	
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
	}
		
	public int registrarAlquiler (String patenteVehiculo, String fecha_desde, String fecha_hasta, String mailUsuario, float precioAlquiler, int tarjetaCredito) {
		int nroAlquiler = 0;
		
		try{
			PreparedStatement stmt1 = null;
			PreparedStatement stmt2 = null;
			PreparedStatement stmt3 = null;
			ResultSet rs = null;
			
			System.out.println("Entro");
			
			FactoryConexion.getInstancia().getConn().setAutoCommit(false);
			
			String updateCreditCardUser = "UPDATE usuario SET nro_tarjeta = ? WHERE mail = ?";
			stmt1 = FactoryConexion.getInstancia().getConn().prepareStatement(updateCreditCardUser);
			stmt1.setInt(1, tarjetaCredito);
			stmt1.setString(2, mailUsuario);
			stmt1.execute();
						
			String insertNewAlquiler = "INSERT INTO alquileres (fecha_desde, fecha_hasta, precio_alquiler) VALUES (?, ?, ?)"; 
			stmt2 = FactoryConexion.getInstancia().getConn().prepareStatement(insertNewAlquiler, PreparedStatement.RETURN_GENERATED_KEYS);
			stmt2.setString(1, fecha_hasta);
			stmt2.setString(2, fecha_desde);
			stmt2.setFloat(3, precioAlquiler);
			stmt2.execute();
			
			rs = stmt2.getGeneratedKeys();
			if(rs!=null && rs.next()){
				nroAlquiler = rs.getInt(1);
				System.out.println("Nro. Alquiler: " + nroAlquiler);
			}
			
			String insertCLI_VEH_ALQ = "INSERT INTO `cli-veh-alq` (mail, nro_alquiler, nro_patente) VALUES (?, ?, ?)";
			stmt3 = FactoryConexion.getInstancia().getConn().prepareStatement(insertCLI_VEH_ALQ);
			stmt3.setString(1, mailUsuario);			
			stmt3.setInt(2, nroAlquiler);
			stmt3.setString(3, patenteVehiculo);
			stmt3.execute();
			
			FactoryConexion.getInstancia().getConn().commit();
			System.out.println("Commit");

		}
		catch (Exception e) {
			try {
				FactoryConexion.getInstancia().getConn().rollback();
				System.out.println("Rollback");

			} catch (SQLException e1) {
				System.out.println("Error :" + e1);			
			}
			System.out.println("Error: " + e);
		}
		finally {
			try {
				FactoryConexion.getInstancia().getConn().setAutoCommit(true);
			} catch (SQLException e2) {
				System.out.println("Finally error: " + e2);
			}
		}
		return nroAlquiler;
	}


}
