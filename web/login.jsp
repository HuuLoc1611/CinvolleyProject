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
                    <header>Login</header>
                    <form action="login">
                        <div >
                            <div style="color: red" class="alert-warning">
                                ${error}
                            </div>
                            <div style="color: red" class="alert-warning">
                                ${error3}
                            </div>
                        </div>

                        <div class="field input-field">
                            <input type="text" placeholder="Username" name="user">
                        </div>

                        <div class="field input-field">
                            <input type="password" placeholder="Password" name="password">
                            <i class='bx bx-hide eye-icon'></i>
                        </div>
                       <div style="color: red" class="text-danger" role="alert">
                                ${error2}
                            </div>

                        <div class="form-link">
                            <a href="#" class="forgot-pass">Forgot password?</a>
                        </div>

                        <div class="field button-field">
                            <button>Login</button>
                        </div>
                    </form>

                    <div class="form-link">
                        <span>Don't have an account? <a href="#" class="link signup-link">Signup</a></span>
                    </div>
                </div>

            </div>

            <!-- Signup Form -->

            <div class="form signup">
                <div class="form-content">
                    <header>Signup</header>
                    <form action="singup">
                        <div class="field input-field">
                            <input type="text" placeholder="Email" name="input">
                        </div>

                        <div class="field input-field">
                            <input type="password" placeholder="Create password" name="password">
                        </div>

                        <div class="field input-field">
                            <input type="password" placeholder="Confirm password" name="re-password">
                            <i class='bx bx-hide eye-icon'></i>
                        </div>
                        
                        <div >
                            <div style="color: red" class="text-danger" role="alert">
                                ${error3}
                        </div>
                            <div class="field button-field">
                                <button>Signup</button>
                            </div>
                    </form>

                    <div class="form-link">
                        <span>Already have an account? <a href="#" class="link login-link">Login</a></span>
                    </div>
                </div>
            </div>
            </div>
        </section>

        <!-- JavaScript -->
        <script src="assets/js/login.js"></script>
    </body>
</html>