<%-- 
    Document   : register
    Created on : Feb 25, 2023, 11:23:20 PM
    Author     : ADMIN
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>TheAnh Supermarket</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <!-- Bootstrap CSS-->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome CSS-->
        <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
        <!-- Google fonts - Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700">
        <!-- owl carousel-->
        <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">
        <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">
        <!-- theme stylesheet-->
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/custom.css">
        <!-- Favicon-->
        <link rel="shortcut icon" href="favicon.png">
        <!-- Tweaks for older IEs--><!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div id="all">
            <div id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- breadcrumb-->
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li aria-current="page" class="breadcrumb-item active">New account / Sign in</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-lg-6">
                            <div class="box">
                                <h1>New account</h1>
                                <p class="lead">Not our registered customer yet?</p>
                                <p>With registration with us new world of fashion, fantastic discounts and much more opens to you! The whole process will not take you more than a minute!</p>
                                <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p>
                                <hr>
                                <form action="register" method="post">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input id="email" type="email" name="email" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <input id="name" type="text" name="name" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <br>
                                        <input type="radio" name="gender" value="1" id="male">
                                        <label for="male">Male</label>
                                        <input type="radio" name="gender" value="0" id="female">
                                        <label for="female">Female</label>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input id="phone" type="number" name="phone" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="pass">Password</label>
                                        <input id="pass" type="password" name="pass" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="repass">Re-Password</label>
                                        <input id="repass" type="password" name="repass" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="dob">DOB</label>
                                        <input id="dob" type="date" name="dob" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Address</label>
                                        <input id="address" type="text" name="address" class="form-control" required>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-user-md"></i> Register</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="box">
                                <h1>Login</h1>
                                <p class="lead">Already our customer?</p>
                                <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                                <hr>
                                <form action="customer-orders.html" method="post">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input id="email" type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input id="password" type="password" class="form-control">
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--
        *** FOOTER ***
        _________________________________________________________
        -->
        <div id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <h4 class="mb-3">Pages</h4>
                        <ul class="list-unstyled">
                            <li><a href="text.html">About us</a></li>
                            <li><a href="text.html">Terms and conditions</a></li>
                            <li><a href="faq.html">FAQ</a></li>
                            <li><a href="contact.html">Contact us</a></li>
                        </ul>
                        <hr>
                        <h4 class="mb-3">User section</h4>
                        <ul class="list-unstyled">
                            <li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a></li>
                            <li><a href="register.html">Regiter</a></li>
                        </ul>
                    </div>
                    <!-- /.col-lg-3-->
                    <div class="col-lg-3 col-md-6">
                        <h4 class="mb-3">Top categories</h4>
                        <h5>Men</h5>
                        <ul class="list-unstyled">
                            <li><a href="category.html">T-shirts</a></li>
                            <li><a href="category.html">Shirts</a></li>
                            <li><a href="category.html">Accessories</a></li>
                        </ul>
                        <h5>Ladies</h5>
                        <ul class="list-unstyled">
                            <li><a href="category.html">T-shirts</a></li>
                            <li><a href="category.html">Skirts</a></li>
                            <li><a href="category.html">Pants</a></li>
                            <li><a href="category.html">Accessories</a></li>
                        </ul>
                    </div>
                    <!-- /.col-lg-3-->
                    <div class="col-lg-3 col-md-6">
                        <h4 class="mb-3">Where to find us</h4>
                        <p><strong>Obaju Ltd.</strong><br>13/25 New Avenue<br>New Heaven<br>45Y 73J<br>England<br><strong>Great Britain</strong></p><a href="contact.html">Go to contact page</a>
                        <hr class="d-block d-md-none">
                    </div>
                    <!-- /.col-lg-3-->
                    <div class="col-lg-3 col-md-6">
                        <h4 class="mb-3">Get the news</h4>
                        <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
                        <form>
                            <div class="input-group">
                                <input type="text" class="form-control"><span class="input-group-append">
                                    <button type="button" class="btn btn-outline-secondary">Subscribe!</button></span>
                            </div>
                            <!-- /input-group-->
                        </form>
                        <hr>
                        <h4 class="mb-3">Stay in touch</h4>
                        <p class="social"><a href="#" class="facebook external"><i class="fa fa-facebook"></i></a><a href="#" class="twitter external"><i class="fa fa-twitter"></i></a><a href="#" class="instagram external"><i class="fa fa-instagram"></i></a><a href="#" class="gplus external"><i class="fa fa-google-plus"></i></a><a href="#" class="email external"><i class="fa fa-envelope"></i></a></p>
                    </div>
                    <!-- /.col-lg-3-->
                </div>
                <!-- /.row-->
            </div>
            <!-- /.container-->
        </div>
        <!-- /#footer-->
        <!-- *** FOOTER END ***-->


        <!--
        *** COPYRIGHT ***
        _________________________________________________________
        -->
        <div id="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 mb-2 mb-lg-0">
                        <p class="text-center text-lg-left">©2019 Your name goes here.</p>
                    </div>
                    <div class="col-lg-6">
                        <p class="text-center text-lg-right">Template design by <a href="https://bootstrapious.com/">Bootstrapious</a>
                            <!-- If you want to remove this backlink, pls purchase an Attribution-free License @ https://bootstrapious.com/p/obaju-e-commerce-template. Big thanks!-->
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- *** COPYRIGHT END ***-->
        <!-- JavaScript files-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/jquery.cookie/jquery.cookie.js"></script>
        <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.js"></script>
        <script src="js/front.js"></script>
    </body>
</html>
