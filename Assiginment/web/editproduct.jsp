<%-- 
    Document   : editproduct
    Created on : Mar 6, 2023, 7:02:20 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>editprod Supermarket</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/editProduct.css">
    </head>
    <body>
        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-3 border-right">
                </div>
                <div class="col-md-5 border-right">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Edit Product</h4>
                        </div>
                        <form method="POST" action="editProduct">
                            <input type="hidden" name="pid" value="${product.id}">

                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Name</label><input type="text" class="form-control" name="name" value="${product.name}"></div>
                                <div class="col-md-12"><label class="labels">Code</label><input type="text" class="form-control" name="code" value="${product.code}"></div>
                                <div class="col-md-12"><label class="labels">Stock</label><input type="text" class="form-control" name="stock" value="${product.stock}"><label class="labels">Price</label><input type="text" class="form-control" name="price" value="${product.price}"></div>
                                <div class="col-md-12"><label class="labels">Discount</label><input type="text" class="form-control" name="discount" value="${product.discount}"></div>
                                <div class="col-md-12"><label class="labels">Image</label><input type="text" class="form-control" name="img" value="${product.img}"></div>
                                <div class="col-md-12"><label class="labels">Color</label><input type="text" class="form-control" name="color" value="${product.color}"></div>
                                <div class="col-md-12"><label class="labels">Description</label><input type="text" class="form-control" name="desc" value="${product.description}"></div>
                                <div class="col-md-12"><label class="labels">Create-Date</label><input type="text" class="form-control" name="date" value="${product.createDate}"></div>
                                <div class="col-md-12"><label class="labels">Category</label><select name="cate" class="form-select-sm">
                                        <c:forEach var="c" items="${clist}">
                                            <option value="${c.id}" ${product.category_id.equals(c.id) ? "selected" : ""} >${c.name}</option>
                                        </c:forEach>               
                                    </select></div>
                            </div><br><br>
                            <a href="manage-product" class="btn btn-primary">Back</a>
                            <input type="submit" value="Save" class="btn btn-warning"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <h1>!</h1>

    </body>
</html>
