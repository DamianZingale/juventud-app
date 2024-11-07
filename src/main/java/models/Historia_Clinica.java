package models;

public class Historia_Clinica {
	
	private int id_clinica;
	private String enfermedades_preexistentes;
	private String medicaciones;
	private String operaciones;
	private String alergias;
	
	//constructor con parametros
	public Historia_Clinica(String enfermedades_preexistentes, String medicaciones, String operaciones,
			String alergias) {
		this.enfermedades_preexistentes = enfermedades_preexistentes;
		this.medicaciones = medicaciones;
		this.operaciones = operaciones;
		this.alergias = alergias;
	}
	
	//constructor vacio
	public Historia_Clinica() {
	}
	
	//getters and setters
	public int getId_clinica() {
		return id_clinica;
	}
	public void setId_clinica(int id_clinica) {
		this.id_clinica = id_clinica;
	}
	public String getEnfermedades_preexistentes() {
		return enfermedades_preexistentes;
	}
	public void setEnfermedades_preexistentes(String enfermedades_preexistentes) {
		this.enfermedades_preexistentes = enfermedades_preexistentes;
	}
	public String getMedicaciones() {
		return medicaciones;
	}
	public void setMedicaciones(String medicaciones) {
		this.medicaciones = medicaciones;
	}
	public String getOperaciones() {
		return operaciones;
	}
	public void setOperaciones(String operaciones) {
		this.operaciones = operaciones;
	}
	public String getAlergias() {
		return alergias;
	}
	public void setAlergias(String alergias) {
		this.alergias = alergias;
	}
	
	//metodo toString
	@Override
	public String toString() {
		return "Historia_Clinica [enfermedades_preexistentes=" + enfermedades_preexistentes + ", medicaciones="
				+ medicaciones + ", operaciones=" + operaciones + ", alergias=" + alergias + "]";
	}
	
}
