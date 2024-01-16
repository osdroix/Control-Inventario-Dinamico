/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend;

import entidades.productos;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author osdroix
 */
public class Modelado extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    crud obj = new crud();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
    String accion = request.getParameter("accion");
        String fechas;
               java.util.Date fecha = new Date();
               fechas = fecha.toString();
           productos e = new productos();
           
                String Nom,Des,Id;
                int Tipo,Codigo;
                double MXN, MXN4;
               

                Statement set = null;
                Connection con = conexion.getConnection();
                set = con.createStatement(); 
                
        switch(accion){
            case "Registro":
                Part img = request.getPart("img");
                InputStream inputstream = img.getInputStream();
                 Nom = request.getParameter("nom");
                Des = request.getParameter("des");
                Tipo= Integer.parseInt(request.getParameter("categoria"));
                Codigo = Integer.parseInt(request.getParameter("codigo"));
                MXN = Float.parseFloat(request.getParameter("MXN"));
                MXN4 = Float.parseFloat(request.getParameter("MXN-4"));

                   e.setId_buscador(Codigo);
                   e.setId_tipo_producto(Tipo);
                   e.setNom_producto(Nom);
                   e.setImg(inputstream);
                   e.setDes_producto(Des);
                   e.setMXN_producto((float) MXN);
                   e.setMXN_producto_4((float) MXN4);
                   System.out.println(inputstream);
                   int query = crud.guardar(e);


                      response.sendRedirect("index.jsp");
             break;
                case "Modificar":;
                Id =request.getParameter("id");
                Nom = request.getParameter("nom");
                Des = request.getParameter("des");
                String categoria= request.getParameter("categoria");
                Codigo = Integer.parseInt(request.getParameter("codigo"));
                MXN = Float.parseFloat(request.getParameter("MXN"));
                MXN4 = Float.parseFloat(request.getParameter("MXN-4"));
               
                     String q="Update productos set Id_buscador='"+Codigo+"',Id_tipo_producto='"+categoria+"',Nom_producto='"+Nom+"',"
                        + "Des_producto='"+Des+"',MXN_producto='"+MXN+"',MXN_producto_='"+MXN4+"' where Id_producto='"+Id+"'";
                set.executeUpdate(q);
                      response.sendRedirect("index.jsp");
             break;
                case "eliminar":;
                
                    String id = request.getParameter("id");
                      int editar = set.executeUpdate(""
                            + "DELETE from productos where Id_producto="+id+"");
                            response.sendRedirect("index.jsp");
                            con.close(); 
                break;
    }
        }}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        obj.Listaimg(id, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Modelado.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
