package negocio;

import java.util.ArrayList;

import database.DataAlquileres;
import database.DataVehiculos;
import entidades.Vehiculos;
import entidades.Cli_Veh_Alq;

public class ControladorInforme {
	
	private ArrayList<Vehiculos> vehiculos;
	private ArrayList<Cli_Veh_Alq> cva;

	public ArrayList<Vehiculos> getVehiculos() {
		return vehiculos;
	}

	public void setVehiculos(ArrayList<Vehiculos> vehiculos) {
		this.vehiculos = vehiculos;
	}
	
	public ArrayList<Vehiculos> getStockVehiculos() {
		DataVehiculos dv = new DataVehiculos();
		
		vehiculos = dv.getVehiculos();
		
		return vehiculos;
	}
	
	public ArrayList<Cli_Veh_Alq> getVehiculosAlquilados(){
		DataAlquileres da = new DataAlquileres();
		
		cva = da.getVehiculosAlquilados();
		
		return cva;
		
	}
	

}
