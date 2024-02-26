
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <title>VolleyCin</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/navbar.css"/>
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
        <%@include file="header.jsp" %>
        <!-- Close Header -->

        <!-- Modal -->




        <!-- Start Banner Hero -->
        <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
            <ol class="carousel-indicators">
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
                <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div >
                        <img class="img-fluid" src="https://bizweb.dktcdn.net/100/180/515/themes/683553/assets/slider_2.png?1663218776960" alt="">
                    </div>
                </div>

                <div class="carousel-item">
                    <div >
                        <img style="width: 150%" class="img-fluid" src="https://png.pngtree.com/thumb_back/fw800/back_our/20190617/ourmid/pngtree-volleyball-sport-vector-background-material-image_127264.jpg" alt="">
                    </div>
                </div>

                <div class="carousel-item">
                    <div >
                        <img width="100%" height="10%"  src="https://bizweb.dktcdn.net/100/180/515/themes/683553/assets/slider_4.png?1663218776960" alt="">
                    </div>
                </div>
            </div>

            <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
                <i class="fas fa-chevron-left"></i>
            </a>
            <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
                <i class="fas fa-chevron-right"></i>
            </a>
        </div>
        
          <section style="background: white" >
            <div class="row text-center pt-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">Categories of The Month</h1>
                    <p>
                    </p>
                </div>
            </div>
            <div class="row">
                <c:forEach items="${requestScope.listC}" var="c">

                    <div class="col-12 col-md-4 p-5 mt-3">
                        <a href="category?cid=${c.cid}" >
                            <c:if test="${c.cid==1}">
                                <img class="rounded-circle img-fluid border" src="https://bizweb.dktcdn.net/thumb/large/100/180/515/products/vswift-ff-4.png?v=1617949676797" alt="alt"/>
                            </c:if>
                            <c:if test="${c.cid==2}">
                                <img class="rounded-circle img-fluid border" src="https://img.websosanh.vn/v10/users/review/images/cuqc55a4mwhvn/quan-ao-bong-chuyen-mizuno-1.jpg?compress=85" alt="alt"/>
                            </c:if>
                            <c:if test="${c.cid==3}">
                                <img class="rounded-circle img-fluid border" src="https://product.hstatic.net/1000288768/product/20_-_copy_c76bae7af3504a8d8383b7fe9239912e_master.jpg" alt="alt"/>
                            </c:if>
                        </a>
                        <h5 class="text-center mt-3 mb-3"></h5>
                        <p class="text-center"><a href="category?cid=${c.cid}" class="btn btn-success">${c.name}</a></p>
                    </div>


                </c:forEach>
            </div>
        </section>
        <!-- End Banner Hero -->
        <section style="background: whitesmoke" class="">
            <div class="container py-5">
                <div class="row text-center py-3">
                    <div class="col-lg-6 m-auto">
                        <h1 class="h1">Just Arrived</h1>
                        <p>

                        </p>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${requestScope.listPP}" var="c">
                                <div class="col-12 col-md-4 mb-4">
                        <div class="card h-100">
                            <a href="pdetail?pid=${c.pid}">
                                <img src="${c.image}" class="card-img-top" alt="...">
                            </a>
                            <div class="card-body">
                                <ul class="list-unstyled d-flex justify-content-between">
                                    <li>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-warning fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                        <i class="text-muted fa fa-star"></i>
                                    </li>
                                    <li class="text-muted text-right">${c.price}</li>
                                </ul>
                                    <a href="pdetail?pid=${c.pid}" style="font-size: 15px" class="text-decoration-none">${c.name}</a>
                                <p class="card-text">
                                   
                                </p>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
            
                                       
                </div>
            </div>
        </section>

        <!-- Start Categories of The Month -->
      
        <!-- End Categories of The Month -->


        <!-- Start Featured Product -->
        <section class="bg-light">
            <div class="container py-5">
                <div class="row text-center py-3">
                    <div class="col-lg-6 m-auto">
                        <h1 class="h1">Featured Product</h1>
                        <p>                         
                        </p>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${requestScope.listP}" var="c">
                        <div class="col-12 col-md-4 mb-4">
                            <div class="card h-100">
                                <a href="pdetail?pid=${c.pid}">
                                    <img src="${c.image}" class="card-img-top" alt="...">
                                </a>
                                <div class="card-body">
                                    <ul class="list-unstyled d-flex justify-content-between">
                                        <li>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                        </li>
                                        <li class="text-muted text-right">${c.price}</li>
                                    </ul>
                                    <a href="pdetail?pid=${c.pid}" class="h2 text-decoration-none text-dark">${c.name}</a>

                                    <p class="text-muted">Reviews (24)</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>
            </div>
        </section>

        <!-- End Featured Product -->



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
    </body>
    <script >
        function s() {
            document.getElementById('f').submit();

        }
    </script>
</html>