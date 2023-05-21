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
        <%  
            //Page Error variables
            
            String stdPriceErr = (String) session.getAttribute("stdPriceErr");
            String currentPriceErr = (String) session.getAttribute("currentPriceErr");
            String sohErr = (String) session.getAttribute("sohErr");
            String nameErr = (String) session.getAttribute("nameErr");
            
        %>
      
        <div class="topbanner"></div>

        <!-- This is the top nav bar code-->
        <div class="topnav">
            
            <% if (session.getAttribute("staff") != null) { %>
            <a href="mainpage.jsp"> Home </a>
            <a  href ='Catalogue.jsp'> Manage Inventory </a>
            <% } %>
            
            <% if (session.getAttribute("admin") != null) { %>
            <a href="mainpage.jsp"> Home </a>
            <a href='StaffManager.jsp'> Manage Staff Member</a>
            <a href='CustomerManager.jsp'> Manage Customer</a>
            <a href ='Catalogue.jsp'> Manage Inventory</a>
            <a href =''> Manage Access Logs</a>  
            <% } %> 
            
            <%if (session.getAttribute("staff") == null && session.getAttribute("admin") == null) { %>
            <a href="mainpage.jsp"> Home </a>
            <a  href ='Catalogue.jsp'>Catalogue</a>
            <% } %>
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null || session.getAttribute("admin") != null) { %>
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
                        <td><input type = "text" id = "name" name = "name" value=""/><h8> <%=(nameErr != null ? nameErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "deviceDescription">Description:</label></td>
                        <td><input type = "text" id = "description" name = "description" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for = "deviceBrand">Brand:</label></td>
                        <td><input type = "text" id = "Brand" name = "Brand" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for = "deviceSupplier">Supplier:</label></td>
                        <td><input type = "text" id = "Supplier" name = "Supplier" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for = "deviceSpecifications">Specifications:</label></td>
                        <td><input type = "text" id = "Specifications" name = "Specifications" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for = "deviceWRPolicy">Warranty:</label></td>
                        <td><input type = "text" id = "Warranty" name = "Warranty" value=""/></td>
                    </tr>
                    <tr>
                        <td><label for = "deviceStandardPrice">Standard Price:</label></td>
                        <td><input type="number" step="0.01" id = "stdPrice" name = "stdPrice" value=""/><h8> <%=(stdPriceErr != null ? stdPriceErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "deviceCurrentPrice">Current Price: </label></td>
                        <td><input type="number" step="0.01" id = "currentPrice" name = "currentPrice" value=""/><h8> <%=(currentPriceErr != null ? currentPriceErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "deviceType">Type: </label></td>
                        <td><input type = "text" id = "Type" name = "Type" value=""/></td> 
                        <!--possibly do a radio button thing here https://www.w3schools.com/html/html_form_input_types.asp-->
                    </tr>
                    <tr>
                        <td><label for = "deviceSOH">Stock On Hand:</label></td>
                        <td><input type="number" id = "soh" name = "soh" value=""/><h8> <%=(sohErr != null ? sohErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "deviceImage">Image (URL): </label></td>
                        <td><input type = "text" id = "url" name = "url" value=""/></td>
                    </tr>
                    
                    <tr><td></td>
                        <td>
                            <input class="button" type="submit" name="submit" value="addDevice">
                        </td>
                    </tr>
                </table>
            </form>
 
        </div>
        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
    </body>
</html>
