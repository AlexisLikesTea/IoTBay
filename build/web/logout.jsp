<%-- 
    Document   : logout
    Created on : 28 Mar 2023, 11:07:48 am
    Author     : Jack
--%>
<%@page import="Customer.Info.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>IoTBay</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="topbanner">
            <a>   </a>
        </div>
        <div class="topnav"></div>
        <div class="contentcontainer">
            <h3>You have been logged out, click here to go back to the home page</h3>
            <a href="index.html" class="button" >Home</a>
        </div>
        <% session.invalidate(); %>
    </body>
</html>
