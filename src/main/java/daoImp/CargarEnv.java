package daoImp;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class CargarEnv {
    private ArrayList<String> lista;

    public CargarEnv() {
        this.lista = new ArrayList<>();
    }

    public void ejecutar() {
        final String path = "/variables.env";
        try (BufferedReader archivo = new BufferedReader(new FileReader(path))) {
            String linea;

            while ((linea = archivo.readLine()) != null) {
                
                if (linea.trim().isEmpty() || linea.trim().startsWith("#")) { //ignorar las lineas vacias o con comentarios
                    continue;
                }
                lista.add(linea.trim());
            }
        } catch (IOException e) {
            System.err.println("Error al leer el archivo: " + e.getMessage());
        }
    }

    public ArrayList<String> getVariables() {
        return lista;
    }

    @Override
    public String toString() {
        return String.join("\n", lista);
    }
}
