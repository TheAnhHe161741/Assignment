
<%-- 
    Document   : detail
    Created on : Mar 5, 2023, 12:25:31 AM
    Author     : TheAnh
--%>
<%@page import="model.DataAccount"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> Hello: ${requestScope.data} </h1>
        <form action="LoginServlet" method="get">
            <input type="submit" value="sign out">
        </form>
    </body>
</html>
