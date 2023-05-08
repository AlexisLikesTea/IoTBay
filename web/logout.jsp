<%-- 
    Document   : logout
    Created on : 28 Mar 2023, 11:07:48 am
    Author     : Jack
--%>
<%@page import="IOTB.model.beans.*"%>
<%@page import="IOTB.model.dao.*"%>
<%@page import="IOTB.model.beans.Customer"%>
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
        
        <% //logout logic 
            Customer customer = (Customer) session.getAttribute("customer");
            String LogId = (String) session.getAttribute("SessionLogId");
            
           
            
            DBManager manager = (DBManager) session.getAttribute("manager");
            manager.updateAccessLog(LogId);

            %>
        <div class="topbanner"></div>
        <div class="topnav">
            <a href="index.jsp" >Home</a> 
            <a class="active" href="logout.jsp" >Logout</a>
        </div>
        <div class="contentcontainer">
            <h3>You have been logged out, click here to go back to the home page</h3>
            <a href="index.jsp" class="button" >Home</a>
        </div>
        <% session.invalidate();%>
    </body>
</html>
