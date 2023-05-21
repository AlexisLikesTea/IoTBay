<%-- 
    Document   : paymentscentral
    Created on : 19/05/2023, 10:08:53 PM
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
        <title>Payment Central</title>
    </head>
    <body>
        <h1>User Payments</h1>
     
        <table>
        <tr>
            <th>Payment ID</th>
            <th>Card Name</th>
            <th>Card Number</th>
            <th>CVC</th>
            <th>Expiry Date</th>
            <th>Customer ID</th>
        </tr>
        
        <% for (Payment payment : payments) { %>
        <tr>
            <td><%= payment.getPaymentID() %></td>
            <td><%= payment.getPaymentCardName() %></td>
            <td><%= payment.getPaymentCardNumber() %></td>
            <td><%= payment.getPaymentCardCVC() %></td>
            <td><%= payment.getPaymentCardExpiryDate() %></td>
            
        </tr>
        <% } %>
    </table>
    </body>
</html>
