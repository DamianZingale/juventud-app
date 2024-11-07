package models;

public class Materias {
	
	private int id_materia;
	private String materia;
	private boolean estado;
	
	private Comprobantes comprobantes;
	
	//constructor con parametros
	public Materias(String materia, boolean estado) {
		this.materia = materia;
		this.estado = estado;
	}
	
	//getters and setters
	public int getId_materia() {
		return id_materia;
	}

	public void setId_materia(int id_materia) {
		this.id_materia = id_materia;
	}

	public String getMateria() {
		return materia;
	}

	public void setMateria(String materia) {
		this.materia = materia;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	
}
