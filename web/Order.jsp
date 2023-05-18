<%-- 
    Document   : Order
    Created on : 18/05/2023, 10:03:34 PM
    Author     : anishsharma
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
        <title>Order Page</title>
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
            
            <% if (session.getAttribute("customer") != null && session.getAttribute("admin") == null && session.getAttribute("staff") == null) { %>
            <a href="mainpage.jsp"> Home </a>
            <a class="active"  href ='Catalogue.jsp'> Catalogue </a>
            
            <% } %>
           
            
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null || session.getAttribute("admin") != null) { %>
            <a href = 'edit.jsp'> my account </a>
            <a  href="logout.jsp"  >Logout</a>
            <% } %> 
        </div>

        <div class="contentcontainer">
            <form method = "POST">
                <h4 style = "text-align: center">Review your Order</h4>
            </form>
            <%
                DBManager manager = (DBManager) session.getAttribute("manager");
                ArrayList<Device> cartItems = manager.getCartItems(session);

                out.println("<table border='1'>");
                out.println("<tr><th>Device Name</th><th>Device Price</th><th>Remove</th></tr>");
                for (Device dev : cartItems) {
                    out.println("<tr>");
                    out.println("<td>" + dev.getDeviceName() + "</td>");
                    out.println("<td>" + "$ " + dev.getDeviceCurrentPrice() + "</td>");
                    out.println("<td>");
                    out.println("<form action='CartServlet' method='POST'>");
                    out.println("<input type='hidden' name='action' value='removeFromCart'>");
                    out.println("<input type='hidden' name='deviceId' value='" + dev.getDeviceID() + "'>");
                    out.println("<input type='submit' value='Remove'>");
                    out.println("</form>");
                    out.println("</td>");
                    out.println("</tr>");
                }
                out.println("</table>");

                out.println("<form action='PaymentServlet' method='POST'>");
                out.println("<input type='hidden' name='action' value='makePayment'>");
                out.println("<input type='submit' value='Checkout'>");
                out.println("</form>");
            %> 
        </div>
    </body>
</html>
