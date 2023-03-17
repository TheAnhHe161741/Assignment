<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : myorder
    Created on : Mar 5, 2023, 9:20:24 PM
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
        <h1>My Order!</h1>
        <p><a href="home" class="btn btn-primary">Home</a></p>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Date</th>
                    <th>Total</th>
                    <th>Status</th>
                        <c:if test="${user.getIsAdmin() == 1}">
                        <th>Edit</th>
                        </c:if>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="o" items="${olist}">          
                    <tr>
                        <td>${o.id}</td>
                        <td>${o.createDate}</td>
                        <td>${o.total}</td>
                        <td>${o.statusName}</td>
                        <c:if test="${user.getIsAdmin() == 1}">
                            <td style="text-align: center">                         
                                <form action="editOrder" method="GET">
                                    <input type="hidden" name="oid" value="${o.id}">
                                    <button type="submit" >
                                        <i class="fa-solid fa-pen"></i>
                                    </button>
                                </form>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <p>${msg}</p>

    </body>
</html>
