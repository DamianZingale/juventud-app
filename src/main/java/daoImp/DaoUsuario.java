package daoImp;

import java.io.IOException;

public class DaoUsuario {

	ConnectionManager cn;

    public DaoUsuario() {
        try {
            cn = new ConnectionManager(); 
        } catch (IOException e) {
            e.printStackTrace(); 
        }
    }

    


}
