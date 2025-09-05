/*	
 *  Universidad Mariano Gálvez de Guatemala
 *  Tarea 4 del curso Programación II
 *	
 *  Autor:
 *  Francisco Antonio De León Natareno
*/

package modelo;

public class Empleado extends Persona {
  private String codigo;
  private int id_puesto;
  
  public Empleado() {}

  public Empleado(int id, String nombres, String apellidos, String direccion, String telefono, String fecha_nacimiento, String codigo, int id_puesto) {
    super(id, nombres, apellidos, direccion, telefono, fecha_nacimiento);
    this.codigo = codigo;
    this.id_puesto = id_puesto;
  }

  public String getCodigo() { return codigo; }

  public void setCodigo(String codigo) { this.codigo = codigo; }

  public int getId_puesto() { return id_puesto; }

  public void setId_puesto(int id_puesto) { this.id_puesto = id_puesto; }
  
  @Override
  public void agregar() {}
  
}
