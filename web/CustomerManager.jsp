<%-- 
    Document   : CustomerManager
    Created on : 06/05/2023, 1:42:34 PM
    Author     : kyler
--%>

<%@page import="IOTB.model.dao.*"%>
<%@page import="IOTB.model.beans.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <% if (session.getAttribute("staff") != null) { %>
            <a class="active" href='CustomerManager.jsp'> Manage Customers</a>
            <a href ='Catalogue.jsp'> Manage Inventory </a>
            <a href =''> Manage AccessLogs</a>
            <% } %>
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null) { %>
            <a href = 'edit.jsp'> my account </a>
            <% } %> 
            <%if (session.getAttribute("customer") != null && session.getAttribute("staff") == null) { %>
            <a href ='Catalogue.jsp'>Catalogue</a>
            <% } %>

            <a  href="logout.jsp" >Logout</a>
        </div>
            
 
                
               <%   ///Page Variables
                   //Customer Editcustomer = (Customer) session.getAttribute("editCustomer");
                           
                    String userNameErr = (String) session.getAttribute("userNameErr");
                    String emailErr = (String) session.getAttribute("emailErr");
                    String firstNameErr = (String) session.getAttribute("firstNameErr");
                    String lastNameErr = (String) session.getAttribute("lastNameErr");
                    String passwordErr = (String) session.getAttribute("passwordErr");
                    String DOBErr = (String) session.getAttribute("DOBErr");
                    String phoneNumErr = (String) session.getAttribute("phoneNumErr");
                    String streetErr = (String) session.getAttribute("streetErr");
                    String suburbErr = (String) session.getAttribute("suburbErr");
                    String stateErr = (String) session.getAttribute("stateErr");
                    String postCodeErr =(String) session.getAttribute("postCodeErr");
               %> 

              <div style = "display:flex">
                 

           <div class ="contentcontainer" >
                <br>
                <h1 id="underlineandcenter">Customer List</h1>
                <form>
                <input  id = "customerSearch" type = "text" name = "customerSearch" >
                </form>
                

                <%
                    DBManager manager = (DBManager) session.getAttribute("manager");
                    ArrayList<Customer> customers = manager.searchCustomer(request.getParameter("customerSearch"));

                    out.println("<table border='1'>");
                    out.println("<tr><th>ID</th><th>Name</th><th>Email</th><th>Pass</th><th>Edit</th></tr>");
                    for(Customer cus: customers) {
                        out.println("<tr>");
                        out.println("<td>" + cus.getCustomerId() + "</td>");
                        out.println("<td>" + cus.getFirstName() + " " + cus.getLastName() + "</td>");
                        out.println("<td>" + cus.getEmail() + "</td>");
                        out.println("<td>" + cus.getPassword() + "</td>");
                        out.println("<td>");
                        out.println("<form method='post' action='editCustomer'>");
                        out.println("<input type='hidden' id='customerEmail'  name ='customerEmail' value='" + cus.getEmail() + "'/>");
                        out.println("<input type='hidden' id='customerPass' name='customerPass' value='" + cus.getPassword() + "'/>");
                        out.println("<input type='submit' value='Edit'/>");
                        out.println("</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");

                %>
                    <table border="1" cellpadding="5">
                <caption><h2>List of Books</h2></caption>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Pass</th>
                    <th>Action</th>
                </tr>
            </table>
                
            </div>
         
                </div>
        </div>  
    </body>
</html>
