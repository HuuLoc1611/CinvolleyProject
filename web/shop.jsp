

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>VolleyCin - Product Listing Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="assets/css/navbar.css"/>
        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">

        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <!--
            
        TemplateMo 559 Zay Shop
        
        https://templatemo.com/tm-559-zay-shop
        
        -->
    </head>

    <body>
        <!-- Start Top Nav -->
        <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
            <div class="container text-light">
                <div class="w-100 d-flex justify-content-between">
                    <div>
                        <i class="fa fa-envelope mx-2"></i>
                        <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                        <i class="fa fa-phone mx-2"></i>
                        <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                    </div>
                    <div>
                        <a class="text-light" href="https://fb.com/templatemo" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                        <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                        <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                        <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Close Top Nav -->


        <!-- Header -->
        <%@include file="header.jsp"%>
        <!-- Close Header -->

        <!-- Modal -->




        <!-- Start Content -->
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-3">
                    <h1 class="h2 pb-4">
                        <a style="color: black" class="collapsed d-flex justify-content-between h3 text-decoration-none" href="product">Categories</a></h1>
                    </h1>

                    <ul style="color: black">
                        <c:forEach items="${requestScope.listC}" var="c">
                            <li class="pb-3">
                                <a style="color: black" class="collapsed d-flex justify-content-between h3 text-decoration-none" href="category?cid=${c.cid}" >
                                    ${c.name}    
                                    <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                                </a>
                            </li>
                        </c:forEach>      
                    </ul>

                    <div >
                        <header>
                            <h2>Price Range</h2>
                            <p>Use slider or enter min and max price</p>
                        </header>
                        <div class="price-input">
                            <div class="field">
                                <span>Min</span>
                                <input type="number" class="input-min" value="${minPrice}">
                            </div>
                            <div class="separator">-</div>
                            <div class="field">
                                <span>Max</span>
                                <input type="number" class="input-max" value="${maxPrice}">

                            </div>
                        </div>
                        <div class="slider">
                            <div class="progress"></div>
                        </div>
                        <div class="range-input">
                            <form action="sort" id = "p">
                                <input type="range"  value="${minPrice}" name="minPrice" class="range-min" min="0" max="5000000" step="200">
                                <input type="range" oninput="price(this)" value="${maxPrice}" name="maxPrice" class="range-max" min="0" max="5000000"  step="200">
                                <input type="hidden" name="cid" value="${cid}"> 
                                <input type="hidden" name="search" value="${search}">
                                <input type="hidden" name="op" value="${op}">
                                <input type="submit" value="OK">
                            </form>
                        </div>
                    </div>

                </div>

                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-md-6">
                            FOUND ${requestScope.size} ITEMS
                        </div>

                        <div  class="col-md-6 pb-4">

                            <form action="sort" id ="f" >
                                <div class="d-flex" >
                                    <input type="hidden" name="cid" value="${cid}"> 
                                    <input type="hidden" name="search" value="${search}">
                                    <input type="hidden"  name="minPrice" value="${minPrice}">                               
                                    <input type="hidden"  name="maxPrice" value="${maxPrice}">
                                    <select class="form-control" name = "op" onchange="s()">
                                        <option >Featured</option>
                                        <option value="1">A to Z</option>
                                        <option value="2">Min to max</option>
                                        <option value="3">Max to min</option>
                                    </select> 
                                </div>
                            </form>

                        </div>

                        <div class="row" id="content">
                            <c:forEach items="${requestScope.listP}" var="c">
                                <div class="col-md-4">
                                    <div class="card mb-4 product-wap rounded-0">
                                        <div class="card rounded-0">
                                            <img  class="card-img rounded-0 img-fluid" src="${c.image}">
                                            <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                                <ul class="list-unstyled">
                                                    <li><a class="btn btn-success text-white" href="pdetail?pid=${c.pid}"><i class="far fa-heart"></i></a></li>
                                                    <li><a class="btn btn-success text-white mt-2" href="pdetail?pid=${c.pid}"><i class="far fa-eye"></i></a></li>
                                                    <li><a class="btn btn-success text-white mt-2" href="pdetail?pid=${c.pid}"><i class="fas fa-cart-plus"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <a href="pdetail?pid=${c.pid}" class="h3 text-decoration-none">${c.name}</a>
                                            <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">

                                                <li class="pt-2">
                                                    <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
                                                    <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
                                                    <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
                                                    <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
                                                    <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
                                                </li>
                                            </ul>
                                            <ul class="list-unstyled d-flex justify-content-center mb-1">
                                                <li>
                                                    <i class="text-warning fa fa-star"></i>
                                                    <i class="text-warning fa fa-star"></i>
                                                    <i class="text-warning fa fa-star"></i>
                                                    <i class="text-muted fa fa-star"></i>
                                                    <i class="text-muted fa fa-star"></i>
                                                </li>
                                            </ul>
                                            <del> ${c.price*1.25}đ</del>  <span style="padding-left: 2px">${c.price}đ</span>

                                        </div>
                                    </div>

                                </div>
                            </c:forEach>
                            <div class="row">                       
                                <ul class="pagination pagination-lg justify-content-end">
                                    <c:forEach begin="1" end="${n}" var="i">
                                        <li class="page-item">                                      
                                            <a class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="product?index=${i}" tabindex="-1">${i}</a>                                        
                                        </li>
                                    </c:forEach>
                                </ul>


                            </div>

                        </div>

                    </div>

                </div>
            </div>
            <!-- End Content -->

            <!-- Start Brands -->
            <section class="bg-light py-5">
                <div class="container my-4">
                    <div class="row text-center py-3">
                        <div class="col-lg-6 m-auto">
                            <h1 class="h1">Our Brands</h1>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                Lorem ipsum dolor sit amet.
                            </p>
                        </div>
                        <div class="col-lg-9 m-auto tempaltemo-carousel">
                            <div class="row d-flex flex-row">
                                <!--Controls-->
                                <div class="col-1 align-self-center">
                                    <a class="h1" href="#multi-item-example" role="button" data-bs-slide="prev">
                                        <i class="text-light fas fa-chevron-left"></i>
                                    </a>
                                </div>
                                <!--End Controls-->

                                <!--Carousel Wrapper-->
                                <div class="col">
                                    <div class="carousel slide carousel-multi-item pt-2 pt-md-0" id="multi-item-example" data-bs-ride="carousel">
                                        <!--Slides-->
                                        <div class="carousel-inner product-links-wap" role="listbox">

                                            <!--First slide-->
                                            <div class="carousel-item active">
                                                <div class="row">
                                                    <div class="col-3 p-md-5">
                                                        <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_01.png" alt="Brand Logo"></a>
                                                    </div>
                                                    <div class="col-3 p-md-5">
                                                        <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_02.png" alt="Brand Logo"></a>
                                                    </div>
                                                    <div class="col-3 p-md-5">
                                                        <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_03.png" alt="Brand Logo"></a>
                                                    </div>
                                                    <div class="col-3 p-md-5">
                                                        <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_04.png" alt="Brand Logo"></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--End First slide-->

                                            <!--Second slide-->
                                            <div class="carousel-item">
                                                <div class="row">
                                                    <div class="col-3 p-md-5">
                                                        <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_01.png" alt="Brand Logo"></a>
                                                    </div>
                                                    <div class="col-3 p-md-5">
                                                        <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_02.png" alt="Brand Logo"></a>
                                                    </div>
                                                    <div class="col-3 p-md-5">
                                                        <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_03.png" alt="Brand Logo"></a>
                                                    </div>
                                                    <div class="col-3 p-md-5">
                                                        <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_04.png" alt="Brand Logo"></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--End Second slide-->

                                            <!--Third slide-->
                                            <div class="carousel-item">
                                                <div class="row">
                                                    <div class="col-3 p-md-5">
                                                        <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_01.png" alt="Brand Logo"></a>
                                                    </div>
                                                    <div class="col-3 p-md-5">
                                                        <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_02.png" alt="Brand Logo"></a>
                                                    </div>
                                                    <div class="col-3 p-md-5">
                                                        <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_03.png" alt="Brand Logo"></a>
                                                    </div>
                                                    <div class="col-3 p-md-5">
                                                        <a href="#"><img class="img-fluid brand-img" src="assets/img/brand_04.png" alt="Brand Logo"></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--End Third slide-->

                                        </div>
                                        <!--End Slides-->
                                    </div>
                                </div>
                                <!--End Carousel Wrapper-->

                                <!--Controls-->
                                <div class="col-1 align-self-center">
                                    <a class="h1" href="#multi-item-example" role="button" data-bs-slide="next">
                                        <i class="text-light fas fa-chevron-right"></i>
                                    </a>
                                </div>
                                <!--End Controls-->
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!--End Brands-->


            <!-- Start Footer -->
            <%@include file="footer.jsp" %>
            <!-- End Footer -->

            <!-- Start Script -->
            <script src="assets/js/jquery-1.11.0.min.js"></script>
            <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
            <script src="assets/js/bootstrap.bundle.min.js"></script>
            <script src="assets/js/templatemo.js"></script>
            <script src="assets/js/custom.js"></script>
            <!-- End Script -->
            <script type="text/javascript">
                                       function s() {
                                           document.getElementById('f').submit();
                                       }
                                       function price(param) {
                                           var price = param.value;
                                           $.ajax(
                                                   {type: 'get',
                                                       url: '/project/searchajax',
                                                       data: {
                                                         maxPrice: price
                                                       },
                                                       success: function (data) {
                                                           var row = document.getElementById("content");
                                                           row.innerHTML = data;
                                                       }
                                                   });
                                       }

            </script>
    </body>


</html>

<link rel="stylesheet" href="assets/css/intput-range.css"/>
<script src="assets/js/intput-range.js"></script>
