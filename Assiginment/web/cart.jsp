<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Cart Supermarket</title>
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

        <div id="all">
            <div id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- breadcrumb-->
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                    <li aria-current="page" class="breadcrumb-item active">Shopping cart</li>
                                </ol>
                            </nav>
                        </div>
                        <div id="basket" class="col-lg-9">
                            <div class="box">
                                <form  action="checkout">
                                    <h1>Shopping cart</h1>
                                    <p class="text-muted">You currently have ${cart == null?cart.listItems.size():0} item(s) in your cart.</p>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th colspan="2">Product</th>
                                                    <th>Code</th>
                                                    <th>Quantity</th>
                                                    <th>Unit price</th>
                                                    <th>Discount</th>
                                                    <th colspan="2">Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${cart.listItems}" var="i">
                                                    <tr>
                                                        <td><a href="#"><img src="${i.product.img}" alt="${i.product.name}"></a></td>
                                                        <td><a href="#">${i.product.name}</a></td>
                                                        <td>${i.product.code}</td>
                                                        <td>
                                                            <input type="number" value="${i.quantity}" class="form-control">
                                                        </td>
                                                        <td>$${i.product.price}</td>
                                                        <td>$0.00</td>
                                                        <td>$${i.quantity * i.product.price}</td>
                                                        <td><a href="deleteFromCart?itemId=${i.product.id}"><i class="fa fa-trash-o"></i></a></td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th colspan="5">Total</th>
                                                    <th colspan="2">$${sessionScope.cart.getTotalMoney()}</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive-->
                                    <div class="box-footer d-flex justify-content-between flex-column flex-lg-row">
                                        <div class="left"><a href="productList" class="btn btn-outline-secondary"><i class="fa fa-chevron-left"></i> Continue shopping</a></div>
                                        <div class="right">

                                            <button type="submit" class="btn btn-primary">Update to cart <i class="fa fa-chevron-right"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- /.box-->
                            <div class="row same-height-row">
                                <div class="col-lg-3 col-md-6">
                                    <div class="box same-height">
                                        <h3>You may also like these products</h3>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-6">
                                    <div class="product same-height">
                                        <div class="flip-container">
                                            <div class="flipper">
                                                <div class="front"><a href="detail.html"><img src="img/product2.jpg" alt="" class="img-fluid"></a></div>
                                                <div class="back"><a href="detail.html"><img src="img/product2_2.jpg" alt="" class="img-fluid"></a></div>
                                            </div>
                                        </div><a href="detail.html" class="invisible"><img src="img/product2.jpg" alt="" class="img-fluid"></a>
                                        <div class="text">
                                            <h3>Fur coat</h3>
                                            <p class="price">$143</p>
                                        </div>
                                    </div>
                                    <!-- /.product-->
                                </div>
                                <div class="col-md-3 col-sm-6">
                                    <div class="product same-height">
                                        <div class="flip-container">
                                            <div class="flipper">
                                                <div class="front"><a href="detail.html"><img src="img/product1.jpg" alt="" class="img-fluid"></a></div>
                                                <div class="back"><a href="detail.html"><img src="img/product1_2.jpg" alt="" class="img-fluid"></a></div>
                                            </div>
                                        </div><a href="detail.html" class="invisible"><img src="img/product1.jpg" alt="" class="img-fluid"></a>
                                        <div class="text">
                                            <h3>Fur coat</h3>
                                            <p class="price">$143</p>
                                        </div>
                                    </div>
                                    <!-- /.product-->
                                </div>
                                <div class="col-md-3 col-sm-6">
                                    <div class="product same-height">
                                        <div class="flip-container">
                                            <div class="flipper">
                                                <div class="front"><a href="detail.html"><img src="img/product3.jpg" alt="" class="img-fluid"></a></div>
                                                <div class="back"><a href="detail.html"><img src="img/product3_2.jpg" alt="" class="img-fluid"></a></div>
                                            </div>
                                        </div><a href="detail.html" class="invisible"><img src="img/product3.jpg" alt="" class="img-fluid"></a>
                                        <div class="text">
                                            <h3>Fur coat</h3>
                                            <p class="price">$143</p>
                                        </div>
                                    </div>
                                    <!-- /.product-->
                                </div>
                            </div>
                        </div>
                        <!-- /.col-lg-9-->
                        <div class="col-lg-3">
                            <div id="order-summary" class="box">
                                <div class="box-header">
                                    <h3 class="mb-0">Order summary</h3>
                                </div>
                                <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>Order subtotal</td>
                                                <th>$${sessionScope.cart.getTotalMoney()}</th>
                                            </tr>
                                            <tr>
                                                <td>Shipping and handling</td>
                                                <th>$10.00</th>
                                            </tr>
                                            <tr>
                                                <td>Tax</td>
                                                <th>$0.00</th>
                                            </tr>
                                            <tr class="total">
                                                <td>Total</td>
                                                <th>$${sessionScope.cart.getTotalMoney()+10}</th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="box">
                                <div class="box-header">
                                    <h4 class="mb-0">Coupon code</h4>
                                </div>
                                <p class="text-muted">If you have a coupon code, please enter it in the box below.</p>
                                <form>
                                    <div class="input-group">
                                        <input type="text" class="form-control"><span class="input-group-append">
                                            <button type="button" class="btn btn-primary"><i class="fa fa-gift"></i></button></span>
                                    </div>
                                    <!-- /input-group-->
                                </form>
                            </div>
                        </div>
                        <!-- /.col-md-3-->
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
                            <li><a href="register">Regiter</a></li>
                        </ul>
                    </div>
                    <!-- /.col-lg-3-->
                    <div class="col-lg-3 col-md-6">
                        <h4 class="mb-3">Top categories</h4>
                        <h5>Quần áo</h5>
                        <ul class="list-unstyled">
                            <li><a href="productDetail?id=1">Váy chữ A</a></li>
                            <li><a href="productDetail?id=2">Jeans Âu</a></li>
                            <li><a href="productDetail?id=5">Áo uniqlo</a></li>
                        </ul>
                        
                    </div>
                    <!-- /.col-lg-3-->
                    <div class="col-lg-3 col-md-6">
                        <h4 class="mb-3">Where to find us</h4>
                        <p><strong>TheAnh supermarket</strong><br>Thôn 8 Ngã ba Hòa Lạc<br>Hòa Lạc<br>45Y 73J<br>VietNam<br><strong>Ha Noi</strong></p><a href="contact.html">Go to contact page</a>
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