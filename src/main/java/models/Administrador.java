package models;

public class Administrador extends Usuario{
	
	private int id_admin;
		private String userName;
		private String password;
		
		//constructor con parametros
		public Administrador(String dNI, String nombre, String apellido, String email, String funcion, String userName,
				String password) {
			super(dNI, nombre, apellido, email, funcion);
			this.userName = userName;
			this.password = password;
		}
		//constructor vacio
		public Administrador() {
		}
		
		//getters and setters
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public int getId_admin() {
			return id_admin;
		}
		public void setId_admin(int id_admin) {
			this.id_admin = id_admin;
		}
		
		
		
}
