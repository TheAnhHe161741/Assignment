<%-- 
    Document   : register.jsp
    Created on : Feb 6, 2023, 4:37:48 PM
    Author     : pc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            h1{
              color: blue; 
              text-transform: uppercase;
              text-align: center;
              font-family: arial;
              background-image: url("https://png.pngtree.com/thumb_back/fw800/background/20210903/pngtree-mens-clothing-store-sportswear-shopping-photography-map-with-pictures-image_796890.jpg");
              background-size: cover;
           height: 100px;
            }
        </style>
        <script>
            function validate(){
                var pass=document.getElementById("pass").value
                  var cfpass=document.getElementById("cfpass").value
                  if(pass==cfpass){
                   document.getElementById("registerform").submit();
                  }else{
                      alert("mat khau khong khop");
                      }
            }
            
            
        </script>
    </head>
    <body>
        <h1>Tạo Tài Khoản</h1>
       
        <table >
<!--            <thead>
                <tr>
                    <th></th>
                    <th></th>
                </tr>
            </thead>-->
            <tbody>
                  <form action="Register" method="post" id="registerform">
                <tr>
                    <td>Ho va ten  (*)</td>
                    <td><input type="text" name="fullname"></td>
                </tr>
                <tr>
                    <td>Ten dang nhap (*)</td>
                    <td><input type="text" name="uname"></td>
                </tr>
                <tr>
                    <td>Mat Khau(*)</td>
                    <td><input type="password" name="pass" id="pass"></td>
                </tr>
                <tr>
                    <td>Xac nhan mat khau</td>
                    <td><input type="password" name="cfpass" id="cfpass"></td>
                </tr>
                <tr>
                    <td>Gioi Tinh</td>
                    <td><input type="radio" checked name="gender" value="Nam" name="">Nam<input type="radio"  value="Nu" name="gender">Nu</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email"></td>
                </tr>
                <tr>
                    <td>Dia chi</td>
                    <td><textarea  name="address" ></textarea></td>
                </tr>
                <tr>
                    <td>Thông tin người dùng</td>
                    <td><input type="checkbox" name="agr" value="toi chap nhan">Tôi đồng ý các điều khoản</td>
                </tr>
                    </form>
                <tr>
                    <td></td>
                    <td><button onclick="validate()">Đăng Ký</button> <button type="reset">Hủy</button></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>


        <p style="color: red;">${mess}</p>
        <p>${fullname}</p>
        <p>${uname}</p>
          <p>${pass}</p>
               <p>${cfpass}</p>
               <p>${gender}</p>
               <p>${email}</p><!-- comment --><!--        <p></p> --><!--        <p></p> -->
                      <p>${address}</p>
                             <p>${agr}</p>
    </body>
</html>

