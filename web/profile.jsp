<link rel="apple-touch-icon" href="assets/img/apple-icon.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/templatemo.css">
        <link rel="stylesheet" href="assets/css/custom.css">
        <link rel="stylesheet" href="assets/css/navbar.css"/>
        <!-- Load fonts style after rendering the layout styles -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<style> input[type=text] {  width: 100%;  padding: 12px 20px;  margin: 8px 0;  box-sizing: border-box;  border: 2px solid #58257b;  border-radius: 4px;}</style>
<style> input[type=email] {  width: 100%;  padding: 12px 20px;  margin: 8px 0;  box-sizing: border-box;  border: 2px solid #58257b;  border-radius: 4px;}</style>
<style> input[type=submit] {background: white; color: black; margin: 0 auto; box-sizing: border-box;  border: 2px solid #58257b;  border-radius: 4px;}</style>
   <div class="padding">
    <div class="">
        <div class=" col-md-12">
            <div class="card user-card-full">
                <div class="row m-l-0 m-r-0">
                    <div class="col-sm-4 bg-c-lite-green user-profile">
                        <div class="card-block text-center text-white">
                            <div class="m-b-25">
                                <img src="https://i.pinimg.com/originals/4d/86/5e/4d865ea47a8675d682ff35ad904a0af6.png" class="img-radius" alt="User-Profile-Image">
                            </div>
                            <h6 class="f-w-600">Hello ${requestScope.a.name}</h6>

                            <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="card-block">
                            <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
                      
                                 <form action="p" method="post">
                                  <div class="row">
                                <div class="col-sm-6">
                                    <p class="m-b-10 f-w-600">Name</p>
                                    <input class="text-muted f-w-400 " type="text" name="name" value="${requestScope.a.name}" required>
                                </div>
                                       <div class="col-sm-6">
                                    <p class="m-b-10 f-w-600">Address</p>
                                    <input class="text-muted f-w-400 " type="text" name="address" value="${requestScope.a.address}" required>
                                </div>
                                <div class="col-sm-6">
                                    <p class="m-b-10 f-w-600">Phone</p>
                                    <input class="text-muted f-w-400 " type="number" name="phone"value="${requestScope.a.phone}" required>
                                </div>
                                      <div class="col-sm-6">
                                    <p class="m-b-10 f-w-600">Email</p>
                                    <input class="text-muted f-w-400 " type="email" name="email" value="${requestScope.a.email}" required>
                                </div>

                                      <div class="col-sm-6">
                                    <p class="m-b-10 f-w-600">Date of birth</p>
                                    <input class="text-muted f-w-400 " type="text" name="dob" value="${requestScope.a.dob}" required>
                                </div>
                                 <div class="col-sm-6">
                                     <input class="text-muted f-w-400 " type="submit" value="SAVE">
                                </div>
                            </div>
                            </form>
                       

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<link rel="stylesheet" href="assets/css/profile.css "/>

 <script src="assets/js/jquery-1.11.0.min.js"></script>
        <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/templatemo.js"></script>
        <script src="assets/js/custom.js"></script>