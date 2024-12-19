package models;

public class MateriasPorAño {
	private int idMateria; //POR EJEMPLO ID=1
	private int idAñoPlan; // ES DE LA TABLA A�OpLAN
	private int anio;		// A�O DE LA CARRERA SI LA CARRERA TIENE 2 A�OS, GUARDA =1
	private String materia; // MATEMATICA BASICA
	private String periodo; //ANUAL
	private int IDperiodo; // 1 ... QUE ES ANUAL EN LA db

	    //constuctores
	    public MateriasPorAño() {
	    	
	    }
	    
	    public MateriasPorAño(int idMateria, int idAñoPlan, int anio, String materia, String periodo, int IDperiodo) {
	       
	    	this.idMateria = idMateria;
	    	this.idAñoPlan = idAñoPlan;
	        this.anio = anio;
	        this.materia = materia;
	        this.periodo = periodo;
	        this.IDperiodo = IDperiodo;
	    }
	    
	    public MateriasPorAño(int idAñoPlan, String materia, String periodo) {
	        this.idAñoPlan = idAñoPlan;
	        this.materia = materia;
	        this.periodo = periodo;
	        
	    }
	   
	    public MateriasPorAño(int idMateria, int idAñoPlan, String materia, String periodo) {
	    	this.idMateria = idMateria;
	        this.idAñoPlan = idAñoPlan;
	        this.materia = materia;
	        this.periodo = periodo;       
	    }

	    //getter y setters
	    public int getIdMateria() {
	        return idMateria;
	    }

	    public void setIdMateria(int idMateria) {
	        this.idMateria = idMateria;
	    }
	    	    
	    public int getIdAñoPlan() {
	        return idAñoPlan;
	    }

	    public void setIdAñoPlan(int idAñoPlan) {
	        this.idAñoPlan = idAñoPlan;
	    }
	    
	    public int getAñoCursada() {
	        return anio;
	    }

	    public void setAñoCursada(int anio) {
	        this.anio = anio;
	    }

	    public String getMateria() {
	        return materia;
	    }

	    public void setMateria(String materia) {
	        this.materia = materia;
	    }
	    
	    public int getIDPeriodo() {
	        return IDperiodo;
	    }

	    public void setIDPeriodo(int IDperiodo) {
	        this.IDperiodo = IDperiodo;
	    }
	    
	    public String getPeriodo() {
	        return periodo;
	    }

	    public void setPeriodo(String periodo) {
	        this.periodo = periodo;
	    }
	    
	    @Override
	    public String toString() {
	        return "MateriaPorCuatrimestre{" +
	               "cuatrimestre=" + idAñoPlan +
	               ", materia='" + materia + '\'' +
	               ", periodo ='" + periodo + '\'' +
	               '}';
	    }
}
