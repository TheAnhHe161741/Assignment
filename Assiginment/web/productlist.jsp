<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : productlist
    Created on : Feb 28, 2023, 11:23:17 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>M.T.P shop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <h1>Product List!</h1>
        <a href="home" class="btn btn-primary">Home</a>
        <a href="viewCart" class="btn btn-primary">View Cart</a>        
        <c:if test="${user.getIsAdmin() == 1}">
            <a href="addToProduct" class="btn btn-primary">Add New Product</a>
        </c:if>
        <br><br>
        <form method="get" action="productList" >
            <label>Search:</label> <input type="text" class="form-control-sm" name="search" value="${param["search"]}"> 
            <br><br>
            <label>Category:</label> <select name="cateId" class="form-select-sm">
                <option value="">All</option>
                <c:forEach var="c" items="${clist}">
                    <option value="${c.id}">${c.name}</option>
                </c:forEach>
            </select>
            <br><br>
            <label>Price from:</label> <input type="number" class="form-control-sm" step="0.1" name="pFrom" value="${param["pFrom"]}"> 
            <label>to:</label><input type="number" class="form-control-sm" step="0.1" name="pTo" value="${param["pTo"]}"><br><br>
            <input type="submit" value="Search" class="btn btn-warning"/><br>
        </form>
        <br>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Code</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Add to cart</th>
                        <c:if test="${user.getIsAdmin() == 1}">
                        <th>Edit</th>
                        </c:if>
                        <c:if test="${user.getIsAdmin() == 1}">
                        <th>Delete</th>
                        </c:if>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${plist}" >          
                    <tr>
                        <td>${p.id}</td>
                        <td><a href="productDetail?id=${p.id}"> ${p.name}</a></td>
                        <td>${p.code}</td>
                        <td>${p.price}</td>
                        <td><img src="${p.img}" width="100px"/></td>
                        <td>${p.description}</td>
                        <td>${p.category.name}</td>
                        <td style="text-align: center"><a href="addToCart?productID=${p.id}&quantity=1"><i class="fa-solid fa-circle-plus"></i></a></td>
                        <c:if test="${user.getIsAdmin() == 1}">
                            <td style="text-align: center">                         
                                <form action="editProduct" method="GET">
                                    <input type="hidden" name="pid" value="${p.id}">
                                    <button type="submit" >
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                </form>
                            </td>
                        </c:if>
                        <c:if test="${user.getIsAdmin() == 1}">
                            <td style="text-align: center">                         
                                <form action="deleteProduct" method="POST">
                                    <input type="hidden" name="pid" value="${p.id}">
                                    <button type="submit" >
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div>
            <c:forEach var="i" begin="1" end="${endPage}">
                <a href="#">${i}</a>
            </c:forEach>
        </div>
    </body>
</html>
