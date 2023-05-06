<%-- 
    Document   : mainpage
    Created on : 28 Mar 2023, 11:05:44 am
    Author     : Jack
--%>
<%@page import="IOTB.model.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="IOTB.model.beans.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Main Page</title>
    </head>

    <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->

    <body class = "welcome">
        <%
            Customer customer = (Customer) session.getAttribute("customer");
            Staff staff = (Staff) session.getAttribute("staff");
        %>

        <div class="topbanner"></div>

        <!-- This is the top nav bar code-->
        <div class="topnav">
            <a href="index.jsp"> Home </a>
            <a href="register.jsp"> Register </a>
            <a class="active" href="login.jsp"> Login </a>
            <% if (session.getAttribute("staff") != null) { %>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a href ='Catalogue.jsp'> Manage Inventory </a>
            <a href =''> Manage AccessLogs</a>
            <% } %>
            <%if (session.getAttribute("customer") != null && session.getAttribute("staff") == null) { %>
            <a href ='Catalogue.jsp'>Catalogue</a>
            <% } %>
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null) { %>
            <a href = 'edit.jsp'> my account </a>
            <a  href="logout.jsp"  >Logout</a>
            <% } %> 

            <a  href="logout.jsp"  >Logout</a>
        </div>

        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->

        <div class="contentcontainer">
            <% if (session.getAttribute("customer") != null) { %>
            <h1>Welcome Back ${customer.firstName} find the IOT device of your dreams </h1> 
            <% } else if (session.getAttribute("staff") != null) {%>
            <h1> Get to work ${staff.staffFirstName}!</h1> 
            <% }%> 
        </div> 
    </body>
</html>
