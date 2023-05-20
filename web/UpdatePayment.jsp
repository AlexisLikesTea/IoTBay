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
        <title>Manage Payments</title>
</head>
<body>
    <h1>Manage Payments</h1>
    
    <table>
        <tr>
            <th>Payment ID</th>
            <th>Card Name</th>
            <th>Card Number</th>
            <th>CVC</th>
            <th>Expiry Date</th>
            <th>Action</th>
        </tr>
        
        <% for (Payment payment : payments) { %>
            <tr>
                <td><%= payment.getPaymentID() %></td>
                <td><%= payment.getPaymentCardName() %></td>
                <td><%= payment.getPaymentCardNumber() %></td>
                <td><%= payment.getPaymentCardCVC() %></td>
                <td><%= payment.getPaymentCardExpiryDate() != null ? payment.getPaymentCardExpiryDate().toString() : "" %></td>
                <td>
                    
                    
                    <form action="UpdatePaymentServlet" method="POST">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="paymentID" value="<%= payment.getPaymentID() %>">
                        <input type="text" name="cardName" value="<%= payment.getPaymentCardName() %>">
                        <input type="text" name="cardNumber" value="<%= payment.getPaymentCardNumber() %>">
                        <input type="text" name="cvc" value="<%= payment.getPaymentCardCVC() %>">
                        <input type="text" name="expiryDate" value="<%= payment.getPaymentCardExpiryDate() != null ? payment.getPaymentCardExpiryDate().toString() : "" %>">
                        <input type="submit" value="Update">
                    </form>
                </td>
            </tr>
        <% } %>
    </table>
</body>
</html>