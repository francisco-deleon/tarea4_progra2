/*	
 *  Universidad Mariano Gálvez de Guatemala
 *  Tarea 4 del curso Programación II
 *	
 *  Autor:
 *  Francisco Antonio De León Natareno
*/

package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Empleado;

public class sr_empleado extends HttpServlet {
  Empleado empleado;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {
      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet sr_empleado</title>");
      out.println("</head>");
      out.println("<body>");
      
      empleado = new Empleado(
          Integer.parseInt(request.getParameter("txt_id")),
          request.getParameter("txt_nombres"),
          request.getParameter("txt_apellidos"),
          request.getParameter("txt_direccion"),
          request.getParameter("txt_telefono"),
          request.getParameter("txt_fn"),
          request.getParameter("txt_codigo"),
          Integer.parseInt(request.getParameter("drop_puesto"))
        );
      
      // Variable que almacena el valor del boton presionado
      String btn_accion = request.getParameter("btn_accion");
      
      /*
      // Boton "agregar"
      if("agregar".equals(request.getParameter("btn_agregar"))) {
        if(empleado.agregar() > 0) {
          response.sendRedirect("index.jsp");
        } else {
          out.println("<h1>No se Agrego..................</h1>");
        }
      }
      // Boton "modificar"
      else if ("modificar".equals(request.getParameter("btn_modificar"))) {
        if(empleado.modificar() > 0) {
          response.sendRedirect("index.jsp");
        } else {
          out.println("<h1>No se Modifico..................</h1>");
        }
      }
      // Boton "eliminar"
      else if ("eliminar".equals(request.getParameter("btn_eliminar"))) {
        if(empleado.eliminar() > 0) {
          response.sendRedirect("index.jsp");
        } else {
          out.println("<h1>No se Elimino..................</h1>");
        }
      }
      */
      
      // Switch case basado en el valor del boton presionado
      switch (btn_accion) {
        case "agregar": // Boton "agregar"
          if(empleado.agregar() > 0) {
            response.sendRedirect("index.jsp");
          } else {
            out.println("<h1>No se Agrego..................</h1>");
          }
          
          break;
        
        case "modificar": // Boton "modificar"
          if(empleado.modificar() > 0) {
            response.sendRedirect("index.jsp");
          } else {
            out.println("<h1>No se Modifico..................</h1>");
          }
          
          break;
        
        case "eliminar": // Boton "eliminar"
          if(empleado.eliminar() > 0) {
            response.sendRedirect("index.jsp");
          } else {
            out.println("<h1>No se Elimino..................</h1>");
          }
          
          break;
      }
      
      out.println("</body>");
      out.println("</html>");
    }
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    processRequest(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    processRequest(request, response);
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
