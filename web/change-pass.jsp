<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Responsive Login and Signup Form </title>

        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/login.css">

        <!-- Boxicons CSS -->
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>

    </head>
    <body>
        <section class="container forms">
            <div class="form login">
                <div class="form-content">
                    <header>Change Password</header>
                    <form action="change" method="post">
                        <div >
                            <div style="color: red" class="text-danger" role="alert">
                                ${error}
                            </div>
                        </div>

                        <div class="field input-field">
                            <input type="password" placeholder="Old Password" name="old">
                        </div>

                        <div class="field input-field">
                            <input type="password" placeholder="New Password" name="password">
                            <i class='bx bx-hide eye-icon'></i>
                        </div>
                            <div class="field input-field">
                            <input type="password" placeholder="Re-Enter NewPassword" name="re-password">
                            <i class='bx bx-hide eye-icon'></i>
                        </div>
                       <div class="field button-field">
                            <button>Change</button>
                        </div>
                    </form>
                </div>
            </div>
            </div>
        </section>

        <!-- JavaScript -->
        <script src="assets/js/login.js"></script>
    </body>
</html>