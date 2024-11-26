package models;

public class Casa {
	
	private int id_casa;
	private String nombre_casa;
	private String direccion;
	private String ciudad;
	private int capacidad;
	
	//constructor con parametros
	public Casa(String nombre_casa, String direccion, String ciudad, int capacidad) {
		this.nombre_casa = nombre_casa;
		this.direccion = direccion;
		this.ciudad = ciudad;
		this.capacidad = capacidad;
	}
	
	//constructor vacio
	public Casa(int id_casa) {
	}
	
	//getters and setters
	public int getId_casa() {
		return id_casa;
	}
	public void setId_casa(int id_casa) {
		this.id_casa = id_casa;
	}
	public String getNombre_casa() {
		return nombre_casa;
	}
	public void setNombre_casa(String nombre_casa) {
		this.nombre_casa = nombre_casa;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getCiudad() {
		return ciudad;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	public int getCapacidad() {
		return capacidad;
	}
	public void setCapacidad(int capacidad) {
		this.capacidad = capacidad;
	}
	
	//metodo toString
	@Override
	public String toString() {
		return "Casa [nombre_casa=" + nombre_casa + ", direccion=" + direccion + ", ciudad=" + ciudad + ", capacidad="
				+ capacidad + "]";
	}
	
	

}
