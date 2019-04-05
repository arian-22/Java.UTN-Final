package database;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Vehiculos;
import utils.ApplicationExceptions;

public class DataVehiculos { 
	
	
	public Vehiculos getByPatente(String nroPatente){	
		
	Vehiculos v = null;
	
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	try{
		stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT v.nro_patente, v.modelo, v.marca, v.cant_asientos, v.año, v.transmision, v.estado, v.baul, v.tipo, v.imagen, v.km, va.precio_base FROM vehículos v INNER JOIN valores va  on v.nro_patente = va.nro_patente where v.nro_patente = ? and va.fecha_desde = (SELECT Max(vv.fecha_desde) from valores vv where nro_patente = ?) ");
		stmt.setString(1, nroPatente);
		stmt.setString(2, nroPatente);
		
		rs = stmt.executeQuery();
					
		if(rs!=null && rs.next()){
			v = new Vehiculos();
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
			v.setKm(rs.getInt("km"));
			v.setPrecio(rs.getFloat("precio_base"));
			
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
		return v;
	}

	public void add(Vehiculos v) throws SQLException {
			
			PreparedStatement stmt = null;
			
			try {
				stmt = FactoryConexion.getInstancia().getConn().prepareStatement("insert into vehículos(nro_patente, "
						+ "modelo, marca, cant_asientos, año, transmision, estado, baul, tipo, imagen, km) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?)", PreparedStatement.RETURN_GENERATED_KEYS);
				stmt.setString(1, v.getPatente());
				stmt.setString(2, v.getModelo());
				stmt.setString(3, v.getMarca());
				stmt.setInt(4, v.getCantAsientos());
				stmt.setInt(5, v.getAnio());
				stmt.setString(6, v.getTransmision());
				stmt.setString(7, v.getEstado());
				stmt.setString(8, v.getBaul());
				stmt.setString(9, v.getTipo());
				stmt.setString(10, v.getImagen());
				stmt.setFloat(11, v.getKm());
				stmt.execute();
				
				stmt = FactoryConexion.getInstancia().getConn().prepareStatement("insert into valores(nro_patente, fecha_desde, precio_base) values(?,?,?)");
				stmt.setString(1, v.getPatente());
				
				java.util.Date d = new java.util.Date();
				Date fechaActual = new java.sql.Date(d.getTime());
				
				stmt.setDate(2, (Date) fechaActual);
				stmt.setFloat(3, v.getPrecio());
				stmt.execute();

				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Hubo un problema. --DataVehiculos");
				
				throw e;
				
			} finally {
				
				FactoryConexion.getInstancia().releaseConn();
			}
			
		}
	public void delete(String nroPatente) {
		
		PreparedStatement stmt = null;
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("DELETE FROM vehículos WHERE nro_patente = ?");
			stmt.setString(1, nroPatente);
			stmt.execute();
		}catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			FactoryConexion.getInstancia().releaseConn();
		}
		
	}

