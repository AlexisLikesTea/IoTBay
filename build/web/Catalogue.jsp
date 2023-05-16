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
            
            <% if(session.getAttribute("staff") == null && session.getAttribute("customer") == null && session.getAttribute("admin") == null){ %>
                <a href="index.jsp"> Home </a>
                <a href="register.jsp"> Register </a>
                <a href="login.jsp"> Login </a>
                <a class="active" href ='Catalogue.jsp'>Catalogue</a>
            <% } %>
            <% if (session.getAttribute("staff") != null) { %>
            <a href="mainpage.jsp"> Home </a>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a class="active"  href ='Catalogue.jsp'> Manage Inventory </a>
            <% } %>
            
            <% if (session.getAttribute("admin") != null) { %>
            <a href="mainpage.jsp"> Home </a>
            <a href='StaffManager.jsp'> Manage Staff Member</a>
            <a href='CustomerManager.jsp'> Manage Customer</a>
            <a class = "active" href ='Catalogue.jsp'> Manage Inventory</a>
               
            <% } %> 
            
            <% if (session.getAttribute("customer") != null) { %>
            <a href="mainpage.jsp"> Home </a>
            <a class="active"  href ='Catalogue.jsp'> Catalogue </a>
            
            <% } %>
           
            
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null || session.getAttribute("admin") != null) { %>
            <a href = 'edit.jsp'> my account </a>
            <a  href="logout.jsp"  >Logout</a>
            <% } %> 
        </div>

        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->

        <div class="contentcontainer">

            <!-- THE SECTION BELOW IS PLACEHOLDER -->
            <form method = "POST">
                <h4 style = "text-align: center">Browse the device catalogue</h4>
                <input style ="width:60%; text-align:center; margin: 0 20% 10px 20%; height: 30px" id = "deviceSearch" type = "text" name = "deviceSearch" placeholder="Search for a device">

            </form>
            <%
                // This should really be implimented in a new Servlet or Model controller. 
                //place holder for now to flesh out a product, pulled from test.
                DBManager manager = (DBManager) session.getAttribute("manager");
                ArrayList<Device> DeviceSearchResults = manager.findDevices(request.getParameter("deviceSearch"));

                // Output customer information in a table
                out.println("<table border='1'>");
                out.println("<tr><th>Name</th><th>Price</th><th>Image</th><th>Description</th><th>Type</th><th>Brand</th></tr>");
                for (Device dev : DeviceSearchResults) {
                    out.println("<tr>");
                    out.println("<td>" + dev.getDeviceName() + "</td>");
                    out.println("<td>" + "$ " + dev.getDeviceCurrentPrice() + "</td>");
                    out.println("<td>" + "<img src ='" + dev.getDeviceImage() + "'> " + "</td>");
                    out.println("<td>" + dev.getDeviceDescription() + "</td>");
                    out.println("<td>" + dev.getDeviceType() + "</td>");
                    out.println("<td>" + dev.getDeviceBrand() + "</td>");

                 
                    out.println("<td>");
                    
                        if (session.getAttribute("staff") != null || session.getAttribute("admin") != null) {

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
                        }
                        else if(session.getAttribute("customer") != null){
                            out.println("<form action='DeviceServlet' method='POST'>");
                            out.println("<input type='hidden' name='action' value='addToCard'>");
                            out.println("<input type='hidden' name='deviceId' value='" + dev.getDeviceID() + "'>");
                            out.println("<label for='quantity" + dev.getDeviceID() + "'>Quantity</label>");
                            out.println("<input type='number' id='quantity_" + dev.getDeviceID() + "' name='quantity'>");
                            out.println("<input type='submit' value='Add to cart'>");
                            out.println("</form>");
                        }    

                    out.println("</td>");
                    
                    out.println("</tr>");
                }
                out.println("</table>");


            %> 
        </div>
    </body>
</html>
