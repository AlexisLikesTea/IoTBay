<%-- 
    Document   : un-Register
    Created on : 15/05/2023, 10:18:02 AM
    Author     : kyler
--%>

<%@page import="IOTB.model.beans.Customer"%>
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
            <a  class="active" href="index.jsp"> Home </a>
            <% if (session.getAttribute("staff") == null && session.getAttribute("customer") == null && session.getAttribute("admin") == null) { %>
            <a href="register.jsp"> Register </a>
            <a href="login.jsp"> Login </a>
            <% }%> 
            <% if (session.getAttribute("staff") != null) { %>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a href ='Catalogue.jsp'> Manage Inventory </a>
            <a href =''> Manage AccessLogs</a>
            <% } %>
            <% if (session.getAttribute("admin") != null) { %>
            <a href='CustomerManager.jsp'> Manage Customers12</a>
            <a href ='Catalogue.jsp'> Manage Inventory12 </a>
            <a href =''> Manage AccessLogs</a>
            <% } %>

            <%if (session.getAttribute("staff") == null) { %>
            <a  href ='Catalogue.jsp'>Catalogue</a>
            <% }%>
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null) { %>
            <a href = 'edit.jsp'> my account </a>
            <a  href="logout.jsp"  >Logout</a>
            <% }%> 
        </div>

            <div class="contentcontainer">
                <h1>Are you sure you wish to remove your account, you will be logged out, your account will be removed and you will be redirected to the home page.</h1>
                <table>
                    <tr>
                        <td><a href ='edit.jsp'>Cancel</a></td>
                        <td>        
                            <form action ="unRegisterController" method="post">
                                <input class ="button" type ="submit" value ="Un-Register">
                            </form>
                        </td>
                    </tr>
                    
                </table>
            </div>


    </body>
</html>
