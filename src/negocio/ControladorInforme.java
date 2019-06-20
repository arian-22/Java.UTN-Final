package negocio;

import java.sql.SQLException;
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
	
	public ArrayList<Vehiculos> getStockVehiculos() throws SQLException {
		DataVehiculos dv = new DataVehiculos();
		
		vehiculos = dv.getVehiculos();
		
		return vehiculos;
	}
	
	public ArrayList<Cli_Veh_Alq> getVehiculosAlquiladosActualmente() throws SQLException{
		DataAlquileres da = new DataAlquileres();
		
		cva = da.getVehiculosAlquiladosActualmente();
		
		return cva;
	}

	public ArrayList<Cli_Veh_Alq> getVehiculosADevolverHoy() throws SQLException {
		DataAlquileres da = new DataAlquileres();
		
		cva = da.getVehiculosADevolverHoy();
		
		return cva;
	}
	

}
