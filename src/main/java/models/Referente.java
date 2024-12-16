package models;

public class Referente extends Usuario {
	
	private int id_referente;
	private String rol;
	private String telefono;
	private String domicilio;
	
	public Referente() {
		super();
	}
	
	public Referente(String dNI, String nombre, String apellido, String email, String funcion, int id_referente,
			String rol, String telefono, String domicilio) {
		super(dNI, nombre, apellido, email, funcion);
		this.id_referente = id_referente;
		this.rol = rol;
		this.telefono = telefono;
		this.domicilio = domicilio;
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

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	//metodo toString
	@Override
	public String toString() {
		return "Referente [rol=" + rol + "]";
	}
	
	
}
