/*	
 *  Universidad Mariano Gálvez de Guatemala
 *  Tarea 4 del curso Programación II
 *	
 *  Autor:
 *  Francisco Antonio De León Natareno
*/

package modelo;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class Conexion {
  public Connection conexionBD;
  
  private final String DRIVER = "com.mysql.cj.jdbc.Driver";
  private final String HOST = "localhost";
  private final String PUERTO = "3307";
  private final String USUARIO = "usr_empresa";
  private final String CLAVE = "Empres@123";
  private final String BD = "db_empresa";
  private final String URL = String.format("jdbc:mysql://%s:%s/%s?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", HOST, PUERTO, BD);
  
  public void abrir_conexion() {
    try {
      Class.forName(DRIVER);
      conexionBD = DriverManager.getConnection(URL, USUARIO, CLAVE);
    }
    catch(ClassNotFoundException | SQLException ex) {
      System.out.println("Error" + ex.getMessage());
    }
  }
    
  public void cerrar_conexion() {
    try {
      conexionBD.close();
    }
    catch(SQLException ex) {
      System.out.println("Error" + ex.getMessage());
    }
  }
}
