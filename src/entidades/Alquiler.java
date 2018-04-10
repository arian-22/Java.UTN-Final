package entidades;

import java.sql.Date;

public class Alquiler {
	
	private int nro_alquiler;
	private Date hora, fechaDesde, fechaHasta, fechaCancelacion;
	private float importeCancelacion;
	public int getNro_alquiler() {
		return nro_alquiler;
	}
	public void setNro_alquiler(int nro_alquiler) {
		this.nro_alquiler = nro_alquiler;
	}
	public Date getHora() {
		return hora;
	}
	public void setHora(Date hora) {
		this.hora = hora;
	}
	public Date getFechaDesde() {
		return fechaDesde;
	}
	public void setFechaDesde(Date fechaDesde) {
		this.fechaDesde = fechaDesde;
	}
	public Date getFechaHasta() {
		return fechaHasta;
	}
	public void setFechaHasta(Date fechaHasta) {
		this.fechaHasta = fechaHasta;
	}
	public Date getFechaCancelacion() {
		return fechaCancelacion;
	}
	public void setFechaCancelacion(Date fechaCancelacion) {
		this.fechaCancelacion = fechaCancelacion;
	}
	public float getImporteCancelacion() {
		return importeCancelacion;
	}
	public void setImporteCancelacion(float importeCancelacion) {
		this.importeCancelacion = importeCancelacion;
	}
	
	
	

}
