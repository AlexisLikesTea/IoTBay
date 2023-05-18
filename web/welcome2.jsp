<%-- 
    Document   : welcom
    Created on : 14/03/2023, 2:37:25 PM
    Author     : aliaghajafari
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
            <a   href="index.jsp"> Home </a>
            <a class="active" href='StaffManager.jsp'> Manage Staff Members</a>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a href ='Catalogue.jsp'> Manage Inventory </a>
            <a href = 'edit.jsp'> my account </a>
            <a  href="logout.jsp"  >Logout</a>
            
        </div>

            <div class="contentcontainer">
                
                    <h1 id="underlineandcenter"> New Staff created!</h1><br>
                    <a href="registerStaff.jsp"> Make another Staff</a>
                    <a href="StaffManager.jsp"> Return </a>

            </div>


    </body>
</html>
