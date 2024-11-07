package models;

import java.sql.Date;

public class Comprobantes {
	
	private int id_comprobante;
	private String comprobante;
	private double nota;
	private Date fecha_comp;
	
	//constructor con parametros
	public Comprobantes(String comprobante, double nota, Date fecha_comp) {
		this.comprobante = comprobante;
		this.nota = nota;
		this.fecha_comp = fecha_comp;
	}
	
	//constructor vacio
	public Comprobantes() {
	}
	
	//getters and setters
	public String getComprobante() {
		return comprobante;
	}
	public void setComprobante(String comprobante) {
		this.comprobante = comprobante;
	}
	public double getNota() {
		return nota;
	}
	public void setNota(double nota) {
		this.nota = nota;
	}
	public Date getFecha_comp() {
		return fecha_comp;
	}
	public void setFecha_comp(Date fecha_comp) {
		this.fecha_comp = fecha_comp;
	}
	
	
}
