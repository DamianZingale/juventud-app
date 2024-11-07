package models;

import java.util.List;

public class Cuatrimestres {
	
	private int numero_cuatrimestre;
	
	private List<Materias> materias;
	
	//constructor con parametros
	
	
	//getters and setters
	public int getNumero_cuatrimestre() {
		return numero_cuatrimestre;
	}

	public Cuatrimestres(int numero_cuatrimestre, List<Materias> materias) {
		this.numero_cuatrimestre = numero_cuatrimestre;
		this.materias = materias;
	}

	public void setNumero_cuatrimestre(int numero_cuatrimestre) {
		this.numero_cuatrimestre = numero_cuatrimestre;
	}

	public List<Materias> getMaterias() {
		return materias;
	}

	public void setMaterias(List<Materias> materias) {
		this.materias = materias;
	}
	
	
}
