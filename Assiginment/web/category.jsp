<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Category Supermarket</title>
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
                                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                                    <li aria-current="page" class="breadcrumb-item active">Ladies</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-lg-3">
                            <!--
                            *** MENUS AND FILTERS ***
                            _________________________________________________________
                            -->
                            <div class="card sidebar-menu mb-4">
                                <div class="card-header">
                                    <h3 class="h4 card-title">Categories</h3>
                                </div>
                                <div class="card-body">
                                    <ul class="nav nav-pills flex-column category-menu">
                                        <li><a href="?cateId=" class="nav-link ${cateId==0? 'active':''}">All</a></li>

                                        <c:forEach items="${clist}" var="c">
                                            <li><a href="?cateId=${c.id}" class="nav-link ${c.id==cateId? 'active':''}">${c.name}</a></li>
                                            </c:forEach>

                                    </ul>
                                </div>
                            </div>
<!--                            <div class="card sidebar-menu mb-4">
                                <div class="card-header">
                                    <h3 class="h4 card-title">Brands <a href="#" class="btn btn-sm btn-danger pull-right"><i class="fa fa-times-circle"></i> Clear</a></h3>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> Armani  (10)
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> Versace  (12)
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> Carlo Bruni  (15)
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> Jack Honey  (14)
                                                </label>
                                            </div>
                                        </div>
                                        <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>
                                    </form>
                                </div>
                            </div>
                            <div class="card sidebar-menu mb-4">
                                <div class="card-header">
                                    <h3 class="h4 card-title">Colours <a href="#" class="btn btn-sm btn-danger pull-right"><i class="fa fa-times-circle"></i> Clear</a></h3>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"><span class="colour white"></span> White (14)
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"><span class="colour blue"></span> Blue (10)
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"><span class="colour green"></span>  Green (20)
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"><span class="colour yellow"></span>  Yellow (13)
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"><span class="colour red"></span>  Red (10)
                                                </label>
                                            </div>
                                        </div>
                                        <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>
                                    </form>
                                </div>
                            </div>-->
                            <!-- *** MENUS AND FILTERS END ***-->
                        </div>
                        <div class="col-lg-9">
                            <div class="box">
                                <h1>Products</h1>
                                <p>In our Ladies department we offer wide selection of the best products we have found and carefully selected worldwide.</p>
                            </div>
                            <div class="box info-bar">
                                <div class="row">
                                    <div class="col-md-12 col-lg-4 products-showing">Showing <strong>${currentPage}</strong> of <strong>${totalPages}</strong> Pages</div>
                                    <div class="col-md-12 col-lg-7 products-number-sort">
                                        <form class="form-inline d-block d-lg-flex justify-content-between flex-column flex-md-row">
                                            <div class="products-number"><strong>Show</strong><a href="?cateId=${cateId}&pFrom=${pFrom}&pTo=${pTo}&sortBy=${sortBy}&search=${search}&pageSize=9" class="btn btn-sm ${pageSize==9?'btn-primary':'btn-outline-secondary'}">9</a><a href="?cateId=${cateId}&pFrom=${pFrom}&pTo=${pTo}&sortBy=${sortBy}&search=${search}&pageSize=15" class="btn ${pageSize==15?'btn-primary':'btn-outline-secondary'} btn-sm">15</a><a href="?cateId=${cateId}&pFrom=${pFrom}&pTo=${pTo}&sortBy=${sortBy}&search=${search}&pageSize=1000" class="btn ${pageSize==1000?'btn-primary':'btn-outline-secondary'} btn-sm">All</a><span>products</span></div>
                                            <div class="products-sort-by mt-2 mt-lg-0"><strong>Sort by</strong>
                                                <select name="sort-by" id="sortBy" class="form-control" onchange="window.location.href = this.value;">
                                                    <option value="?cateId=${cateId}&pFrom=${pFrom}&pTo=${pTo}&search=${search}&pageSize=9&sortBy=Products.p_name">Name</option>
                                                    <option value="?cateId=${cateId}&pFrom=${pFrom}&pTo=${pTo}&search=${search}&pageSize=9&sortBy=Products.price">Price</option>
                                                    <option value="?cateId=${cateId}&pFrom=${pFrom}&pTo=${pTo}&search=${search}&pageSize=9&sortBy=Products.stock">Stock</option>
                                                </select>

                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="row products">
                                <c:forEach items="${plist}" var="p">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="product">
                                            <a href="productDetail?id=${p.id}">
                                                <img src="${p.img}" style="width: 100%;height:250px "  class="img-fluid"></a>
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
                                <!-- /.products-->
                            </div>
                            <div class="pages">
                                <!--                                <p class="loadMore"><a href="#" class="btn btn-primary btn-lg"><i class="fa fa-chevron-down"></i> Load more</a></p>-->
                                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                    <ul class="pagination">
                                        <li class="page-item <c:if test='${currentPage == 1}'>disabled</c:if>">
                                            <a href="?page=${currentPage - 1}&cateId=${cateId}&pFrom=${pFrom}&pTo=${pTo}&sortBy=${sortBy}&search=${search}&pageSize=${pageSize}" aria-label="Previous" class="page-link">
                                                <span aria-hidden="true">«</span><span class="sr-only">Previous</span>
                                            </a>
                                        </li>
                                        <c:forEach var="i" begin="1" end="${totalPages}">
                                            <li class="page-item <c:if test='${currentPage == i}'>active</c:if>">
                                                <a href="?page=${i}&cateId=${cateId}&pFrom=${pFrom}&pTo=${pTo}&sortBy=${sortBy}&search=${search}&pageSize=${pageSize}" class="page-link">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item <c:if test='${currentPage == totalPages}'>disabled</c:if>">
                                            <a href="?page=${currentPage + 1}&cateId=${cateId}&pFrom=${pFrom}&pTo=${pTo}&sortBy=${sortBy}&search=${search}&pageSize=${pageSize}" aria-label="Next" class="page-link">
                                                <span aria-hidden="true">»</span><span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>

                            </div>
                        </div>
                        <!-- /.col-lg-9-->
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
        <script>
            document.getElementById('sortBy').value="?cateId=${cateId}&pFrom=${pFrom}&pTo=${pTo}&search=${search}&pageSize=9&sortBy=${sortBy}";
        </script>
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