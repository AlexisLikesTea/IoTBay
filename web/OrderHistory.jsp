<%@page import="IOTB.model.beans.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="IOTB.model.dao.*"%>
<%@page import="java.text.DecimalFormat"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <title>Order History Page</title>
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
                <h4 style = "text-align: center">Browse Your Order History</h4>
                <input style ="width:60%; text-align:center; margin: 0 20% 10px 20%; height: 30px" id = "orderSearch" type = "text" name = "orderSearch" placeholder="Search for an order">
            </form>

            <%
                DBManager manager = (DBManager) session.getAttribute("manager");
                Customer customer = (Customer) session.getAttribute("customer");
                ArrayList<Order> OrderSearchResults;
                String orderSearch = request.getParameter("orderSearch");

                if(orderSearch != null && !orderSearch.isEmpty()){
                    OrderSearchResults = manager.findOrders(orderSearch, customer.getCustomerId());
                } else {
                    OrderSearchResults = manager.findAllOrders(customer.getCustomerId());
                }
                
                DecimalFormat df = new DecimalFormat("0.00");

                out.println("<table border='1'>");
                out.println("<tr><th>Order ID</th><th>Total Amount</th><th>Date</th></tr>");
                for (Order order : OrderSearchResults) {
                    out.println("<tr>");
                    out.println("<td>" + order.getOrderID() + "</td>");
                    out.println("<td>" + "$ " + df.format(order.getOrderTotalAmount()) + "</td>");
                    out.println("<td>" + order.getOrderDate() + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");

            %> 
           

        </div>
    </body>
</html>