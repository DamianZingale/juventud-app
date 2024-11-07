package models;

public class Referente extends Usuario {
	
	private int id_referente;
	private String rol;
	
	//constructor con parametros
	public Referente(String dNI, String nombre, String apellido, String email, String funcion, String rol) {
		super(dNI, nombre, apellido, email, funcion);
		this.rol = rol;
	}
	
	//constructor vacio
	public Referente() {
		super();
	}
	
	//getters and setters
	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}
	
	public int getId_referente() {
		return id_referente;
	}

	public void setId_referente(int id_referente) {
		this.id_referente = id_referente;
	}

	//metodo toString
	@Override
	public String toString() {
		return "Referente [rol=" + rol + "]";
	}
	
	
}
