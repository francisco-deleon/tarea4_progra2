/*	
 *  Universidad Mariano Gálvez de Guatemala
 *  Tarea 4 del curso Programación II
 *	
 *  Autor:
 *  Francisco Antonio De León Natareno
*/

package modelo;

import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class Empleado extends Persona {
  private String codigo;
  private int id_puesto;
  private Conexion cn;
  
  public Empleado() {}

  public Empleado(int id, String nombres, String apellidos, String direccion, String telefono, String fecha_nacimiento, String codigo, int id_puesto) {
    super(id, nombres, apellidos, direccion, telefono, fecha_nacimiento);
    this.codigo = codigo;
    this.id_puesto = id_puesto;
  }

  public String getCodigo() { return codigo; }

  public void setCodigo(String codigo) { this.codigo = codigo; }

  public int getIdPuesto() { return id_puesto; }

  public void setIdPuesto(int id_puesto) { this.id_puesto = id_puesto; }
  
  @Override
  public int agregar() {
    int retorno = 0;
    
    try {
      String campos = "(codigo, nombres, apellidos, direccion, telefono, fecha_nacimiento, id_puesto)";
      String query = "INSERT INTO empleados" + campos + " VALUES(?, ?, ?, ?, ?, ?, ?);";
      PreparedStatement parametro;
      cn = new Conexion();
      
      cn.abrir_conexion();
      parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
      parametro.setString(1, getCodigo());
      parametro.setString(2, getNombres());
      parametro.setString(3, getApellidos());
      parametro.setString(4, getDireccion());
      parametro.setString(5, getTelefono());
      parametro.setString(6, getFechaNacimiento());
      parametro.setInt(7, getIdPuesto());
      
      retorno = parametro.executeUpdate();
      
      cn.cerrar_conexion();
      
    } catch (Exception ex) {
      System.out.println(ex.getMessage());
      retorno = 0;
    }
    
    return retorno;
  }
  
}
