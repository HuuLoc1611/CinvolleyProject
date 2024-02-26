/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DaoAccount;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.AccountDetail;

/**
 *
 * @author Admin
 */
@WebServlet(name="PfileServlet", urlPatterns={"/p"})
public class PfileServlet extends HttpServlet {
   
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
            out.println("<title>Servlet PfileServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PfileServlet at " + request.getContextPath () + "</h1>");
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
           response.setContentType("text/html;charset=UTF-8");
          request.setCharacterEncoding("UTF-8");
       // processRequest(request, response);
      
       AccountDetail a = new AccountDetail();
    DaoAccount d = new DaoAccount();
     HttpSession session = request.getSession();
      Account a1 =  (Account) session.getAttribute("user");
     
     if(a1 == null){
         response.sendRedirect("login.jsp");
     } else {
          int aid = a1.getUid();
     a = d.getAById(aid);
          request.setAttribute("a", a);
     request.getRequestDispatcher("profile.jsp").forward(request, response);
     }
    
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
       response.setContentType("text/html;charset=UTF-8");
          request.setCharacterEncoding("UTF-8");
       String name = request.getParameter("name");
       String add = request.getParameter("address");
       String phone = request.getParameter("phone");
       String email = request.getParameter("email");
       String dob = request.getParameter("dob");   
       HttpSession session = request.getSession();
               DaoAccount d = new DaoAccount();
       Account a1 =  (Account) session.getAttribute("user");
       if(a1 == null){
           response.sendRedirect("login.jsp");
       }else if(name.contains(dob)){
           {
            int aid = a1.getUid();
                d.upDate(name, add, phone, email, email, dob, aid);
         AccountDetail a = d.getAById(aid);
           request.setAttribute("a", a);         
      request.getRequestDispatcher("profile.jsp").forward(request, response);     
       }
        }
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
