package models;

public class Casa {
	
	private int id_casa;
	private String nombre_casa;
	private String direccion;
	private int capacidad;
	private boolean Estado;
	
	private Ciudad ciudad;
	
	
	public Casa(int id_casa, String nombre_casa, String direccion, int capacidad, boolean estado, Ciudad ciudad) {
		this.id_casa = id_casa;
		this.nombre_casa = nombre_casa;
		this.direccion = direccion;
		this.capacidad = capacidad;
		Estado = estado;
		this.ciudad = ciudad;
	}

	//constructor vacio
	public Casa(int id_casa) {
	}
	
	public Casa() {
		// TODO Auto-generated constructor stub
	}


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

	public int getCapacidad() {
		return capacidad;
	}

	public void setCapacidad(int capacidad) {
		this.capacidad = capacidad;
	}

	public boolean isEstado() {
		return Estado;
	}

	public void setEstado(boolean estado) {
		Estado = estado;
	}

	public Ciudad getCiudad() {
		return ciudad;
	}

	public void setCiudad(Ciudad ciudad) {
		this.ciudad = ciudad;
	}

	//metodo toString
	@Override
	public String toString() {
		return "Casa [nombre_casa=" + nombre_casa + ", direccion=" + direccion + ", ciudad=" + ciudad + ", capacidad="
				+ capacidad + "]";
	}
	
	

}
