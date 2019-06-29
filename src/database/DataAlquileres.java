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

	public ArrayList<Cli_Veh_Alq> getVehiculosAlquilados() throws SQLException {
		
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
			throw e;
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
	
	
	public ArrayList<Cli_Veh_Alq> getVehiculosAlquiladosActualmente() throws SQLException {
		
		ArrayList<Cli_Veh_Alq> cvaList = new ArrayList<Cli_Veh_Alq>();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT * FROM `cli-veh-alq` cva INNER JOIN usuario u ON cva.mail = u.mail INNER JOIN vehículos v ON cva.nro_patente = v.nro_patente INNER JOIN alquileres a ON cva.nro_alquiler = a.nro_alquiler where estado = 'En uso' AND fecha_cancelacion is null AND fecha_finalizacion is null AND (curdate() between fecha_desde AND fecha_hasta)");
	
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
		    }
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
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
	

	public ArrayList<Cli_Veh_Alq> getVehiculosADevolverHoy() throws SQLException {
		ArrayList<Cli_Veh_Alq> cvaList = new ArrayList<Cli_Veh_Alq>();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT * FROM `cli-veh-alq` cva \n" + 
					"INNER JOIN usuario u ON cva.mail = u.mail \n" + 
					"INNER JOIN vehículos v ON cva.nro_patente = v.nro_patente \n" + 
					"INNER JOIN alquileres a ON cva.nro_alquiler = a.nro_alquiler \n" + 
					"INNER JOIN (SELECT va.nro_patente, max(va.fecha_desde) as 'fecha_max' \n" + 
					"			FROM valores va group by va.nro_patente) pp on v.nro_patente = pp.nro_patente \n" + 
					"INNER JOIN valores val ON pp.nro_patente = val.nro_patente \n" + 
					"where fecha_max = val.fecha_desde and fecha_cancelacion is null and fecha_finalizacion is null and curdate() = a.fecha_hasta");
	
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
			throw e;
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

	
	public Alquiler getByNroAlquilerACancelar(int nro_alquiler) throws SQLException {
		
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
			throw e;
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
	
			
	public ArrayList<Cli_Veh_Alq> getAlquileresCliente(String mail) throws SQLException {
			
		ArrayList<Cli_Veh_Alq> cvaList = new ArrayList<Cli_Veh_Alq>();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select a.nro_alquiler, fecha_desde, fecha_hasta,fecha_cancelacion, fecha_finalizacion, precio_alquiler, modelo, marca, km from `cli-veh-alq` cva inner join vehículos v on cva.nro_patente = v.nro_patente inner join alquileres a on cva.nro_alquiler = a.nro_alquiler where mail = ? order by fecha_desde desc");
			
			stmt.setString(1, mail);
		    
			rs = stmt.executeQuery();
		    
		    while(rs!=null && rs.next()){
	
		    	Cli_Veh_Alq cva = new Cli_Veh_Alq();
		    	
		    	Vehiculos v = new Vehiculos();
				v.setModelo(rs.getString("modelo"));
				v.setMarca(rs.getString("marca"));
				v.setKm(rs.getFloat("km"));
			
				Alquiler a = new Alquiler();
		    	a.setNro_alquiler(rs.getInt("nro_alquiler"));
		    	a.setFechaDesde(rs.getDate("fecha_desde"));
		    	a.setFechaHasta(rs.getDate("fecha_hasta"));
		    	a.setFechaCancelacion(rs.getString("fecha_cancelacion"));
		    	a.setPrecioAlquiler(rs.getFloat("precio_alquiler"));	
		    	a.setFechaFinalizacion(rs.getString("fecha_finalizacion"));
		    	
		    	cva.setVehiculo(v);
		    	cva.setAlquiler(a);
		    	
		    	cvaList.add(cva); 	
		    }
		   }catch (SQLException e) {
			
			e.printStackTrace();
			throw e;
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
		
		
	public Cli_Veh_Alq getAlquilerARetirar(int dni) throws SQLException {
			
		Cli_Veh_Alq cva = new Cli_Veh_Alq();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("select * from usuario u inner join `cli-veh-alq` cva on u.mail = cva.mail inner join vehículos v on cva.nro_patente = v.nro_patente inner join alquileres a on cva.nro_alquiler = a.nro_alquiler where dni = ? and fecha_desde = CURDATE() and fecha_cancelacion is null and fecha_finalizacion is null and estado <> 'En uso'");
			
			stmt.setInt(1, dni);
		    
			rs = stmt.executeQuery();
		    
		    while(rs!=null && rs.next()){
		    	
		    	Usuario u = new Usuario();
		    	u.setMail(rs.getString("mail"));
		    	u.setDni(rs.getInt("dni"));
		    	u.setNombre(rs.getString("nombre"));
		    	u.setApellido(rs.getString("apellido"));
		    	
		    	Vehiculos v = new Vehiculos();
		    	v.setPatente(rs.getString("nro_patente"));
				v.setModelo(rs.getString("modelo"));
				v.setMarca(rs.getString("marca"));
				v.setTransmision(rs.getString("transmision"));
			
				Alquiler a = new Alquiler();
		    	a.setNro_alquiler(rs.getInt("nro_alquiler"));
		    	a.setFechaDesde(rs.getDate("fecha_desde"));
		    	a.setFechaHasta(rs.getDate("fecha_hasta"));
		    	a.setFechaCancelacion(rs.getString("fecha_cancelacion"));
		    	a.setFechaFinalizacion(rs.getString("fecha_finalizacion"));
		    	
		    	cva.setVehiculo(v);
		    	cva.setAlquiler(a);
		    	cva.setCliente(u);
		    };
		    
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw e;
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
		return cva;}
	
	
	public Cli_Veh_Alq getAlquilerADevolver(String nro_patente) throws SQLException {
		
		Cli_Veh_Alq cva = new Cli_Veh_Alq();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT * FROM `cli-veh-alq` cva INNER JOIN usuario u ON cva.mail = u.mail INNER JOIN vehículos v ON cva.nro_patente = v.nro_patente INNER JOIN alquileres a ON cva.nro_alquiler = a.nro_alquiler INNER JOIN (SELECT va.nro_patente, max(va.fecha_desde) as 'fecha_max' FROM valores va group by va.nro_patente) pp on v.nro_patente = pp.nro_patente INNER JOIN valores val ON pp.nro_patente = val.nro_patente where cva.nro_patente = ? and fecha_max = val.fecha_desde and fecha_cancelacion is null and fecha_finalizacion is null and curdate() > a.fecha_desde");
			
			stmt.setString(1, nro_patente);
		    
			rs = stmt.executeQuery();
		    
		    while(rs!=null && rs.next()){
		
		    	Usuario u = new Usuario();
		    	u.setMail(rs.getString("mail"));
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
		    }
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
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


	public void actualizarAlquiler(Alquiler alq) throws SQLException {			
			
			PreparedStatement stmt = null;
			
			try {
				stmt = FactoryConexion.getInstancia().getConn().prepareStatement("update alquileres set fecha_desde=?, fecha_hasta=?, importe_cancelacion=?, fecha_cancelacion=?, precio_alquiler=?, fecha_finalizacion=?, precio_final_alquiler=? where nro_alquiler=?");
			
				stmt.setDate(1, alq.getFechaDesde());
				stmt.setDate(2, alq.getFechaHasta());
				stmt.setFloat(3, alq.getImporteCancelacion());
				stmt.setString(4, alq.getFechaCancelacion());
				stmt.setFloat(5, alq.getPrecioAlquiler());
				stmt.setString(6, alq.getFechaFinalizacion());
				stmt.setFloat(7, alq.getPrecioFinalAlquiler());
				
				stmt.setInt(8, alq.getNro_alquiler());
				
				stmt.execute();
														
			} catch (SQLException e) {
				throw e;
				
			} finally {
				FactoryConexion.getInstancia().releaseConn();
			}
			
		}
	
		
	public int registrarAlquiler (String patenteVehiculo, String fecha_desde, String fecha_hasta, String mailUsuario, float precioAlquiler, String tarjetaCredito) throws SQLException {
		int nroAlquiler = 0;
		
		try{
			PreparedStatement stmt1 = null;
			PreparedStatement stmt2 = null;
			PreparedStatement stmt3 = null;
			ResultSet rs = null;
						
			FactoryConexion.getInstancia().getConn().setAutoCommit(false);
			
			String updateCreditCardUser = "UPDATE usuario SET nro_tarjeta = ? WHERE mail = ?";
			stmt1 = FactoryConexion.getInstancia().getConn().prepareStatement(updateCreditCardUser);
			stmt1.setString(1, tarjetaCredito);
			stmt1.setString(2, mailUsuario);
			stmt1.execute();
						
			String insertNewAlquiler = "INSERT INTO alquileres (fecha_desde, fecha_hasta, precio_alquiler) VALUES (?, ?, ?)"; 
			stmt2 = FactoryConexion.getInstancia().getConn().prepareStatement(insertNewAlquiler, PreparedStatement.RETURN_GENERATED_KEYS);
			stmt2.setString(1, fecha_desde);
			stmt2.setString(2, fecha_hasta);
			stmt2.setFloat(3, precioAlquiler);
			stmt2.execute();
			
			rs = stmt2.getGeneratedKeys();
			if(rs!=null && rs.next()){
				nroAlquiler = rs.getInt(1);
			}
			
			String insertCLI_VEH_ALQ = "INSERT INTO `cli-veh-alq` (mail, nro_alquiler, nro_patente) VALUES (?, ?, ?)";
			stmt3 = FactoryConexion.getInstancia().getConn().prepareStatement(insertCLI_VEH_ALQ);
			stmt3.setString(1, mailUsuario);			
			stmt3.setInt(2, nroAlquiler);
			stmt3.setString(3, patenteVehiculo);
			stmt3.execute();
			
			FactoryConexion.getInstancia().getConn().commit();

		}
		catch (Exception e) {
			try {
				FactoryConexion.getInstancia().getConn().rollback();
			} catch (SQLException e1) {
				throw e1;
			}
		}
		finally {
			try {
				FactoryConexion.getInstancia().getConn().setAutoCommit(true);
			} catch (SQLException e2) {
				throw e2;
			}
		}
		return nroAlquiler;
	}

}
