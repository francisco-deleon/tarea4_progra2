/*	
 *  Universidad Mariano Gálvez de Guatemala
 *  Tarea 4 del curso Programación II
 *	
 *  Autor:
 *  Francisco Antonio De León Natareno
*/

package modelo;

import java.sql.ResultSet;
import java.util.HashMap;

public class Puesto {
  private int id_puesto;
  private String puesto;
  private Conexion cn;

  public Puesto() {}

  public Puesto(int id_puesto, String puesto) {
    this.id_puesto = id_puesto;
    this.puesto = puesto;
  }

  public int getId_puesto() { return id_puesto; }

  public void setId_puesto(int id_puesto) { this.id_puesto = id_puesto; }

  public String getPuesto() { return puesto; }

  public void setPuesto(String puesto) { this.puesto = puesto; }
  
  public HashMap dropPuesto() {
    HashMap<String, String> drop = new HashMap();
    
    try {
      String query = "SELECT id_puesto AS id, puesto FROM puestos;";
      cn = new Conexion();
      
      cn.abrir_conexion();
      ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
      
      while(consulta.next()) {
        drop.put(consulta.getString("id"), consulta.getString("puesto"));
      }
      
      cn.cerrar_conexion();
      
    } catch (Exception ex) {
      System.out.println(ex.getMessage());
    }
    
    return drop;
  }
  
}
