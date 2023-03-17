<%-- 
    Document   : productdetail
    Created on : Mar 1, 2023, 11:28:18 AM
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
        <h1>Product-${product.name}</h1>
        <div >
            <img src="${product.img}" width="300px"/>
            <p>
                <i>Price: ${product.price} <br>
                    Category: ${product.category.name}<br>
                    Color: ${product.color}<br>
                    Description: ${product.description}<br>
                    Stock: ${product.stock}
                </i>
            </p>
        </div>
        <form method="get" action="addToCart">
            <input type="number" name="quantity" class="form-control-sm">
            <input type="hidden" name="productID" value="${product.id}">
            <br><br>
            <input type="submit" value="Add To Cart" class="btn btn-warning"/>
        </form>
    </body>
</html>
