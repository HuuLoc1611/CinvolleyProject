<%-- 
    Document   : accounts
    Created on : Jul 3, 2023, 8:57:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Accounts - Product Admin Template</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  </head>

  <body id="reportsPage">
    <div class="" id="home">
     <%@include file="Hmanage.jsp" %>
      <div class="container mt-5">
        <div class="row tm-content-row">
          <div class="col-12 tm-block-col">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
              <h2 class="tm-block-title">List of Accounts</h2>
              <p class="text-white">Accounts</p>
              <form action="lista" method="post" id="a">
                  <select class="custom-select" name="search" onchange="list()" >
                      <option value="0" >Select account</option>
                <option value="1">Admin</option>
                <option value="2">Customer</option>
              </select>
              </form>
              
            </div>
          </div>
        </div>
        <!-- row -->
        <div class="row tm-content-row">
            <div class="col-sm-12 col-md-12 ">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <div class="tm-product-table-container">
                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>
                                    <tr>
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">USER</th>
                                       <th scope="col">isADMIN</th>
                                        <th scope="col">isActive</th>
                                       <th scope="col">USERNAME</th>
                                        <th scope="col">ADDRESS</th>
                                        <th scope="col">PHONE</th>
                                        <th scope="col">EMAIL</th>
                                        <th scope="col">DOB</th>
                                   </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listA}" var="c">
                                        <tr>      
                                            <td></td>
                                            <td >
                                                ${c.username}
                                            </td>
                                            <td>
                                                <a style="color: black" href="changeadmin?uid=${c.uid}&ad=${c.isAdmin}"> ${c.isAdmin}</a>
                                            </td>
                                             <td>
                                                <a style="color: black" href="changeactive?uid=${c.uid}&ad=${c.isActive}"> ${c.isActive}</a>
                                            </td>
                                            <td>
                                               ${c.a.name}
                                            </td>
                                            <td>${c.a.address}</td>
                                            <td>${c.a.phone}</td>
                                            <td>${c.a.email}</td>
                                            <td>${c.a.dob}</td>
                                        </tr>
                                    </c:forEach>                                                                                                                                         
                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                       
                        
                    </div>
                </div>
      
        </div>
      </div>
      <footer class="tm-footer row tm-mt-small">
        <div class="col-12 font-weight-light">
          <p class="text-center text-white mb-0 px-4 small">
            Copyright &copy; <b>2018</b> All rights reserved. 
            
            Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
          </p>
        </div>
      </footer>
    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
      function list(){
          document.getElementById('a').submit();
      }
      function s(){
          document.getElementById('f').submit();
      }
    </script>
  </body>
</html>

