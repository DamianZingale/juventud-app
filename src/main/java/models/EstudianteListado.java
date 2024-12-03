package models;

public class EstudianteListado {
	
	int Id_usuario;
	String nombre;
	String apellido;
	String DNI;
	String Carrera;
	String Institución;
	String Ciudad;
	
	public EstudianteListado() {}

	public EstudianteListado(int id_usuario, String nombre, String apellido, String dNI, String carrera,
			String institución, String ciudad) {
		super();
		Id_usuario = id_usuario;
		this.nombre = nombre;
		this.apellido = apellido;
		DNI = dNI;
		Carrera = carrera;
		Institución = institución;
		Ciudad = ciudad;
	}

	public int getId_usuario() {
		return Id_usuario;
	}

	public void setId_usuario(int id_usuario) {
		Id_usuario = id_usuario;
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

	public String getDNI() {
		return DNI;
	}

	public void setDNI(String dNI) {
		DNI = dNI;
	}

	public String getCarrera() {
		return Carrera;
	}

	public void setCarrera(String carrera) {
		Carrera = carrera;
	}

	public String getInstitución() {
		return Institución;
	}

	public void setInstitución(String institución) {
		Institución = institución;
	}

	public String getCiudad() {
		return Ciudad;
	}

	public void setCiudad(String ciudad) {
		Ciudad = ciudad;
	}
	

	
}
