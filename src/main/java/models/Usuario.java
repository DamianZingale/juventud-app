package models;

public class Usuario {
	
	private String DNI;
	private String nombre;
	private String apellido;
	private String email;
	private String funcion;
	
	//constructor con parametros
	public Usuario(String dNI, String nombre, String apellido, String email, String funcion) {
		DNI = dNI;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.funcion = funcion;
	}
	
	//constructor vacio
	public Usuario() {
	}
	
	//getters and setters
	public String getDNI() {
		return DNI;
	}
	public void setDNI(String dNI) {
		DNI = dNI;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFuncion() {
		return funcion;
	}
	public void setFuncion(String funcion) {
		this.funcion = funcion;
	}
	
	//metodo toString
	@Override
	public String toString() {
		return "Usuario [DNI=" + DNI + ", nombre=" + nombre + ", apellido=" + apellido + ", email=" + email
				+ ", funcion=" + funcion + "]";
	}
	
	
}
