<%-- 
    Universidad Mariano Gálvez de Guatemala
    Tarea 4 del curso Programación II

    Autor: Francisco Antonio De León Natareno
    Documento: index.jsp
--%>
<%@page import="modelo.Puesto" %>
<%@page import="java.util.HashMap" %>
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
        <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-outline-success btn-lg">Agregar</button>
          
      </form>
        
    </div>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>
  </body>
</html>
