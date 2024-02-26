<%-- 
    Document   : products
    Created on : Jul 3, 2023, 8:59:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Product Page - Admin HTML Template</title>
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
        <%@include file="Hmanage.jsp" %>
        <div class="container mt-5">
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <div class="tm-product-table-container">
                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>
                                    <tr>
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">PRODUCT NAME</th>
                                       <th scope="col">PRICE</th>
                                        <th scope="col">&nbsp;</th>
                                   </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listP}" var="c">
                                        <tr>
                                            <th scope="row">
                                                <img src="${c.image}" class="d-block ui-w-40 ui-bordered mr-4" width="60px" height=60px">
                                            </th>
                                            <td >
                                                <a href="editproduct?pid=${c.pid}" style="font-size: 15px" class="text-decoration-none">${c.name}</a>
                                            </td>
                                            <td>${c.price}</td>
                                            <td>
                                                <a href="deleteproduct?pid=${c.pid}" class="tm-product-delete-link">
                                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>                                                                                                                                         
                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                        <a
                            href="add-product.jsp"
                            class="btn btn-primary btn-block text-uppercase mb-3">Add new product</a>
                        
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-product-categories">
                        <h2 class="tm-block-title">Product Categories</h2>
                        <div class="tm-product-table-container">
                            <table class="table tm-table-small tm-product-table">
                                <tbody>
                                    <c:forEach items="${requestScope.listC}" var="c">
                                        <tr>
                                            <td>
                                                <a href="editcategory?cid=${c.cid}"  style="font-size: 15px; color: white" class="text-decoration-none"> ${c.name}</a>
                                            </td>
                                            <td class="text-center">
                                                <a onclick="doDeleteCate('${c.cid}')"  class="tm-product-delete-link">
                                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->
                        <a
                            href="add-category.jsp"
                            class="btn btn-primary btn-block text-uppercase mb-3">Add new category</a>
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

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script type="text/javascript">
         
            
             function doDeleteCate(id) {
               if(window.confirm("Are you sure to delete?")){
                   window.location.href= 'deletecategory?cid=' + id;
        } 
    }
  
        </script>
    </body>
</html>