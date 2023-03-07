<%-- 
    Document   : register.jsp
    Created on : Feb 6, 2023, 4:37:48 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="index.css">
    </head>
    <body>
        <section>
            <div class="form-box">
                <div class="form-value">
                    <form action="LoginControl" method="post">

                        <h2>Đăng Nhập</h2>
                        <div class="inputbox">
                            <ion-icon name="mail-outline"></ion-icon>
                            <input type="text" name="username"  required/>
                            <label for="">Tên Tài Khoản</label>
                        </div>
                        <div class="inputbox">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                            <input type="password" name="password" required/>
                            <label for="">Mật Khẩu</label>
                        </div>
                        <div class="forget">
                            <label for=""><input type="checkbox">Nhớ mật khẩu  <a href="#">Quên mật khẩu</a></label>

                        </div>
                        <button>Đăng nhập</button>
                        <div class="register">
                            <p> Chưa có tài khoản <a href="register.jsp">Đăng kí</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>

