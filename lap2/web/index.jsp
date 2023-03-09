<%-- 
    Document   : list
    Created on : Jan 31, 2023, 10:40:49 AM
    Author     : The Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Student,java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>List of student</h1>

        <form action="student" method="get">           
            Number of Students:
            <input type="text" name="txt"/>
            <input type="submit" value="generate" />
            <br>
        </form>

        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>DOB</th>
                </tr>
            </thead>

            <%
                if(request.getAttribute("data") != null){
                 List<Student> list = (List<Student>)request.getAttribute("data");
                for(int i = 0;i < list.size();i++){
                Student s = list.get(i);
            %>
            <tr>
                <th><%= s.getId() %></th> 
                <th><%= s.getName() %></th> 
                    <% 
                       if (s.isGender()){
                    %>
                <th><img width="15px"  src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpQfA3riNLqLu4ONjbGnzMziE7WlsNuBPRTQ&usqp=CAU"/></th>
                    <% }else{
                    %>
                <th><img width="15px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmyEicVUKHLdZFp85Ti6rWWx459XbbuGybqw&usqp=CAU"/></th>
                    <%}
                    %>
                <th><%= s.getDob() %></th> 
            </tr>
            <%
                }
                 }
            %>

        </table>

    </body>
</html>
