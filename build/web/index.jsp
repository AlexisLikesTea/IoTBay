<%-- 
    Document   : index
    Created on : 03/05/2023, 2:57:12 PM
    Author     : kyler
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="IOTB.model.dao.*"%>
<%@page import="IOTB.model.beans.*"%>

<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>IoTBay</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="topbanner"></div>
        
        <div class="topnav">
            <a  class="active" href="index.jsp"> Home </a>
            <a href="register.jsp"> Register </a>
            <a href="login.jsp"> Login </a>
            <% if (session.getAttribute("staff") != null) { %>
                <a href='CustomerManager.jsp'> Manage Customers</a>
                <a href ='Catalogue.jsp'> Manage Inventory </a>
                <a href =''> Manage AccessLogs</a>
            <% } %>

            <%if (session.getAttribute("staff") == null) { %>
                <a  href ='Catalogue.jsp'>Catalogue</a>
            <% }%>
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null) { %>
                <a href = 'edit.jsp'> my account </a>
                <a  href="logout.jsp"  >Logout</a>
            <% } %> 
        </div>
    </div>

        <div class="contentcontainer">
            <h1 id="underlineandcenter">Welcome to the IoTBay Store Homepage!</h1><br>

            <h4 id="center">If you are new to our site please select the register option above.</h4>

            <h4 id="center">If you are a returning customer you may select the login option instead.</h4>
              
        </div>
        <jsp:include page ="/ConnServlet" flush ="true" />
    </body>
</html>
