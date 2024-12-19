package models;

public class Periodo {
	 private int id;
     private String nombre;
     
     public Periodo() {
     }


     public Periodo(int id, String nombre) {
         this.id = id;
         this.nombre = nombre;
     }

     public void setIdPeriodo(int id) {
         this.id = id;
     }
     
     public int getIdPeriodo() {
         return id;
     }
     
     public void setNombre(String nombre) {
         this.nombre = nombre;
     }

     public String getNombre() {
         return nombre;
     }

     @Override
     public String toString() {
         return nombre; 
     }

 }

