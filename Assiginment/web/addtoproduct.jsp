<%-- 
    Document   : addtoproduct
    Created on : Mar 7, 2023, 10:44:28 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h1>Add To Product List!</h1>
        <form method="POST" action="addToProduct" >
            Product-Name: <input type="text" class="form-control-sm" name="pname" ><br><br>
            Product-Code: <input type="text" class="form-control-sm" name="pcode" ><br><br>
            Stock: <input type="number" class="form-control-sm" name="stock" ><br><br>
            Price: <input type="number" class="form-control-sm" name="price" ><br><br>
            Discount: <input type="number" class="form-control-sm" name="disc" ><br><br>
            Image: <input type="ntext" class="form-control-sm" name="img" ><br><br>
            Color: <input type="text" class="form-control-sm" name="color" ><br><br>
            Description: <input type="text" class="form-control-sm" name="desc" ><br><br>
            Create-date: <input type="date" class="form-control-sm" name="date" > <br><br>                     
            Category: 
            <select name="cate" class="form-select-sm">
                <c:forEach var="c" items="${clist}">
                    <option value="${c.id}">${c.name}</option>
                </c:forEach>               
            </select>
            <br><br>
            <input type="submit" value="Save" class="btn btn-warning"/>
        </form>
    </body>
</html>
