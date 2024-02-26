/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import dal.Sort;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name="SearcBySort", urlPatterns={"/sort"})
public class SearcBySort extends HttpServlet {
   
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
            out.println("<title>Servlet SearcBySort</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearcBySort at " + request.getContextPath () + "</h1>");
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
       // processRequest(request, response);
                DAO d = new DAO();
      List<Product> listP = new ArrayList<>();
       List<Category> listC = new ArrayList<>();
       listC = d.getAllCategory(0);
       String cid = request.getParameter("cid");
       String search = request.getParameter("search");
       String min = request.getParameter("minPrice");
        String max = request.getParameter("maxPrice");
       String o = request.getParameter("op");
       String op="";
                    if(cid.isEmpty() && search.isEmpty() && !min.isEmpty()){
                        listP = d.searchPro(null, null, min, max, null);
                    }
                    if(!cid.isEmpty() && search.isEmpty() && !min.isEmpty() && op.isEmpty()){
                        listP = d.searchPro2(cid, null, min, max, null);
                    }
                    if(cid.isEmpty() && !search.isEmpty() && !min.isEmpty() && op.isEmpty()){
                        listP = d.searchPro2(null, search, min, max, null);
                    }
       if("1".equals(o)){
           op = "name";
       } else if ("2".equals(o)){
           op = "price";
       }
       if(o.equals("1") || o.equals("2")){
     listP = d.searchPro(null, null, null, null, op);
      if(!cid.isEmpty() && search.isEmpty() && min.isEmpty()){
        listP=d.searchPro(cid, null, null, null, op);
      }
      if(cid.isEmpty() && !search.isEmpty() && min.isEmpty()){
          listP=d.searchPro(null, search, null, null, op);
      }
      if(cid.isEmpty() && search.isEmpty() && !min.isEmpty()){
          listP = d.searchPro2(null, null, min, max, op);
      }      
     if (search.isEmpty() && !cid.isEmpty() && !min.isEmpty()) {
           listP=d.searchPro(cid, null, min, max, op);
       }
        if (!search.isEmpty() && cid.isEmpty() && !min.isEmpty()) {
           listP=d.searchPro(null, search, min, max, op);
        }
       }

        if(o.equals("3")){
            op = "price";
             listP = d.maxtomin(null, null, null, null, op);
            if(!cid.isEmpty() && search.isEmpty() && min.isEmpty()){
        listP=d.maxtomin(cid, null, null, null, op);
      }
      if(cid.isEmpty() && !search.isEmpty() && min.isEmpty()){
          listP=d.maxtomin(null, search, null, null, op);
      }
      if(cid.isEmpty() && search.isEmpty() && !min.isEmpty()){
           listP = d.maxtomin(null, null, min, max, op);
       }

     if (search.isEmpty() && !cid.isEmpty() && !min.isEmpty()) {
           listP=d.maxtomin(cid, null, min, max, op);
       }
        if (!search.isEmpty() && cid.isEmpty() && !min.isEmpty()) {
           listP=d.maxtomin(null, search, min, max, op);
        }
        }
        request.setAttribute("cid", cid);
        request.setAttribute("op", o);
        request.setAttribute("minPrice", min);
        request.setAttribute("maxPrice", max);
        request.setAttribute("search", search);
        request.setAttribute("size", listP.size());
        request.setAttribute("listP", listP);
      request.setAttribute("listC", listC);
      request.getRequestDispatcher("shop.jsp").forward(request, response);
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