	public ArrayList<Vehiculos> getVehiculos() {
		ArrayList<Vehiculos> vehiculos = new ArrayList<>();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT * FROM vehículos");
	
		    rs = stmt.executeQuery();
		    
		    while(rs!=null && rs.next()){
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

	public ArrayList<Vehiculos> getVehiculosDisponiblesParaAlquilar(String fechaDesde, String fechaHasta) {
		ArrayList<Vehiculos> vehiculos = new ArrayList<>();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
				
		try {

			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT v.nro_patente, v.modelo, v.marca, v.cant_asientos, v.año, v.transmision, v.estado, v.baul, v.tipo, v.imagen, v.km, pp.precio_base, pp.fecha_max\n" + 
					"FROM vehículos v \n" + 
					"INNER JOIN (\n" + 
					"	SELECT aa.nro_patente, aa.precio_base, max(aa.fecha_desde) as 'fecha_max'\n" + 
					"    FROM valores aa\n" + 
					"    group by aa.nro_patente) pp on v.nro_patente=pp.nro_patente\n" + 
					"WHERE v.nro_patente NOT IN (\n" + 
					"	SELECT DISTINCT v.nro_patente \n" + 
					"	FROM vehículos v \n" + 
					"	INNER JOIN `cli-veh-alq` cva ON v.nro_patente = cva.nro_patente \n" + 
					"	INNER JOIN usuario u ON cva.mail = u.mail \n" + 
					"	INNER JOIN alquileres a ON cva.nro_alquiler = a.nro_alquiler \n" + 
					"	WHERE 	((DATE_ADD(a.fecha_desde, INTERVAL -1 DAY) <= ? and DATE_ADD(a.fecha_hasta, INTERVAL 1 DAY) >= ?) or	\n" + 
								"(DATE_ADD(a.fecha_desde, INTERVAL -1 DAY) <= ? and DATE_ADD(a.fecha_hasta, INTERVAL 1 DAY) >= ?) or \n" + 
								"((? between DATE_ADD(a.fecha_desde, INTERVAL -1 DAY) and DATE_ADD(a.fecha_hasta, INTERVAL 1 DAY)) and (? between DATE_ADD(a.fecha_desde, INTERVAL -1 DAY) and DATE_ADD(a.fecha_hasta, INTERVAL 1 DAY))) or \n" + 
								"((DATE_ADD(a.fecha_desde, INTERVAL -1 DAY) <= ?) and (DATE_ADD(a.fecha_hasta, INTERVAL 1 DAY) >= ?))) \n" + 
								"and a.fecha_cancelacion is null) \n" +
					"ORDER BY v.nro_patente" );
			
			stmt.setString(1, fechaDesde);
			stmt.setString(2, fechaDesde);
			stmt.setString(3, fechaHasta);
			stmt.setString(4, fechaHasta);
			stmt.setString(5, fechaDesde);
			stmt.setString(6, fechaHasta);
			stmt.setString(7, fechaDesde);
			stmt.setString(8, fechaHasta);
			rs = stmt.executeQuery();
		    
		    while(rs!=null && rs.next()){
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
				v.setPrecio(rs.getFloat("precio_base"));
				
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

	public void update(Vehiculos v, boolean seModificoPrecio) {
		PreparedStatement stmt = null;
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("update vehículos set modelo=?, marca=?, cant_asientos=?, año=?, baul=?, transmision=?, km=?, tipo=?, estado=?,imagen=? where nro_patente=?");
		
			stmt.setString(1, v.getModelo());
			stmt.setString(2, v.getMarca());
			stmt.setInt(3, v.getCantAsientos());
			stmt.setInt(4, v.getAnio());
			stmt.setString(5, v.getBaul());
			stmt.setString(6, v.getTransmision());
			stmt.setFloat(7, v.getKm());
			stmt.setString(8, v.getTipo());
			stmt.setString(9, v.getEstado());
			stmt.setString(10, v.getImagen());
		
			stmt.setString(11, v.getPatente());
			
			stmt.execute();
			
			if(seModificoPrecio)
			{	stmt = FactoryConexion.getInstancia().getConn().prepareStatement("insert into valores(nro_patente, fecha_desde, precio_base) values(?,?,?)");
				stmt.setString(1, v.getPatente());
						
				java.util.Date d = new java.util.Date();
				Date fechaActual = new java.sql.Date(d.getTime());
				
				stmt.setDate(2, (Date) fechaActual);
				stmt.setFloat(3, v.getPrecio());
				stmt.execute();
			}	
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			FactoryConexion.getInstancia().releaseConn();
		}
		
	}
	
	public ArrayList<Vehiculos> getAutosCamionetas(String tipo) {
		ArrayList<Vehiculos> vehiculos = new ArrayList<>();
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		try {
			stmt = FactoryConexion.getInstancia().getConn().prepareStatement("SELECT * FROM vehículos where tipo = ?");
			stmt.setString(1, tipo);
		    rs = stmt.executeQuery();
		    
		    while(rs!=null && rs.next()){
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


