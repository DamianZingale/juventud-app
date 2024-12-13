package models;

public class MateriasPorAño {
	 private int idAñoPlan;
	    private String materia;
	    private String periodo;

	    //constuctores
	    public MateriasPorAño() {
	    	
	    }
	    
	    public MateriasPorAño(int idAñoPlan, String materia, String periodo) {
	        this.idAñoPlan = idAñoPlan;
	        this.materia = materia;
	        this.periodo = periodo;
	    }

	    //getter y setters
	    public int getAño() {
	        return idAñoPlan;
	    }

	    public void setAño(int idAñoPlan) {
	        this.idAñoPlan = idAñoPlan;
	    }

	    public String getMateria() {
	        return materia;
	    }

	    public void setMateria(String materia) {
	        this.materia = materia;
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
