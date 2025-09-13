<%-- 
    Universidad Mariano Gálvez de Guatemala
    Tarea 4 del curso Programación II

    Autor: Francisco Antonio De León Natareno
    Documento: index.jsp
--%>
<%@page import="modelo.Puesto" %>
<%@page import="modelo.Empleado" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Empleados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
  </head>
  <body>
    <h1>Formulario Empleados</h1>
    <div class="container">
      <form action="sr_empleado" method="POST" class="form-group">
        <label for="lbl_id"><b>ID:</b></label>
        <input type="text" name="txt_id" id="txt_id" class="form-control-plaintext" value="0" readonly>
        <label for="txt_codigo"><b>Codigo:</b></label>
        <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" placeholder="Ejemplo: E001" required>
        <label for="txt_nombres"><b>Nombres:</b></label>
        <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre1 Nombre2" required>
        <label for="txt_apellidos"><b>Apellidos:</b></label>
        <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido1 Apellido2" required>
        <label for="txt_direccion"><b>Direccion:</b></label>
        <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: # Casa, Calle, Zona, Ciudad" required>
        <label for="txt_telefono"><b>Telefono:</b></label>
        <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: # 12345678" required>
        <label for="txt_fn"><b>Fecha Nacimiento:</b></label>
        <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
        <label for="drop_puesto"><b>Puesto:</b></label>
        <select name="drop_puesto" id="drop_puesto" class="form-control">
        <%
          Puesto puesto = new Puesto();
          HashMap<String, String> drop = puesto.dropPuesto();

          for(String i: drop.keySet()) {
            out.println("<option value='"+ i +"'>" + drop.get(i) + "</option>");
          }
        %>
        </select>
        <br>
        <!--  
        <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-outline-success btn-lg">Agregar</button>
        <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-outline-warning btn-lg">Modificar</button>
        <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-outline-danger btn-lg">Eliminar</button>
        -->
        <button name="btn_accion" id="btn_agregar" value="agregar" class="btn btn-outline-success btn-lg">Agregar</button>
        <button name="btn_accion" id="btn_modificar" value="modificar" class="btn btn-outline-warning btn-lg">Modificar</button>
        <button name="btn_accion" id="btn_eliminar" value="eliminar" class="btn btn-outline-danger btn-lg">Eliminar</button>
          
      </form>
      <br>
        
      <table class="table table-hover table-bordered text-center">
        <thead class="table-dark">
          <tr>
            <th>Codigo</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Direccion</th>
            <th>Telefono</th>
            <th>Nacimiento</th>
            <th>Puesto</th>
          </tr>
        </thead>
        <tbody id="tbl_empleados">
         <%
           DefaultTableModel tabla = new DefaultTableModel();
           Empleado empleado = new Empleado();
           
           tabla = empleado.leer();
           
           for(int t=0; t<tabla.getRowCount(); t++) {
            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_p=" + tabla.getValueAt(t, 8) + ">");
            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
            out.println("</tr>");
           }
           
         %>
        </tbody>
      </table>
        
    </div>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>
    <script type="text/javascript">
      $('#tbl_empleados').on('click', 'tr td', function(evt) {
         let target, id, id_p, codigo, nombres, apellidos, direccion, telefono, nacimiento;
         target = $(event.target);
         
         id_p = target.parent().data('id_p');
         id = target.parent().data('id');
         
         codigo = target.parent("tr").find("td").eq(0).html();
         nombres = target.parent("tr").find("td").eq(1).html();
         apellidos = target.parent("tr").find("td").eq(2).html();
         direccion = target.parent("tr").find("td").eq(3).html();
         telefono = target.parent("tr").find("td").eq(4).html();
         nacimiento = target.parent("tr").find("td").eq(5).html();
         
         $("#txt_id").val(id);
         $("#txt_codigo").val(codigo);
         $("#txt_nombres").val(nombres);
         $("#txt_apellidos").val(apellidos);
         $("#txt_direccion").val(direccion);
         $("#txt_telefono").val(telefono);
         $("#txt_fn").val(nacimiento);
         $("#txt_id").val(id);
         $("#drop_puesto").val(id_p);
         
      });
    </script>
  </body>
</html>
