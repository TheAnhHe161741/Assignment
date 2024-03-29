<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>TheAnh supermarket</title>
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
                        <div class="col-md-12">
                            <div id="main-slider" class="owl-carousel owl-theme">
                                <div class="item"><img src="img/main-slider1.jpg" alt="" class="img-fluid"></div>
                                <div class="item"><img src="img/main-slider2.jpg" alt="" class="img-fluid"></div>
                                <div class="item"><img src="img/main-slider3.jpg" alt="" class="img-fluid"></div>
                                <div class="item"><img src="img/main-slider4.jpg" alt="" class="img-fluid"></div>
                            </div>
                            <!-- /#main-slider-->
                        </div>
                    </div>
                </div>
                <!--
                *** ADVANTAGES HOMEPAGE ***
                _________________________________________________________
                -->
                <div id="advantages">
                    <div class="container">
                        <div class="row mb-4">
                            <div class="col-md-4">
                                <div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">
                                    <div class="icon"><i class="fa fa-heart"></i></div>
                                    <h3><a href="#">We love our customers</a></h3>
                                    <p class="mb-0">We are known to provide best possible service ever</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">
                                    <div class="icon"><i class="fa fa-tags"></i></div>
                                    <h3><a href="#">Best prices</a></h3>
                                    <p class="mb-0">We are confident to bring products with reasonable prices to consumers.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="box clickable d-flex flex-column justify-content-center mb-0 h-100">
                                    <div class="icon"><i class="fa fa-thumbs-up"></i></div>
                                    <h3><a href="#">100% satisfaction guaranteed</a></h3>
                                    <p class="mb-0">Free returns on everything for 3 months.</p>
                                </div>
                            </div>
                        </div>
                        <!-- /.row-->
                    </div>
                    <!-- /.container-->
                </div>
                <!-- /#advantages-->
                <!-- *** ADVANTAGES END ***-->
                <!--
                *** HOT PRODUCT SLIDESHOW ***
                _________________________________________________________
                -->
                <div id="hot">
                    <div class="box py-4">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h2 class="mb-0">Hot this week</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row products">
                            <c:forEach items="${plist}" var="p">
                                <div class="col-lg-4 col-md-6">
                                    <div class="product">
                                        <a href="productDetail?id=${p.id}">
                                            <img src="${p.img}"  class="img-fluid"></a>
                                        <div class="text">
                                            <h3><a href="productDetail?id=${p.id}">${p.name}</a></h3>
                                            <p class="price"> 
                                                <del></del>$${p.price}
                                            </p>
                                            <p class="buttons"><a href="productDetail?id=${p.id}" class="btn btn-outline-secondary">View detail</a><a href="addToCart?productID=${p.id}&quantity=1" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Add to cart</a></p>
                                        </div>
                                        <!-- /.text-->
                                    </div>
                                    <!-- /.product            -->
                                </div>
                                <!-- /#hot-->
                                <!-- *** HOT END ***-->
                            </c:forEach>
                        </div>
                    </div>
                    <!--
                    *** GET INSPIRED ***
                    _________________________________________________________
                    -->
                    <div class="container">
                        <div class="col-md-12">
                            <div class="box slideshow">
                                <h3>Get Inspired</h3>
                                <p class="lead">Get the inspiration from our world class designers</p>
                                <div id="get-inspired" class="owl-carousel owl-theme">
                                    <div class="item"><a href="#"><img src="img/getinspired1.jpg" alt="Get inspired" class="img-fluid"></a></div>
                                    <div class="item"><a href="#"><img src="img/getinspired2.jpg" alt="Get inspired" class="img-fluid"></a></div>
                                    <div class="item"><a href="#"><img src="img/getinspired3.jpg" alt="Get inspired" class="img-fluid"></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- *** GET INSPIRED END ***-->
                    <!--
                    *** BLOG HOMEPAGE ***
                    _________________________________________________________
                    -->
                    <div class="box text-center">
                        <div class="container">
                            <div class="col-md-12">
                                <h3 class="text-uppercase">From our blog</h3>
                                <p class="lead mb-0">What's new in the world of fashion? <a href="blog.html">Check our blog!</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="col-md-12">
                            <div id="blog-homepage" class="row">
                                <div class="col-sm-6">
                                    <div class="post">
                                        <h4><a href="post.html">Fashion now</a></h4>
                                        <p class="author-category">By <a href="#">John Slim</a> in <a href="">Fashion and style</a></p>
                                        <hr>
                                        <p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                                        <p class="read-more"><a href="post.html" class="btn btn-primary">Continue reading</a></p>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="post">
                                        <h4><a href="post.html">Who is who - example blog post</a></h4>
                                        <p class="author-category">By <a href="#">John Slim</a> in <a href="">About Minimal</a></p>
                                        <hr>
                                        <p class="intro">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                                        <p class="read-more"><a href="post.html" class="btn btn-primary">Continue reading</a></p>
                                    </div>
                                </div>
                            </div>
                            <!-- /#blog-homepage-->
                        </div>
                    </div>
                    <!-- /.container-->
                    <!-- *** BLOG HOMEPAGE END ***-->
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