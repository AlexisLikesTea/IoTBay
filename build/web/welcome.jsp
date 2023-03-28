<%-- 
    Document   : welcom
    Created on : 14/03/2023, 2:37:25 PM
    Author     : aliaghajafari
--%>
<%@page import="Customer.Info.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Welcome</title>
    </head>
    
    
    <body class = "welcome">
        <div class="topbanner"></div>

        <div class="topnav">
            <a href="mainpage.jsp"> Main Page </a>
        </div>

        
             <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            String favColor = request.getParameter("color-picker");
            String tos = request.getParameter("tosAgree");
        %>
        <% if (tos != null) { %>
            <h1 id="underlineandcenter">Welcome <%=name%> !</h1><br>
            <h3> Your email is <%=email%></h3>
            <h3> Your Password is <%=password%></h3>
            <h3> Your gender is <%=gender%></h3>
            <h3> Your favourite Color is <%=favColor%></h3>
            <h3>Use this button to access the main page: </h3><a href="mainpage.jsp" class="button" >Main Page</a>
         <% } else { %>
            <h1 id="underlineandcenter">Sorry, you must agree to the terms of service.</h1><br>
            <a href="register.jsp" class="button" >Return to Register page</a>
         <% } %>
         
         <%
            Customer customer = new Customer(name,email,password,gender,favColor);
            session.setAttribute("customer", customer);
         %>
        </div>

        
    </body>
</html>
