package database;

import java.sql.Date;
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
		    	u.setTelefono(rs.getString("telefono"));		    	
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
		    	a.setFechaDesde(rs.getDate("fecha_desde"));
		    	a.setFechaHasta(rs.getDate("fecha_hasta"));
		    	a.setFechaCancelacion(rs.getString("fecha_cancelacion"));
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
		      	u.setTelefono(rs.getString("telefono"));		    
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
		    	a.setFechaDesde(rs.getDate("fecha_desde"));
		    	a.setFechaHasta(rs.getDate("fecha_hasta"));
		    	a.setFechaCancelacion(rs.getString("fecha_cancelacion"));
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
		    	u.setTelefono(rs.getString("telefono"));
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
		    	a.setFechaDesde(rs.getDate("fecha_desde"));
		    	a.setFechaHasta(rs.getDate("fecha_hasta"));
		    	a.setFechaCancelacion(rs.getString("fecha_cancelacion"));
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
	
public Alquiler getByNroAlquilerACancelar(int nro_alquiler) {
		
		Alquiler a = new Alquiler();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT * FROM `alquileres` a where a.nro_alquiler = ?");
			
			stmt.setInt(1, nro_alquiler);
		    
			rs = stmt.executeQuery();
		    
		    while(rs!=null && rs.next()){		
				
	
		    	a.setNro_alquiler(rs.getInt("nro_alquiler"));		    	
		    	a.setFechaDesde(rs.getDate("fecha_desde"));
		    	a.setFechaHasta(rs.getDate("fecha_hasta"));
		    	a.setFechaCancelacion(rs.getString("fecha_cancelacion"));
		    	a.setImporteCancelacion(rs.getFloat("importe_cancelacion"));
		    	a.setPrecioAlquiler(rs.getFloat("precio_alquiler"));
		    
		    		    	
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
		return a;
		}
			
		public ArrayList<Cli_Veh_Alq> getByMail(String mail) {
			
			ArrayList<Cli_Veh_Alq> cvaList = new ArrayList<Cli_Veh_Alq>();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select a.nro_alquiler, fecha_desde, fecha_hasta, precio_alquiler, modelo, marca, km from `cli-veh-alq` cva inner join vehículos v on cva.nro_patente = v.nro_patente inner join alquileres a on cva.nro_alquiler = a.nro_alquiler where mail = ? order by fecha_desde asc");
			
			stmt.setString(1, mail);
		    
			rs = stmt.executeQuery();
		    
		    while(rs!=null && rs.next()){
	
		    	Cli_Veh_Alq cva = new Cli_Veh_Alq();
		    	
		    	Vehiculos v = new Vehiculos();
				v.setModelo(rs.getString("modelo"));
				v.setMarca(rs.getString("marca"));
				v.setMarca(rs.getString("km"));
			
				Alquiler a = new Alquiler();
		    	a.setNro_alquiler(rs.getInt("nro_alquiler"));
		    	a.setFechaDesde(rs.getDate("fecha_desde"));
		    	a.setFechaHasta(rs.getDate("fecha_hasta"));
		    	a.setPrecioAlquiler(rs.getFloat("precio_alquiler"));	  	
		    	
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
		return cvaList;}


		public void actualizarAlquiler(Alquiler alq) {			
			
			PreparedStatement stmt = null;
			
			try {
				stmt = FactoryConexion.getInstancia().getConn().prepareStatement("update alquileres set fecha_desde=?, fecha_hasta=?, importe_cancelacion=?, fecha_cancelacion=?, precio_alquiler=?"
					+ "where nro_alquiler=?");
			
				stmt.setDate(1, alq.getFechaDesde());
				stmt.setDate(2, alq.getFechaHasta());
				stmt.setFloat(3, alq.getImporteCancelacion());
				stmt.setString(4, alq.getFechaCancelacion());
				stmt.setFloat(5, alq.getPrecioAlquiler());
				
				stmt.setInt(6, alq.getNro_alquiler());
				
				stmt.execute();
				System.out.println("update");
														
			} catch (SQLException e) {
				System.out.println(e);
				
			} finally {
				FactoryConexion.getInstancia().releaseConn();
			}
			
		}
		


}
