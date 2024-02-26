/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import dal.DaoAccount;
import dal.DaoOrder;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Order;
import model.OrderLine;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name="ListOrderServlet", urlPatterns={"/listorder"})
public class ListOrderServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ListOrderServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListOrderServlet at " + request.getContextPath () + "</h1>");
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
        DaoOrder d = new DaoOrder();
        DaoAccount d1 = new DaoAccount();
        DAO d2 = new DAO();
        
        List<Order> listO = new ArrayList<>();
        listO = d.getAllOrder();
         List<Order> listRe = d.getRevenue();
         List<Account> listA = d1.gettAllAccount("");
         
         List<Product> listP = d2.getAllProduct();
         
         List<Category> listC = d2.getAllCategory(0);
         int n = d.totalQuantity();
          String year = request.getParameter("year");
            request.setAttribute("inputyear", year);
          String month = request.getParameter("month");
          request.setAttribute("inputmonth", month);
          List<Order> getYear = d.getRevenuebyYear(year);
          
          List<Product> p0 = d.getProDuctLIST(0);
          List<Product> p1 = d.getProDuctLIST(1);
          List<Product> p2 = d.getProDuctLIST(2);
          List<Product> p3 = d.getProDuctLIST(3);
          List<Product> p4 = d.getProDuctLIST(4);
          List<Product> p5 = d.getProDuctLIST(5);
          
          
          List<OrderLine> listOL = new ArrayList<>();
          
          List<Order> listCR = new ArrayList<>();
          if(year== null){
              listOL = d.getAllOrderLine();
          } else {
              listOL = d.getByCidSold(month, year);
              listCR = d.getCustomerRich(month, year);
          }
          request.setAttribute("month1", month);
          request.setAttribute("year1", year);
          List<OrderLine> listFE = d.listGetFe();
          request.setAttribute("listFE", listFE);
          
          request.setAttribute("listCR", listCR);
          request.setAttribute("p0", p0.size());
          request.setAttribute("p1", p1.size());
          request.setAttribute("p2", p2.size());
           request.setAttribute("p3", p3.size());
            request.setAttribute("p4", p4.size());
            request.setAttribute("p5", p5.size());
         //   request.setAttribute("p6", listC);
          request.setAttribute("listOL", listOL);
          request.setAttribute("year", getYear);
         request.setAttribute("n", n);
         request.setAttribute("listC", listC);
          request.setAttribute("listA", listA.size());
         request.setAttribute("listP", listP.size());
       
         request.setAttribute("listRe", listRe);
        request.setAttribute("listO", listO);
        request.getRequestDispatcher("manager.jsp").forward(request, response);
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
  //      processRequest(request, response);
       
 
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
