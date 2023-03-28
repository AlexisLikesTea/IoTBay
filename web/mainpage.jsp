<%-- 
    Document   : mainpage
    Created on : 28 Mar 2023, 11:05:44 am
    Author     : Jack
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
        <%
            Customer customer = (Customer)session.getAttribute("customer");
        %>
        <div class="topbanner"></div>

        <div class="topnav">
           <a href="index.html"> Home </a>
            <a href="register.jsp"> Register </a>
            <a> Login </a>                     <!-- This is the top nav bar code-->
        </div>

        <div class="contentcontainer">
            <h1>You are logged in as "${customer.name}"</h1> 
            <a href="logout.jsp" class="button" >Logout</a>
            <a href="edit.jsp" class="button" >Edit Info</a>
        </div> 
    </body>
</html>
