<%-- 
    Document   : cart
    Created on : Jun 28, 2023, 11:54:42 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="assets/css/cart.css"/>

<div class="container px-3 my-5 clearfix">
    <!-- Shopping cart table -->
    <div class="card">
        <div class="card-header">
            <h2>HISTORY ORDER</h2>
        </div>
        <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered m-0">
                <thead>
                  <tr>
                    <!-- Set columns width -->
                    <th class="text-center py-3 px-4" style="width: 300px;">Product Name &amp; Details</th>

                    <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                    <th class="text-center py-3 px-4" style="width: 80px;">Quantity</th> 
                                        <th class="text-right py-3 px-4" style="width: 120px;">Date</th>
                    <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
                  
                  </tr>
                </thead>
                <tbody>
                  
                    <c:forEach items="${requestScope.listO}" var="i">
                  <tr>
                     
                            <td class="p-4">
                      
                      <div class="media align-items-center">
                        <img src="${i.product.image}" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                        <div class="media-body">
                          <a href="#" class="d-block text-dark">${i.product.name}</a>
                         
                        </div>
                      </div>
                    </td>
                             <td class="text-right font-weight-semibold align-middle p-4">${i.product.price}đ</td>
                     <td class="text-right font-weight-semibold align-middle p-4">${i.o.quantity}</td>
               <td class="text-right font-weight-semibold align-middle p-4"> ${i.date}
                    </td>         
                    <td class="text-right font-weight-semibold align-middle p-4">${(i.product.price*i.o.quantity)}đ</td>
                         
                     
                  </tr>
                   </c:forEach>
         </tbody>
              </table>
            </div>
            <!-- / Shopping cart table -->
        
            <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
             
              
              
              </div>
            </div>
        
            <div class="float-right">
               &nbsp;  <a href="product"class="btn btn-lg btn-default md-btn-flat mt-2 mr-3">Back to shopping</a>
              
            </div>
        
          </div>
      </div>
  </div>