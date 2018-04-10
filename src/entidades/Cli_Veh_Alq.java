package entidades;

public class Cli_Veh_Alq {

	private Usuario cliente;
	private Vehiculos vehiculo;
	private Alquiler alquiler;
	
	public Usuario getCliente() {
		return cliente;
	}
	public void setCliente(Usuario cliente) {
		this.cliente = cliente;
	}
	public Vehiculos getVehiculo() {
		return vehiculo;
	}
	public void setVehiculo(Vehiculos vehiculo) {
		this.vehiculo = vehiculo;
	}
	public Alquiler getAlquiler() {
		return alquiler;
	}
	public void setAlquiler(Alquiler alquiler) {
		this.alquiler = alquiler;
	}
	
}
