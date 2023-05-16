<%-- 
    Document   : CustomerDBtestPage
    Created on : 03/05/2023, 2:32:47 PM
    Author     : kyler
--%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*, IOTB.model.beans.*, IOTB.model.dao.*" %>
<h1> Find Customers Test output:  </h1>
<%
    // Establish database connection
    DBConnector db = new DBConnector();
    Connection conn = db.openConnection();
    
    DBManager manager = new DBManager(conn);
    // Create DBManager object
    // Fetch all customers from the database
    
        //String email = request.getParameter("email");
    //String password = request.getParameter("password");
    
    %> 
    
    <%
    
    // Execute the findCustomer method
    Customer Testcustomer = null;
     
    Testcustomer = manager.findCustomer("abc@cat.com", "Yert");

    // Close the database connection

    if (customer == null) {
        out.println("Customer not found");
    } else {
        out.println("Customer found: " + Testcustomer.getFirstName() + " " + Testcustomer.getLastName());
    }

    ArrayList<Customer> customers = manager.fetchCustomers();
    // Output customer information in a table
    out.println("<table border='1'>");
    out.println("<tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th></tr>");
    for (Customer customer : customers) {
        out.println("<tr>");
        out.println("<td>" + customer.getCustomerId() + "</td>");
        out.println("<td>" + customer.getFirstName() + " " + customer.getLastName() + "</td>");
        out.println("<td>" + customer.getEmail() + "</td>");
        out.println("<td>" + customer.getPhoneNum() + "</td>");
        out.println("</tr>");
    }
    out.println("</table>");
%>


