package models;

public class PlanEstudio {
	private int idPlan;
    private String institucion;
    private String carrera;
    private String resolucion;
    private int cantidadAnios;
    private boolean activo;  
   


    // Constructor
    
    public PlanEstudio() {
    }
    
    public PlanEstudio(int idPlan, String institucion, String carrera, int cantidadAnios, boolean activo, String resolucion) {
        this.idPlan = idPlan;
        this.institucion = institucion;
        this.carrera = carrera;
        this.resolucion = resolucion;
        this.cantidadAnios = cantidadAnios;
        this.activo = activo;
        
    }
    public PlanEstudio(int idPlan, boolean activo) {
    	this.idPlan = idPlan;
    	this.activo = activo;
    }

    // Getters y Setters
    public int getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(int idPlan) {
        this.idPlan = idPlan;
    }

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
    
    public String getResolucion() {
        return resolucion;
    }
    
    public void setResolucion(String resolucion) {
        this.resolucion = resolucion;
    }

    public int getCantidadAnios() {
        return cantidadAnios;
    }

    public void setCantidadAnios(int cantidadAnios) {
        this.cantidadAnios = cantidadAnios;
    }
    
    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
    


    // toString
    @Override
    public String toString() {
        return "PlanEstudio{" +
                "idPlan=" + idPlan +
                ", institucion='" + institucion + '\'' +
                ", carrera='" + carrera + '\'' +
                ", resolucion=" + resolucion +
                ", cantidadAnios=" + cantidadAnios +
                '}';
    }
}
