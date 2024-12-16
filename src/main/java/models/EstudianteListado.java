package models;

public class EstudianteListado {
	
	private int Id_usuario;
	private String nombre;
	private String apellido;
	private String DNI;
	private String correo;
	private String domicilio;
	private String fechaNacimiento;
	private String casa;
	private String telefono;
	private String Carrera;
	private String Institución;
	private String Ciudad;
	private boolean Estado;
	
	public EstudianteListado() {}

	public EstudianteListado(int id_usuario, String nombre, String apellido, String dNI, String correo,
			String domicilio, String fechaNacimiento, String casa, String telefono, String carrera, String institución,
			String ciudad, boolean estado) {
		Id_usuario = id_usuario;
		this.nombre = nombre;
		this.apellido = apellido;
		DNI = dNI;
		this.correo = correo;
		this.domicilio = domicilio;
		this.fechaNacimiento = fechaNacimiento;
		this.casa = casa;
		this.telefono = telefono;
		Carrera = carrera;
		Institución = institución;
		Ciudad = ciudad;
		Estado = estado;
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

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
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

	public boolean isEstado() {
		return Estado;
	}

	public void setEstado(boolean estado) {
		Estado = estado;
	}

	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	public String getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getCasa() {
		return casa;
	}

	public void setCasa(String casa) {
		this.casa = casa;
	}

	
	
	
}
