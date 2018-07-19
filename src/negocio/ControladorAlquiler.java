package negocio;

import java.util.ArrayList;

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
	


}
