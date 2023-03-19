<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="dao.ProductDAO" %>
<%@page  import="java.util.List" %>
<%@page  import="model.Category" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <% ProductDAO dao = new ProductDAO();
        List<Category> categories = dao.getAllCate();
        %>
        <!-- navbar-->
        <header class="header mb-5">
            <!--
            *** TOPBAR ***
            _________________________________________________________
            -->
            <div id="top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 offer mb-3 mb-lg-0"><a href="#" class="btn btn-success btn-sm">Offer of the day</a><a href="#" class="ml-1">Get flat 35% off on orders over $50!</a></div>
                        <div class="col-lg-6 text-center text-lg-right">
                            <ul class="menu list-inline mb-0">
                                <c:if test="${user==null}">
                                    <li class="list-inline-item"><a href="#" data-toggle="modal" data-target="#login-modal">Login</a></li>
                                    <li class="list-inline-item"><a href="register">Register</a></li>

                                </c:if>
                                <c:if test="${user!=null}">
                                    <p class="list-inline-item" style="color: white">Welcome, ${user.fullname}</p> 
                                    <li class="list-inline-item"><a href="editProfile">Edit profile</a></li>
                                   
                                    <li class="list-inline-item"><a href="userManager">Edit user</a></li>
                                    
                                    <li class="list-inline-item"><a href="myOrder">My order</a></li>
                                    <li class="list-inline-item"><a href="manage-product">Product List</a></li>
                                    <li class="list-inline-item"><a href="logout">Log out</a></li>                                   
                                    </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true" class="modal fade">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Customer login</h5>
                                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
                            </div>
                            <div class="modal-body">
                                <form action="login" method="post">
                                    <div class="form-group">
                                        <input id="email-modal" type="text" name="email" placeholder="email" value="${param["email"]}" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <input id="password-modal" type="password" name="pass" placeholder="password" value="${param["pass"]}" class="form-control">
                                    </div>
                                    <p class="text-center">
                                        <button class="btn btn-primary"><i class="fa fa-sign-in"></i> Log in</button>
                                    </p>
                                </form>
                                <p class="text-center text-muted">Not registered yet?</p>
                                <p class="text-center text-muted"><a href="register"><strong>Register now</strong></a>! It is easy and done in 1 minute and gives you access to special discounts and much more!</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- *** TOP BAR END ***-->


            </div>
            <nav class="navbar navbar-expand-lg">
                <div class="container"><a href="home" class="navbar-brand home">
                        <img src="img/logo.png" width="80px" height="80px" alt="TheAnh-Supermarket" class="d-none d-md-inline-block">
                        <img src="img/logo-small.png" alt="Obaju logo" class="d-inline-block d-md-none"><span class="sr-only"></span></a>
                    <div class="navbar-buttons">
                        <button type="button" data-toggle="collapse" data-target="#navigation" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
                        <button type="button" data-toggle="collapse" data-target="#search" class="btn btn-outline-secondary navbar-toggler"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></button>
                        <c:if test="${user.getIsAdmin() == 0}">
                        <a href="basket.html" class="btn btn-outline-secondary navbar-toggler"><i class="fa fa-shopping-cart"></i></a>
                        </c:if>
                    </div>
                    <div id="navigation" class="collapse navbar-collapse">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item"><a href="#" class="nav-link active">Home</a></li>
                            <li class="nav-item dropdown menu-large"><a href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="200" class="dropdown-toggle nav-link">Category<b class="caret"></b></a>
                                <ul class="dropdown-menu megamenu">
                                    <li>
                                        <div class="row">
                                            <div class="col-md-6 col-lg-3">
                                                <h5>Category</h5>
                                                <ul class="list-unstyled mb-3">
                                                    <c:forEach items="${clist}" var="c">
                                                        <li class="nav-item"><a href="productList?cateId=${c.id}" class="nav-link">${c.name}</a></li>
                                                        </c:forEach>

                                                </ul>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <div class="navbar-buttons d-flex justify-content-end">
                            <!-- /.nav-collapse-->
                            <div id="search-not-mobile" class="navbar-collapse collapse"></div><a data-toggle="collapse" href="#search" class="btn navbar-btn btn-primary d-none d-lg-inline-block"><span class="sr-only">Toggle search</span><i class="fa fa-search"></i></a>
                            <c:if test="${user.getIsAdmin() == 0}">
                            <div id="basket-overview" class="navbar-collapse collapse d-none d-lg-block"><a href="viewCart" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span>${cart != null?cart.listItems.size():0} items in cart</span></a></div>
                            </c:if>
                            
                        </div>
                    </div>
                </div>
            </nav>
            <div id="search" class="collapse">
                <div class="container">
                    <form action="productList" role="search" class="ml-auto">
                        <div class="input-group">
                            <input type="text" name="search" placeholder="Search" class="form-control">
                            <div class="input-group-append">
                                <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </header>
    </body>
</html>
