package entidades;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Usuario {
	
	private String nombre, apellido, direccion, telefono, mail, password, nro_tarjeta;
	private Date fechaNacimiento, fechaVencimientoLicencia;
	private int dni;
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public int getDni() {
		return dni;
	}
	public void setDni(int dni) {
		this.dni = dni;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public Date getFechaVencimientoLicencia() {
		return fechaVencimientoLicencia;
	}
	public void setFechaVencimientoLicencia(Date fechaVencimientoLicencia) {
		this.fechaVencimientoLicencia = fechaVencimientoLicencia;
	}
	public String getNro_tarjeta() {
		return nro_tarjeta;
	}
	public void setNro_tarjeta(String nro_tarjeta) {
		this.nro_tarjeta = nro_tarjeta;
	}
	
	public void setFechaNacimiento(String parameter) throws ParseException {
		String expectedPattern = "yyyy-dd-MM";
	    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
	    
	    this.fechaNacimiento = formatter.parse(parameter);
	}
	public void setFechaVencimientoLicencia(String string) throws ParseException {
		String expectedPattern = "yyyy-dd-MM";
	    SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
	    
	    this.fechaVencimientoLicencia = formatter.parse(string);
		
	}

}
