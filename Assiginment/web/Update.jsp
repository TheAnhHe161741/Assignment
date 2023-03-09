<%-- 
    Document   : list
    Created on : Jan 31, 2023, 10:40:49 AM
    Author     : The Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="update" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td>
                        <input value="${st.id}" type="text" name="id" readonly>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>
                        <input  value="${st.name}"type="text" name="name">
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <input type="radio" name="gender" value="1" ${st.gender == 1?"checked":""}>Male
                        <input type="radio" name="gender" value="0" ${st.gender == 0?"checked":""}>Female
                    </td>
                </tr>
                <tr>
                    <td>Dob</td>
                    <td><input  value="${st.dob}" type="text" name="dob"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><button type="submit">Update</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>
