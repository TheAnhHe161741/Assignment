<%-- 
    Document   : editProfile
    Created on : Feb 28, 2023, 10:25:26 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>editProfile supermarket</title>
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
                            <h4 class="text-right">Edit Profile!</h4>
                            <br><br>
                        </div>
                        <form method="post" action="editProfile">
                            <input type="hidden" class="form-control-sm" name="id" value="${sessionScope.user.id}">
                            Email: <input type="email" class="form-control-sm" name="email" value="${sessionScope.user.email}"><br><br>
                            Password: <input type="password" class="form-control-sm" name="pass" value="${sessionScope.user.password}"><br><br> 
                            Name: <input type="text" class="form-control-sm" name="name" value="${sessionScope.user.fullname}"><br><br>          
                            Gender: <input type="radio" name="gender" value="1" ${sessionScope.user.gender?"checked":""}>Male<input type="radio" name="gender" value="0" ${!sessionScope.user.gender?"checked":""}>Female<br><br>          
                            Phone: <input type="text" class="form-control-sm" name="phone" value="${sessionScope.user.phone}"><br><br>              
                            DOB: <input type="date" class="form-control-sm" name="dob" value="${sessionScope.user.dob}"><br><br>          
                            Address: <input type="text" class="form-control-sm" name="address" value="${sessionScope.user.address}"><br><br>
                            <a href="home" class="btn btn-primary">Back</a>
                            <input type="submit" value="Save" class="btn btn-warning"/>


                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
