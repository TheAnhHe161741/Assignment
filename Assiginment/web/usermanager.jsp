<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : usermanager
    Created on : Mar 7, 2023, 3:28:35 PM
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
        <h1>Manager User</h1>
        <p><a href="home" class="btn btn-primary">Home</a></p>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Full Name</th>
                    <th>Gender</th>
                    <th>Phone</th>                   
                    <th>DOB</th>
                    <th>Address</th>
                    <th>Permission</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="l" items="${list}">           
                    <tr>
                        <td>${l.email}</td>
                        <td>${l.password}</td>
                        <td>${l.fullname}</td>
                        <td style="text-align: center">
                            <c:if test="${l.gender}">                                
                                <img width="25px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Mars_symbol.svg/220px-Mars_symbol.svg.png" alt="Male"/>
                            </c:if>
                            <c:if test="${!l.gender}">                               
                                <img width="25px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Venus_symbol.svg/220px-Venus_symbol.svg.png" alt="Female"/>
                            </c:if>
                        </td>
                        <td>${l.phone}</td>                       
                        <td>${l.dob}</td>
                        <td>${l.address}</td>
                        <td style="text-align: center">                           
                            <c:if test="${l.isAdmin==1}">                                
                                Admin
                            </c:if>
                            <c:if test="${l.isAdmin!=1}">                               
                                User
                            </c:if>
                        </td>
                        <td style="text-align: center">                         
                            <form action="editUserManager" method="GET">
                                <input type="hidden" name="uid" value="${l.id}">
                                <button type="submit" >
                                    <i class="fa-solid fa-pen"></i>
                                </button>
                            </form>
                        </td>
                        <td style="text-align: center">                         
                            <form action="deleteUserManager" method="POST">
                                <input type="hidden" name="uid" value="${l.id}">
                                <button type="submit" >
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:if test="${euser!=null}">
            <div>
                <form method="POST" action="editUserManager">
                    <input type="hidden" name="id" value="${euser.id}">
                    Email: <input type="email" name="email" value="${euser.email}"><br><br>
                    Password: <input type="password" name="pass" value="${euser.password}"><br><br> 
                    Name: <input type="text" name="name" value="${euser.fullname}"><br><br>          
                    Gender: <input type="radio" name="gender" value="1" ${euser.gender?"checked":""}>Male<input type="radio" name="gender" value="0" ${!euser.gender?"checked":""}>Female<br><br>          
                    Phone: <input type="text" name="phone" value="${euser.phone}"><br><br>              
                    DOB: <input type="date" name="dob" value="${euser.dob}"><br><br>          
                    Address: <input type="text" name="address" value="${euser.address}"><br><br>          
                    <input type="submit" value="Save" />
                </form>
            </div>
        </c:if>

    </body>
</html>
