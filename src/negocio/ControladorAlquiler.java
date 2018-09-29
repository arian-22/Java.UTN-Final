package negocio;

import java.util.ArrayList;
import java.util.Date;

import database.DataAlquileres;
import database.DataVehiculos;

import entidades.Vehiculos;
import entidades.Cli_Veh_Alq;

public class ControladorAlquiler {
	
	private ArrayList<Vehiculos> vehiculos;
	
	public ArrayList<Vehiculos> getVehiculos() {
		return vehiculos;
	}

	public void setVehiculos(ArrayList<Vehiculos> vehiculos) {
		this.vehiculos = vehiculos;
	}
	
	public ArrayList<Vehiculos> getStockVehiculosDisponiblesParaAlquilar(String fechaDesde, String fechaHasta) {
		
		DataVehiculos dv = new DataVehiculos();
		
		vehiculos = dv.getVehiculosDisponiblesParaAlquilar(fechaDesde, fechaHasta);
		
		return vehiculos;
	}

	public Cli_Veh_Alq buscarAlquiler(int nro_alquiler) {
		
		DataAlquileres dbAlquileres = new DataAlquileres();
		
		Cli_Veh_Alq alquiler = new Cli_Veh_Alq();
		
		alquiler = dbAlquileres.getByNroAlquiler(nro_alquiler);
		
		return alquiler;
	}
	
	public int registrarAlquiler(String patenteVehiculo, String fecha_desde, String fecha_hasta, String mailUsuario, float precioAlquiler, int tarjetaCredito) {
		
		DataAlquileres dataAlquileres = new DataAlquileres();
		
		int nroAlquiler;
		
		nroAlquiler = dataAlquileres.registrarAlquiler(patenteVehiculo, fecha_desde, fecha_hasta, mailUsuario, precioAlquiler, tarjetaCredito);
		
		return nroAlquiler;
	}
	


}
