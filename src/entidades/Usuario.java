package entidades;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Usuario {
	
	private String nombre, apellido, direccion, telefono, mail, password, nro_tarjeta, fechaNacimiento, fechaVencimientoLicencia;
	private int dni;
	private String admin;
	
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
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getFechaNacimiento() {
		return fechaNacimiento;
	}
	public String getFechaVencimientoLicencia() {
		return fechaVencimientoLicencia;
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
	public String getNro_tarjeta() {
		return nro_tarjeta;
	}
	public void setNro_tarjeta(String nro_tarjeta) {
		this.nro_tarjeta = nro_tarjeta;
	}
	
	public void setFechaNacimiento(String parameter) {
		
	    this.fechaNacimiento = parameter;
	}
	
	public void setFechaVencimientoLicencia(String string) {
	  
	    this.fechaVencimientoLicencia = string;	
	}
	
	public String getFechaNacimientoString(){
		
		return this.fechaNacimiento.toString();
	}

	public String getFechaVencimientoLicenciaString(){
		
		return this.fechaVencimientoLicencia.toString();
	}
}
