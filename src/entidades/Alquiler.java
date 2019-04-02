package entidades;

import java.sql.Date;

public class Alquiler {
	
	private int nro_alquiler;
	private Date fechaDesde, fechaHasta;
	private String fechaCancelacion, fechaFinalizacion;
	private float importeCancelacion, precioAlquiler, precioFinalAlquiler;
	
	public String getFechaFinalizacion() {
		return fechaFinalizacion;
	}
	public void setFechaFinalizacion(String fechaFinalizacion) {
		this.fechaFinalizacion = fechaFinalizacion;
	}
	public float getPrecioFinalAlquiler() {
		return precioFinalAlquiler;
	}
	public void setPrecioFinalAlquiler(float precioFinalAlquiler) {
		this.precioFinalAlquiler = precioFinalAlquiler;
	}
	public int getNro_alquiler() {
		return nro_alquiler;
	}
	public void setNro_alquiler(int nro_alquiler) {
		this.nro_alquiler = nro_alquiler;
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
	public String getFechaCancelacion() {
		return fechaCancelacion;
	}
	public void setFechaCancelacion(String fechaCancelacion) {
		this.fechaCancelacion = fechaCancelacion;
	}
	public float getImporteCancelacion() {
		return importeCancelacion;
	}
	public void setImporteCancelacion(float importeCancelacion) {
		this.importeCancelacion = importeCancelacion;
	}
	public float getPrecioAlquiler() {
		return precioAlquiler;
	}
	public void setPrecioAlquiler(float precioAlquiler) {
		this.precioAlquiler = precioAlquiler;
		
	}
	
	
	

}
