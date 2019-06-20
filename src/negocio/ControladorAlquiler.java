package negocio;

import java.sql.SQLException;
import java.util.ArrayList;
import database.DataAlquileres;
import database.DataVehiculos;

import entidades.Vehiculos;
import entidades.Alquiler;
import entidades.Cli_Veh_Alq;

public class ControladorAlquiler {
	
	private ArrayList<Vehiculos> vehiculos;
	
	public ArrayList<Vehiculos> getVehiculos() {
		return vehiculos;
	}

	public void setVehiculos(ArrayList<Vehiculos> vehiculos) {
		this.vehiculos = vehiculos;
	}
	
	public int getValidaReservasCliente(String mail, String fechaDesde, String fechaHasta) throws SQLException{
		
		DataVehiculos dv = new DataVehiculos();
		
		return dv.getValidaReservasCliente(mail, fechaDesde, fechaHasta);
	}
	
	public ArrayList<Vehiculos> getStockVehiculosDisponiblesParaAlquilar(String fechaDesde, String fechaHasta) throws SQLException {
		
		DataVehiculos dv = new DataVehiculos();
		
		vehiculos = dv.getVehiculosDisponiblesParaAlquilar(fechaDesde, fechaHasta);
		
		return vehiculos;
	}

	public Cli_Veh_Alq buscarAlquilerADevolver(String nro_patente) throws SQLException {
		
		DataAlquileres dbAlquileres = new DataAlquileres();
		
		Cli_Veh_Alq alquiler = new Cli_Veh_Alq();
		
		alquiler = dbAlquileres.getAlquilerADevolver(nro_patente);
		
		return alquiler;
	}
	
	public Cli_Veh_Alq buscarAlquilerARetirar(int dni) throws SQLException {
		
		DataAlquileres dbAlquileres = new DataAlquileres();
		
		Cli_Veh_Alq alquiler = new Cli_Veh_Alq();
		
		alquiler = dbAlquileres.getAlquilerARetirar(dni);
		
		return alquiler;
	}
	
	 public Alquiler buscarAlquilerACancelar(int nro_alquiler) throws SQLException {
			
		DataAlquileres dbAlquileres = new DataAlquileres();		
			
		Alquiler alquiler= new Alquiler();		
			
		alquiler = dbAlquileres.getByNroAlquilerACancelar(nro_alquiler);
			
		return alquiler;
	}
	
	public ArrayList<Cli_Veh_Alq> buscarAlquileresDelCliente(String mail) throws SQLException {
		
		DataAlquileres dbAlquileres = new DataAlquileres();
		
		ArrayList<Cli_Veh_Alq> alquileres = new ArrayList<Cli_Veh_Alq>();
		
		alquileres = dbAlquileres.getAlquileresCliente(mail);		
				
		return alquileres;
	}

	public void actualizarAlquiler(Alquiler alq) throws SQLException {
		DataAlquileres alquiler = new DataAlquileres();
		
		alquiler.actualizarAlquiler(alq);
		
	}
	
	public int registrarAlquiler(String patenteVehiculo, String fecha_desde, String fecha_hasta, String mailUsuario, float precioAlquiler, String tarjetaCredito) throws SQLException {
		
		DataAlquileres dataAlquileres = new DataAlquileres();
		
		int nroAlquiler;
		
		nroAlquiler = dataAlquileres.registrarAlquiler(patenteVehiculo, fecha_desde, fecha_hasta, mailUsuario, precioAlquiler, tarjetaCredito);
		
		return nroAlquiler;
	}
	


}
