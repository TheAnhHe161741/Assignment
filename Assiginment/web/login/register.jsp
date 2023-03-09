<%-- 
    Document   : register
    Created on : Jan 28, 2023, 9:51:50 AM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            a{
             text-decoration: none;
            }
            body{
                min-height: 100vh;
                width: 100%;
                background: url('background6.jpg')no-repeat;
                background-position: center;
                background-size: cover;
                }
                h1{
                    color: blue;
                    text-transform: uppercase;
                    text-align: center;
                    font-family: arial;
                    height: 100px;
           
                }
                table{
                    display: flex;
                    justify-content: center;
                    margin: 0 auto;
                }
                td{
                    color: #fff;
                }
                .form-box{
    position: relative;
    width: 400px;
    height: 450px;
    background: transparent;
    border: 2px solid rgba(255,255,255,0.5);
    border-radius: 20px;
    backdrop-filter: blur(15px);
    display: flex;
    justify-content: center;
    align-items: center;

}
                
            </style>
            <script>
                function validate() {
                    var pass = document.getElementById("pass").value
                    var cfpass = document.getElementById("cfpass").value
                    if (pass == cfpass) {
                        document.getElementById("registerform").submit();
                    } else {
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
                        <td>Họ Và Tên  (*)</td>
                        <td><input type="text" name="fullname"></td>
                    </tr>
                    <tr>
                        <td>Tên Đăng Nhập (*)</td>
                        <td><input type="text" name="uname"></td>
                    </tr>
                    <tr>
                        <td>Mật Khẩu(*)</td>
                        <td><input type="password" name="pass" id="pass"></td>
                    </tr>
                    <tr>
                        <td>Xác Nhận Mật Khẩu</td>
                        <td><input type="password" name="cfpass" id="cfpass"></td>
                    </tr>
                    <tr>
                        <td>Giới Tính</td>
                        <td><input type="radio" checked name="gender" value="Nam" name="">Nam<input type="radio"  value="Nu" name="gender">Nữ</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="email"></td>
                    </tr>
                    <tr>
                        <td>Địa Chỉ</td>
                        <td><textarea  name="address" ></textarea></td>
                    </tr>
                    <tr>
                        <td>Thông tin người dùng</td>
                        <td><input type="checkbox" name="agr" value="toi chap nhan">Tôi đồng ý các điều khoản</td>
                    </tr>
                </form>
                <tr>
                    <td></td>
                    <td><button onclick="validate()">Đăng Ký</button> <button ><a href="login.jsp" >Hủy</a></button></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
