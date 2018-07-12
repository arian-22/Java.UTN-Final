package negocio;

import java.util.ArrayList;

import database.DataAlquileres;
import database.DataVehiculos;
import entidades.Alquiler;
import entidades.Vehiculos;

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

	public Alquiler buscarAlquiler(int nro_alquiler) {
		DataAlquileres dbAlquileres = new DataAlquileres();
		Alquiler alquiler = new Alquiler();
		
		alquiler = dbAlquileres.getByNroAlquiler(nro_alquiler);
		return alquiler;
	}
	


}
