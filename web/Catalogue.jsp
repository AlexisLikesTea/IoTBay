<%-- 
    Document   : Catalogue
    Created on : 06/05/2023, 1:29:21 PM
    Author     : kyler
--%>

<%@page import="IOTB.model.beans.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="IOTB.model.dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>

        <div class="topbanner"></div>

        <!-- This is the top nav bar code-->
        <div class="topnav">
            <a href="index.jsp"> Home </a>
            <% if(session.getAttribute("staff") == null && session.getAttribute("customer") == null){ %>
                <a href="register.jsp"> Register </a>
                <a href="login.jsp"> Login </a>
            <% } %>
            <% if (session.getAttribute("staff") != null) { %>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a class="active"  href ='Catalogue.jsp'> Manage Inventory </a>
            <a href =''> Manage AccessLogs</a>
            <% } %>
            <%if (session.getAttribute("staff") == null) { %>
            <a class="active" href ='Catalogue.jsp'>Catalogue</a>
            <% } %>
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null) { %>
            <a href = 'edit.jsp'> my account </a>
            <a  href="logout.jsp"  >Logout</a>
            <% } %> 
        </div>

        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->

        <div class="contentcontainer">

            <!-- THE SECTION BELOW IS PLACEHOLDER -->
            <form method = "POST">
                <h4 style = "text-align: center"> IOT CATALOG.</h4>
                <input style ="width:80%;text-align:center; margin-left: 10%" id = "deviceSearch" type = "text" name = "deviceSearch" >

            </form>
            <%
                // This should really be implimented in a new Servlet or Model controller. 
                //place holder for now to flesh out a product, pulled from test.
                DBManager manager = (DBManager) session.getAttribute("manager");
                ArrayList<Device> DeviceSearchResults = manager.findDevices(request.getParameter("deviceSearch"));

                // Output customer information in a table
                out.println("<table border='1'>");
                out.println("<tr><th>NAME</th><th>Price</th><th>IMAGE</th><th>DESCRIPTION</th><th>Type</th><th>brand</th></tr>");
                for (Device dev : DeviceSearchResults) {
                    out.println("<tr>");
                    out.println("<td>" + dev.getDeviceName() + "</td>");
                    out.println("<td>" + "$ " + dev.getDeviceCurrentPrice() + "</td>");
                    out.println("<td>" + "<img src ='" + dev.getDeviceImage() + "'> " + "</td>");
                    out.println("<td>" + dev.getDeviceDescription() + "</td>");
                    out.println("<td>" + dev.getDeviceType() + "</td>");
                    out.println("<td>" + dev.getDeviceBrand() + "</td>");

                    out.println("<td>");

                    // Delete device button
                    out.println("<form action='DeviceServlet' method='POST'>");
                    out.println("<input type='hidden' name='action' value='deleteDevice'>");
                    out.println("<input type='hidden' name='deviceId' value='" + dev.getDeviceID() + "'>");
                    out.println("<input type='submit' value='Delete'>");
                    out.println("</form>");

                    // Update device price form
                    out.println("<form action='DeviceServlet' method='POST'>");
                    out.println("<input type='hidden' name='action' value='updateDevicePrice'>");
                    out.println("<input type='hidden' name='deviceId' value='" + dev.getDeviceID() + "'>");
                    out.println("<label for='price_" + dev.getDeviceID() + "'>Price:</label>");
                    out.println("<input type='number' id='price_" + dev.getDeviceID() + "' name='price' step='0.01'>");
                    out.println("<input type='submit' value='Update'>");
                    out.println("</form>");

                    out.println("</td>");
                    out.println("</tr>");
                }
                out.println("</table>");


            %> 
        </div>
    </body>
</html>
