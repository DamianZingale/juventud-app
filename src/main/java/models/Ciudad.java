package models;

public class Ciudad {
	
	private int id_ciudad;
	private String nombre_ciudad;
	
	public Ciudad() {}
	
	public Ciudad(int id_ciudad, String nombre_ciudad) {
		super();
		this.id_ciudad = id_ciudad;
		this.nombre_ciudad = nombre_ciudad;
	}

	public int getId_ciudad() {
		return id_ciudad;
	}

	public void setId_ciudad(int id_ciudad) {
		this.id_ciudad = id_ciudad;
	}

	public String getNombre_ciudad() {
		return nombre_ciudad;
	}

	public void setNombre_ciudad(String nombre_ciudad) {
		this.nombre_ciudad = nombre_ciudad;
	}
	
	
}
