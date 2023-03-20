<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : editorder
    Created on : Mar 6, 2023, 2:16:52 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>editOrder supermarket</title>
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
                            <h4 class="text-right">Edit Order!</h4>
                            <br><br>
                        </div>
                        <form method="POST" action="editOrder">
                            <input type="hidden" name="oid" value="${order.id}">
                            Status: <select name="status" id="status" class="form-select-sm">
                                <option value="1" ${order.status == 1 ? 'selected' : ''}>Pending</option>
                                <option value="2" ${order.status == 2 ? 'selected' : ''}>Shipping</option>
                                <option value="3" ${order.status == 3 ? 'selected' : ''}>Received</option>
                                <option value="4" ${order.status == 4 ? 'selected' : ''}>Canceled</option>
                            </select>
                            <input type="submit" value="Save" class="btn btn-warning"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
