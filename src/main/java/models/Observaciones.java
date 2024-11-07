package models;

import java.sql.Date;

public class Observaciones {
	
	private int id_observaciones;
	private String observacion;
	private Date fecha_observacion;
	
	//constructor con parametros
	public Observaciones(String observacion, Date fecha_observacion) {
		this.observacion = observacion;
		this.fecha_observacion = fecha_observacion;
	}
	
	//constructor vacio
	public Observaciones() {
	}
	
	//getters and setters
	public int getId_observaciones() {
		return id_observaciones;
	}
	public void setId_observaciones(int id_observaciones) {
		this.id_observaciones = id_observaciones;
	}
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
	public Date getFecha_observacion() {
		return fecha_observacion;
	}
	public void setFecha_observacion(Date fecha_observacion) {
		this.fecha_observacion = fecha_observacion;
	}
	
	
	
}
