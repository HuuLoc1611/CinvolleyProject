<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Zay Shop - Product Detail Page</title>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="assets/css/navbar.css"/>
        <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/newcss.css"/>
        <script src="ck/ckeditor/ckeditor.js"></script>







        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">

        <!-- Slick -->
        <link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">
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
                        <a class="navbar-sm-brand text-light text-decoration-nonse" href="tel:010-020-0340">010-020-0340</a>
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



        <!-- Open Content -->


        <section class="bg-light">
            <c:forEach items="${requestScope.listP}" var="c">
                <div class="container pb-5">
                    <div class="row">
                        <div class="col-lg-5 mt-5">
                            <div class="card mb-3">
                                <img class="card-img img-fluid" src="${c.image}" id="product-detail">
                            </div>
                            <div class="row">
                                <!--Start Carousel Wrapper-->
                                <div id="multi-item-example" class="col-10 carousel slide carousel-multi-item" data-bs-ride="carousel">
                                    <!--Start Slides-->
                                    <div class="carousel-inner product-links-wap" role="listbox">

                                        <!--First slide-->
                                        <div class="carousel-item active">
                                            <div class="row">
                                                <div class="col-4">

                                                </div>
                                                <div class="col-4">

                                                </div>
                                                <div class="col-4">

                                                </div>
                                            </div>
                                        </div>
                                        <!--/.First slide-->

                                        <!--Second slide-->
                                        <div class="carousel-item">
                                            <div class="row">
                                                <div class="col-4">

                                                </div>
                                                <div class="col-4">

                                                </div>
                                                <div class="col-4">

                                                </div>
                                            </div>
                                        </div>
                                        <!--/.Second slide-->

                                        <!--Third slide-->
                                        <div class="carousel-item">
                                            <div class="row">
                                                <div class="col-4">

                                                </div>
                                                <div class="col-4">

                                                </div>
                                                <div class="col-4">

                                                </div>
                                            </div>
                                        </div>
                                        <!--/.Third slide-->
                                    </div>
                                    <!--End Slides-->
                                </div>
                                <!--End Carousel Wrapper-->
                                <!--Start Controls-->

                                <!--End Controls-->
                            </div>
                        </div>
                        <!-- col end -->
                        <div class="col-lg-7 mt-5">
                            <div class="card">
                                <div class="card-body">
                                    <h1 class="h2">${c.name}</h1>
                                    <p class="h3 py-2">${c.price}đ</p>
                                    <p class="py-2">
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-secondary"></i>
                                        <span class="list-inline-item text-dark">Rating 4.8 | 36 Comments</span>
                                    </p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <h6>ACSIC</h6>
                                        </li>
                                        <li class="list-inline-item">
                                            <p class="text-muted"><strong>Easy Wear</strong></p>
                                        </li>
                                    </ul>

                                    <h6>Description:</h6>
                                    <p>${c.description}</p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <h6>Avaliable Color :</h6>
                                        </li>
                                        <li class="list-inline-item">
                                            <p class="text-muted"><strong>ALL COLOR</strong></p>
                                        </li>
                                    </ul>

                                    <h6>Specification:</h6>


                                    <form action="" method="post" name="f" >

                                        <div class="row">
                                            <div class="col-auto">
                                                <ul class="list-inline pb-3">

                                                    <li class="list-inline-item">Size :
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <c:forEach items="${c.list}" var = "o">                                                       
                                                            <input type="radio"  name="size" value="${o.size.sid}" > ${o.size.name}  
                                                        </c:forEach>
                                                    </li>
                                                    &nbsp;     Quantity
                                                    <li class="list-inline-item"><span class="badge bg-secondary" id="var-value">
                                                            <input type="number" name="num" class="input-min">
                                                        </span></li>




                                                </ul>
                                            </div>

                                        </div>
                                        <div class="row pb-3">
                                            <div class="col d-grid">
                                                <input type="button" class="btn btn-success btn-lg" onclick="buy('${pid}')" value="Buy Item">
                                            </div>
                                            <div class="col d-grid">
                                                <input type="button" class="btn btn-success btn-lg" onclick="buy('${pid}')" value="Add to cart">
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </section>
        <br/><br/>
        <div class="form-group">

            <form action="addcomment">
                &nbsp;    <a href="https://vi.imgbb.com/" target="blank">Get link image in here</a>
                <textarea name="comment" id="editor1" rows="1" cols="100"> </textarea>
                <input type="hidden" name="pid" value="${pid}">
                <input type="hidden" name="uid" value="${sessionScope.user.uid}">

                <input type="submit" value="COMMENT">
            </form>



        </div>
                
        <div id="x">
            <!--heading--->
            <div class="testimonial-heading">
                <span>Comments</span>
                <h1>Clients Says</h1>
            </div>
            
              <c:forEach items="${requestScope.listCO}" var="c">
                  <div class="comment">
                         
                              <div class="">
                        <div class="profile">
 
                            <div class="name-user">
                                &nbsp;       <strong>${c.a.name}  </strong>
                              &nbsp;    <span>${c.date}</span>
                            </div>
                        </div>


                    </div>
                    <!--Comments---------------------------------------->
                    <div class="client-comment">
                      &nbsp;    <p>${c.comment} 
                       
                        </p>                   
        
                    
                       </div>
 </div>
                    </c:forEach>
                  
          
       
                  </div>
