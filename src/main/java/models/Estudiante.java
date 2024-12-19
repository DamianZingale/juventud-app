package models;

public class Estudiante extends Usuario {
	
	private int id_usuario;
	private String userName;
	private String password;
	private String fecha_nac;
	private String domicilio;
	private String telefono;
	private boolean estado;
	
	
	private Historia_Clinica historia_clinica;
	private PlanEstudio plan_estudio;
	private Casa casa;
	private Referente referente;
	
	//constructor con parametros
	public Estudiante(String dNI, String nombre, String apellido, String email, String funcion, String userName,
			String password, String fecha_nac, String domicilio, String telefono, boolean estado,
			 Historia_Clinica historia_clinica, PlanEstudio plan_estudio, Casa casa,
			Referente referente) {
		super(dNI, nombre, apellido, email, funcion);
		this.userName = userName;
		this.password = password;
		this.fecha_nac = fecha_nac;
		this.domicilio = domicilio;
		this.telefono = telefono;
		this.estado = estado;
		
		this.historia_clinica = historia_clinica;
		this.plan_estudio = plan_estudio;
		this.casa = casa;
		this.referente = referente;
	}
	
	//constructor vacio
	public Estudiante() {
		super();
	}
	
	
	//getters and setters
	public int getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFecha_nac() {
		return fecha_nac;
	}

	public void setFecha_nac(String fecha_nac) {
		this.fecha_nac = fecha_nac;
	}

	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	

	public Historia_Clinica getHistoria_clinica() {
		return historia_clinica;
	}

	public void setHistoria_clinica(Historia_Clinica historia_clinica) {
		this.historia_clinica = historia_clinica;
	}

	public PlanEstudio getPlan_estudio() {
		return plan_estudio;
	}

	public void setPlan_estudio(PlanEstudio plan_estudio) {
		this.plan_estudio = plan_estudio;
	}

	public Casa getCasa() {
		return casa;
	}

	public void setCasa(Casa casa) {
		this.casa = casa;
	}

	public Referente getReferente() {
		return referente;
	}

	public void setReferente(Referente referente) {
		this.referente = referente;
	}
	
	//metodo toString
	@Override
	public String toString() {
		return "Estudiante [fecha_nac=" + fecha_nac + ", domicilio=" + domicilio + ", telefono=" + telefono
				+ ", estado=" + estado + "]";
	}
	
	
	
	
	
}
