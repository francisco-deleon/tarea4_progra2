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
      /* TODO output your page here. You may use following sample code. */
      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet sr_empleado</title>");
      out.println("</head>");
      out.println("<body>");
      
      empleado = new Empleado(
        0,
        request.getParameter("txt_nombres"),
        request.getParameter("txt_apellidos"),
        request.getParameter("txt_direccion"),
        request.getParameter("txt_telefono"),
        request.getParameter("txt_fn"),
        request.getParameter("txt_codigo"),
        Integer.parseInt(request.getParameter("drop_puesto"))
      );
      
      empleado.agregar();
      out.println("<h1>Ingreso Exitoso</h1>");
      
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
