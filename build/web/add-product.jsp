<%-- 
    Document   : add-product
    Created on : Jul 3, 2023, 8:57:48 PM
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
    <title>Add Product - Dashboard HTML Template</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
    <!-- http://api.jqueryui.com/datepicker/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  </head>

  <body>
     <%@include file="Hmanage.jsp" %>
    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">Add Product</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
                <form action="addproduct" class="tm-edit-product-form">
                 <div class="form-group mb-3">
                                            <label
                                                for="name"
                                                >Product Name
                                            </label>
                                            <input
                                                name="name"
                                                type="text"
                                                class="form-control validate"
                                                />
                                            
                                        </div>
                                        <div class="form-group mb-3">

                                            <label
                                                for="category"
                                                >Category</label
                                            >
                                            <select
                                                class="custom-select tm-select-accounts"
                                                name ="category"
                                                >                       
                                                <option selected ">Category</option>
                                                <option value="1">Giày bóng chuyền</option>
                                                <option value="2">Quần Áo bóng chuyền</option>
                                                <option value="3">Bóng chính hãng</option>
                                                <option value="4">Phụ kiện hỗ trợ</option>
                                                <option value="5">Đồ lưu niệm</option>

                                            </select>                    
                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="size" 
                                                >  Size &nbsp;
                                            </label>
                                            <input type="checkbox" name="size" value="1"> &nbsp;40 &nbsp;
                                            <input type="checkbox" name="size" value="2"> &nbsp;41 &nbsp;
                                            <input type="checkbox" name="size" value="3">&nbsp;42 &nbsp;
                                            <input type="checkbox" name="size" value="4">&nbsp;43 &nbsp;
                                            <input type="checkbox" name="size" value="5">&nbsp;44 &nbsp;
                                            <input type="checkbox" name="size" value="6">&nbsp;XL &nbsp;
                                            <input type="checkbox" name="size" value="7">&nbsp;L &nbsp;
                                            <input type="checkbox" name="size" value="8">&nbsp;M
                                        </div>
                                        <div class="row">
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label
                                                    for="price"
                                                    >Price
                                                </label>
                                                <input
                                                    name="price"
                                                    type="text"

                                                    class="form-control validate"
                                                    />
                                            </div>
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label
                                                    for="stock"
                                                    >Quantity
                                                </label>
                                                <input
                                                    name="quantity"
                                                    type="number"
                                                   

                                                    class="form-control validate"
                                                    />
                                            </div>
                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="description"
                                                >Description</label
                                            >
                                            <textarea                    
                                                class="form-control validate tm-small"
                                                rows="5"
                                                required
                                                name="description"
                                                ></textarea>
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                                                        <div class="custom-file mt-3 mb-3">
                                                                            <label style="color: white"
                                                                                for="Image">Image</label>
                                        <input
                                            type="text"
                                            name="image"
                                            class="form-control validate"

                                            
                                            />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
                                </div>
            </form>
            </div>
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
    <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
    <!-- https://jqueryui.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
      $(function() {
        $("#expire_date").datepicker();
      });
    </script>
  </body>
</html>