<input type="hidden" name="pid" value="${pid}" id="pidh">
                  <button onclick="loadmore()"style="width: 100px; height: 30px" class="btn-primary">LOADMORE</button>

        <!-- Close Content -->

        <!-- Start Article -->
        <section class="py-5">
            <div class="container">
                <div class="row text-left p-2 pb-3">
                    <h4>Related Products</h4>
                </div>

                <!--Start Carousel Wrapper-->
                <div id="carousel-related-product">

                    <c:forEach items="${requestScope.listPP}" var="c">
                        <div class="p-2 pb-3">
                            <div class="product-wap card rounded-0">
                                <div class="card rounded-0">
                                    <img class="card-img rounded-0 img-fluid" src="${c.image}">
                                    <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                        <ul class="list-unstyled">
                                            <li><a class="btn btn-success text-white" href="pdetail?pid=${c.pid}"><i class="far fa-heart"></i></a></li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <a href="pdetail?pid=${c.pid}" class="h3 text-decoration-none">${c.name}</a>
                                    <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
                                        <li>
                                            <c:forEach items="${c.list}" var="o">
                                                ${o.size.name}
                                            </c:forEach>
                                        </li>
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
                                            <i class="text-warning fa fa-star"></i>
                                            <i class="text-muted fa fa-star"></i>
                                        </li>
                                    </ul>
                                    <p class="text-center mb-0">${c.price}đ</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>



                </div>


            </div>


        </section>
        <!-- End Article -->


        <!-- Start Footer -->
        <%@include file="footer.jsp" %>
        <!-- End Footer -->

        <!-- Start Script -->


        <script type="text/javascript">
            CKEDITOR.replace('comment');
        </script>

        <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>
        <!-- End Script -->

        <!-- Start Slider Script -->
        <script src="assets/js/slick.min.js"></script>
        <script type="text/javascript">
     function buy(pid) {
         var sid = $('input[name="size"]:checked').val();
         var m = document.f.num.value;
         document.f.action = "buy?pid=" + pid + "&num=" + m + "&size=" + sid;                                                    
         document.f.submit();
         alert("Add to cart succesfully!");
     }
     
        </script>
        <script type="text/javascript">
            function loadmore(){
                 var s = document.getElementsByClassName("comment").length;
                 var p = document.getElementById("pidh").value;
                 console.log(s);
                                           $.ajax(

                                                   {type: 'get',
                                                       url: '/project/loadmore',
                                                      data:{
                                                         pid: p,
                                                         amount: s,
                                                      },
                                                       success: function (data) {
                                                           var row = document.getElementById("x");
                                                           row.innerHTML += data;
                                                       }
                                                   });
     }
        </script>
        <script>
            $('#carousel-related-product').slick({
                infinite: true,
                arrows: false,
                slidesToShow: 4,
                slidesToScroll: 3,
                dots: true,
                responsive: [{
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 3
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 3
                        }
                    }
                ]
            });
        </script>

        <!-- End Slider Script -->

    </body>

</html>