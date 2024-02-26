/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Pdetail;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name="EditProductServlet", urlPatterns={"/editproduct"})
public class EditProductServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProductServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      //  processRequest(request, response);
      DAO d = new DAO();
      
      String pid_raw = request.getParameter("pid");
      int pid = 0;
        try {
          pid=  Integer.parseInt(pid_raw);  
        } catch (Exception e) {
        }
      List<Product> listP = d.getPdetail(pid);
      List<Category> listC = d.getAllCategory(0);
       Category c = d.getCaById(listP.get(0).getCategory().getCid());
       request.setAttribute("c", c);
      request.setAttribute("listP", listP);
      request.setAttribute("listC", listC);
      request.getRequestDispatcher("edit-product.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       // processRequest(request, response);
       String pid = request.getParameter("pid");
       String name = request.getParameter("name");
       String size = request.getParameter("size");
       String price = request.getParameter("price");
       String quantity = request.getParameter("quantity");
       String image = request.getParameter("image");
       String cid = request.getParameter("category");
       String description = request.getParameter("description");
       
       DAO d = new DAO();
       d.update(pid, cid, name, image, description, price, size, quantity);
       int p = 0;
        try {
             p = Integer.parseInt(pid);
        } catch (Exception e) {
        }
       
        List<Product> listP = d.getPdetail(p);
      List<Category> listC = d.getAllCategory(0);
       Category c = d.getCaById(listP.get(0).getCategory().getCid());
       request.setAttribute("c", c);
      request.setAttribute("listP", listP);
      request.setAttribute("listC", listC);
      request.getRequestDispatcher("edit-product.jsp").forward(request, response);
       
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
