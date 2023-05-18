<%-- 
    Document   : edit
    Created on : 28 Mar 2023, 12:20:35 pm
    Author     : Jack
--%>
<%@page import="IOTB.model.beans.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Edit</title>
    </head>
    <body>
        <%
            Customer customer = (Customer) session.getAttribute("customer");
            Staff staff = (Staff) session.getAttribute("staff");
            Admin admin = (Admin) session.getAttribute("admin");
            
            
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
            //Staff updated = request.getParameter("Updated");
        %>

      
        <div class="topbanner"></div>

        <!-- This is the top nav bar code-->
        <div class="topnav">
            
            <% if (session.getAttribute("staff") != null) { %>
            <a href="mainpage.jsp"> Home </a>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a  href ='Catalogue.jsp'> Manage Inventory </a>
            <a href =''> Manage AccessLogs</a>
            <% } %>
            
            <% if (session.getAttribute("admin") != null) { %>
            <a href="mainpage.jsp"> Home </a>
            <a href='StaffManager.jsp'> Manage Staff Member</a>
            <a href='CustomerManager.jsp'> Manage Customer</a>
            <a href ='Catalogue.jsp'> Manage Inventory</a>
            <a href =''> Manage AccessLogs</a>  
            <% } %> 
            
            <%if (session.getAttribute("staff") == null && session.getAttribute("admin") == null) { %>
            <a href="mainpage.jsp"> Home </a>
            <a  href ='Catalogue.jsp'>Catalogue</a>
            <% } %>
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null || session.getAttribute("admin") != null) { %>
            <a class="active" href = 'edit.jsp'> my account </a>
            <a  href="logout.jsp"  >Logout</a>
            <% } %> 
        </div>

        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
        <div class="contentcontainer">
            <br>

            
            <h1 id="underlineandcenter">Edit your current details</h1>
            
            <form action="addDeviceServlet" method = "POST">  
                <table>
                    <tr>
                        <td><label for = "deviceName">Name:</label></td>
                        <td><input type = "text" id = "name" name = "name" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for = "deviceDescription">Description:</label></td>
                        <td><input type = "text" id = "description" name = "description" value=""/></td>
                    </tr>
                    
                    <tr><td></td>
                        <td>
                            <input class="button" type="submit" value="Add button">
                            
                        </td>
                    </tr>
                </table>
            </form>
 
        </div>
        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
    </body>
</html>
