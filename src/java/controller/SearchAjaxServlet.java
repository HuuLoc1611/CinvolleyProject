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
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SearchAjaxServlet", urlPatterns = {"/searchajax"})
public class SearchAjaxServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchAjaxServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchAjaxServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        DAO d = new DAO();
        PrintWriter out = response.getWriter();
        String max = request.getParameter("maxPrice");
        List<Product> list = d.getAjax(max);
        for (Product o : list) {
            out.println("  <div class=\"col-md-4\">\n"
                    + "                                    <div class=\"card mb-4 product-wap rounded-0\">\n"
                    + "                                        <div class=\"card rounded-0\">\n"
                    + "                                            <img  class=\"card-img rounded-0 img-fluid\" src=\""+o.getImage()+"\">\n"
                    + "                                            <div class=\"card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center\">\n"
                    + "                                                <ul class=\"list-unstyled\">\n"
                    + "                                                    <li><a class=\"btn btn-success text-white\" href=\"pdetail?pid="+o.getPid()+"\"><i class=\"far fa-heart\"></i></a></li>\n"
                    + "                                                    <li><a class=\"btn btn-success text-white mt-2\" href=\"pdetail?pid="+o.getPid()+"\"><i class=\"far fa-eye\"></i></a></li>\n"
                    + "                                                    <li><a class=\"btn btn-success text-white mt-2\" href=\"pdetail?pid="+o.getPid()+"\"><i class=\"fas fa-cart-plus\"></i></a></li>\n"
                    + "                                                </ul>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                        <div class=\"card-body\">\n"
                    + "                                            <a href=\"pdetail?pid=${c.pid}\" class=\"h3 text-decoration-none\">"+o.getName()+"</a>\n"
                    + "                                            <ul class=\"w-100 list-unstyled d-flex justify-content-between mb-0\">\n"
                    + "\n"
                    + "                                                <li class=\"pt-2\">\n"
                    + "                                                    <span class=\"product-color-dot color-dot-red float-left rounded-circle ml-1\"></span>\n"
                    + "                                                    <span class=\"product-color-dot color-dot-blue float-left rounded-circle ml-1\"></span>\n"
                    + "                                                    <span class=\"product-color-dot color-dot-black float-left rounded-circle ml-1\"></span>\n"
                    + "                                                    <span class=\"product-color-dot color-dot-light float-left rounded-circle ml-1\"></span>\n"
                    + "                                                    <span class=\"product-color-dot color-dot-green float-left rounded-circle ml-1\"></span>\n"
                    + "                                                </li>\n"
                    + "                                            </ul>\n"
                    + "                                            <ul class=\"list-unstyled d-flex justify-content-center mb-1\">\n"
                    + "                                                <li>\n"
                    + "                                                    <i class=\"text-warning fa fa-star\"></i>\n"
                    + "                                                    <i class=\"text-warning fa fa-star\"></i>\n"
                    + "                                                    <i class=\"text-warning fa fa-star\"></i>\n"
                    + "                                                    <i class=\"text-muted fa fa-star\"></i>\n"
                    + "                                                    <i class=\"text-muted fa fa-star\"></i>\n"
                    + "                                                </li>\n"
                    + "                                            </ul>\n"
                    + "                                            <del>"+o.getPrice()*1.25+"đ</del>  <span style=\"padding-left: 2px\">"+o.getPrice()*1.25+"đ</span>\n"
                    + "\n"
                    + "                                        </div>\n"
                    + "                                    </div>\n"
                    + "\n"
                    + "                                </div>");
        }
      

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
        processRequest(request, response);
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
