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
            <h2>Shopping Cart</h2>
        </div>
        <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered m-0">
                <thead>
                  <tr>
                    <!-- Set columns width -->
                    <th class="text-center py-3 px-4" style="width: 300px;">Product Name &amp; Details</th>
                    <th class="text-right py-3 px-4" style="width: 80px;">Size</th>
                    <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                    <th class="text-center py-3 px-4" style="width: 100px;">Quantity</th> 
                    <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
                    <th class="text-center align-middle py-3 px-0" style="width: 40px;"><a href="#" class="shop-tooltip float-none text-light" title="" data-original-title="Clear cart"><i class="ino ion-md-trash"></i></a></th>
                  </tr>
                </thead>
                <tbody>
                   <c:set var="o" value="${requestScope.cart}"/>
                      <c:forEach items="${o.items}" var="i">
                  <tr>
                     
                            <td class="p-4">
                      
                      <div class="media align-items-center">
                        <img src="${i.product.image}" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                        <div class="media-body">
                          <a href="#" class="d-block text-dark">${i.product.name}</a>
                         
                        </div>
                      </div>
                    </td>
                     <td class="text-right font-weight-semibold align-middle p-4">${i.size.name}</td>
                    <td class="text-right font-weight-semibold align-middle p-4">${i.product.price}đ</td>
                    <td class="text-right font-weight-semibold align-middle p-4">
                        <button><a href="process?num=-1&pid=${i.product.pid}&sid=${i.size.sid}">-</a></button>
                        ${i.quantity}
                       
                         <button><a href="process?num=1&pid=${i.product.pid}&sid=${i.size.sid}">+</a></button>
                    </td>
                    <td class="text-right font-weight-semibold align-middle p-4">${(i.price*i.quantity)}đ</td>
                    <td class="text-center align-middle px-0">
                        <form action="process" method="post">
                            <input type="hidden" name="pid" value="${i.product.pid}">
                            <input type="hidden" name="sid" value="${i.size.sid}">
                            <input type="submit" value="X">
                        </form>
                    </td>                
                     
                  </tr>
                   </c:forEach>
         </tbody>
              </table>
            </div>
            <!-- / Shopping cart table -->
        
            <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
             
              
                <div class="text-right mt-4">
                 Total price   <div class="text-large"><strong>${o.totalMoney}đ</strong></div>
                </div>
              </div>
            </div>
        
            <div class="float-right">
             &nbsp;  <a href="product"class="btn btn-lg btn-default md-btn-flat mt-2 mr-3">Back to shopping</a>
               <a href="history"class="btn btn-lg btn-default md-btn-flat mt-2 mr-3">History order</a>
               <form action="checkout" method="post">            
                  &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="CHECKOUT">
              </form> 
              
            </div>
        
          </div>
      </div>
  </div>