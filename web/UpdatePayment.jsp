<%-- 
    Document   : UpdatePayment
    Created on : 20/05/2023, 9:31:21 AM
    Author     : Alexis
--%>
<%-- 
    Document   : DeletePayment
    Created on : 20/05/2023, 1:52:50 AM
    Author     : Alexis
--%>
<%@page import="IOTB.model.beans.*"%>
<%@ page import="java.util.List" %>
<%@ page import="IOTB.model.dao.*" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    DBManager manager = (DBManager) session.getAttribute("manager");    
    Customer customer = (Customer) session.getAttribute("customer");
    String customerID = customer.getCustomerId();
    List<Payment> payments = manager.getUserPayments(customer.getCustomerId());
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
%>   

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Manage Payments</title>
    </head>
    <body>
            
    <div class="topbanner"></div>

        <!-- This is the top nav bar code-->
        <div class="topnav">
            <a href="index.jsp"> Home </a>
            <% if (session.getAttribute("staff") != null) { %>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a  href ='Catalogue.jsp'> Manage Inventory </a>
            <a href =''> Manage AccessLogs</a>
            <% } %>
            <%if (session.getAttribute("staff") == null) { %>
            <a  href ='Catalogue.jsp'>Catalogue</a>
            <% } %>
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null) { %>
            <a class="active" href = 'edit.jsp'> my account </a>
            <a  href="logout.jsp"  >Logout</a>
            <% }%> 
        </div>
        <h1>Manage Payments</h1>
        <form action="PaymentDetails.jsp" method="post" target="_self">
                    <input type="submit" value="Add a card">
        </form>
        <span>   |   </span>
        <form action="DeletePayment.jsp" method="post" target="_self">
                    <input type="submit" value="Delete a card">
        </form>
        <table>
            <tr>
<!--                <th>Payment ID</th>-->
                <th>Card Name</th>
                <th>Card Number</th>
                <th>CVC</th>
                <th>Action</th>
            </tr>
             <h4> <%= (String) request.getAttribute("cvvError") != null ? request.getAttribute("cvvError") : ""%> </h4>
             <h4> <%= (String) request.getAttribute("cNameError") != null ? request.getAttribute("cNameError") : ""%> </h4>
             <h4> <%= (String) request.getAttribute("cardNumError") != null ? request.getAttribute("cardNumError") : ""%> </h4>
            <% for (Payment payment : payments) { %>
                <tr>
<!--          //           <td><%= payment.getPaymentID() %></td>-->
                    <form action="UpdatePaymentServlet" method="POST">
                        <td><input type="text" name="cardName" value="<%= payment.getPaymentCardName() %>" /></td>
                        <td><input type="text" name="cardNum" value="<%= payment.getPaymentCardNumber() %>" /></td>
                        <td><input type="text" name="cvc" value="<%= payment.getPaymentCardCVC() %>" />
                        
                         </td>
                        <td>
                            <input type="hidden" name="action" value="update" />
                            <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>" />
                            <input type="submit" value="Update" />
                        </td>
                    </form>
                </tr>
            <% } %>
        </table>
    </body>
</html>
