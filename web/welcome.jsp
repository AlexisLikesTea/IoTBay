<%-- 
    Document   : welcom
    Created on : 14/03/2023, 2:37:25 PM
    Author     : aliaghajafari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
    </head>
    
    
    <body class = "welcome">
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            String favColor = request.getParameter("color-picker");


        %>
        <h1>Welcome <%=name%> !</h1>
        <p> Your email is <%=email%></p>
        <p> Your Password is <%=password%></p>
        <p> Your gender is <%=gender%></p>
        <p> Your favColor is <%=favColor%></p>
        
        
        <!--<p>Your Password is $ {param.password</p>-->
        
        
        <style>
            .welcome{
                background: <%=favColor%>;
            }
        </style>
    </body>
</html>
