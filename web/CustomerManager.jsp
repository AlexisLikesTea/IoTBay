<%-- 
    Document   : CustomerManager
    Created on : 06/05/2023, 1:42:34 PM
    Author     : kyler
--%>

<%@page import="IOTB.model.dao.*"%>
<%@page import="IOTB.model.beans.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        
            <!-- This is the top nav bar code-->
             <div class="topbanner"></div>
        <div class="topnav">
           <a href="index.jsp"> Home </a>
            <a href="register.jsp"> Register </a>
            <a href="login.jsp"> Login </a>
            <% if(session.getAttribute("staff") != null){ %>
                <a class="active" href='CustomerManager.jsp'> Manage Customers</a>
                <a href ='Catalogue.jsp'> Manage Inventory </a>
                <a href =''> Manage AccessLogs</a>
             <% } %>
             <% if ( session.getAttribute("staff") != null || session.getAttribute("customer") != null){ %>
                <a href = 'edit.jsp'> my account </a>
                <% } %> 
                <%if(session.getAttribute("customer") != null && session.getAttribute("staff") == null){ %>
                 <a href ='Catalogue.jsp'>Catalogue</a>
                <% } %>
            
             <a  href="logout.jsp" >Logout</a>
        </div>
                
        
          <div class ="contentcontainer">
              <br>
        <h1 id="underlineandcenter">Customer List</h1>

        <%  
            DBManager manager = (DBManager) session.getAttribute("manager");
            ArrayList<Customer> customers = manager.fetchCustomers();
            // Output customer information in a table
            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Name</th><th>Email</th><th>Pass</th></tr>");
            for (int i = 1; i <= 50; i++) {
                out.println("<tr>");
                out.println("<td>" + customers.get(i).getCustomerId() + "</td>");
                out.println("<td>" + customers.get(i).getFirstName() + " " + customers.get(i).getLastName() + "</td>");
                out.println("<td>" + customers.get(i).getEmail() + "</td>");
                out.println("<td>" + customers.get(i).getPassword()+ "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

        %>
        </div>
    </body>
</html>
