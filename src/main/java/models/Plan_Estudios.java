package models;

import java.util.List;

public class Plan_Estudios {
	
	private String institucion;
	private String carrera;
	
	private List<Cuatrimestres> cuatrimestres;
	
	//constructor con parametros
	public Plan_Estudios(String institucion, String carrera, List<Cuatrimestres> cuatrimestres) {
		this.institucion = institucion;
		this.carrera = carrera;
		this.cuatrimestres = cuatrimestres;
	}
	//constructor vacio
	public Plan_Estudios() {
	}
	
	//getters and setters
	public String getInstitucion() {
		return institucion;
	}

	public void setInstitucion(String institucion) {
		this.institucion = institucion;
	}

	public String getCarrera() {
		return carrera;
	}

	public void setCarrera(String carrera) {
		this.carrera = carrera;
	}

	public List<Cuatrimestres> getCuatrimestres() {
		return cuatrimestres;
	}

	public void setCuatrimestres(List<Cuatrimestres> cuatrimestres) {
		this.cuatrimestres = cuatrimestres;
	}
	
	//metodo toString
	public Plan_Estudios(String institucion, String carrera) {
		this.institucion = institucion;
		this.carrera = carrera;
	}
	
	
	
	
}
