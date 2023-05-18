<%-- 
    Document   : register.jsp
    Created on : 14/03/2023, 2:11:59 PM
    Author     : aliaghajafari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" type="text/css" href="style.css">

    </head>
    <body>
        
        <%  
            //Page Error variables
            
            String userNameErr = (String) session.getAttribute("userNameErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String firstNameErr = (String) session.getAttribute("firstNameErr");
            String lastNameErr = (String) session.getAttribute("lastNameErr");
            String passwordErr = (String) session.getAttribute("passwordErr");
            String DOBErr = (String) session.getAttribute("DOBErr");
            
        %>
        <div class="topbanner"></div>

        <div class="topnav">
            <a href="index.jsp"> Home </a>
            <% if (session.getAttribute("staff") != null) { %>
            <a class = "active" href='CustomerManager.jsp'> Manage Customers</a>
            <a href ='Catalogue.jsp'> Manage Inventory </a>
            <% } %>
            
            <% if (session.getAttribute("admin") != null) { %>
            <a  href='StaffManager.jsp'> Manage Staff Member</a>
            <a class = "active" href='CustomerManager.jsp'> Manage Customer</a>
            <a href ='Catalogue.jsp'> Manage Inventory</a>
               
            <% } %>
            
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null || session.getAttribute("admin") != null) { %>
            <a href = 'edit.jsp'> my account </a>
            <% } %> 
            <a href ='logout.jsp'>logout</a>

        </div>

        <div class="contentcontainer">
            <% if(session.getAttribute("staff") == null){ %>
                <h1 id ="underlineandcenter"> To Register: Enter your customer details </h1>
            <% } else { %>
                <h1 id ="underlineandcenter"> Register a new customer </h1>
                    <a href="CustomerManager.jsp"> Return </a>
            <% } %>
            <br>
            <form action="RegisterCustomerController" method = "POST">  
                <table>
                    <tr>
                        <td><label for = "email">Email:</label></td>
                        
                        <td><input type = "email" id = "email" name = "email" value=""><h8> <%=(emailErr != null ? emailErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "userName">User Name: </label></td>
                        <td><input id = "userName" type = "text" name = "userName" value=""><h8> <%=(userNameErr != null ? userNameErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "firstName">First Name: </label></td>
                        <td><input id = "firstName" type = "text" name = "firstName" value=""><h8> <%=(firstNameErr != null ? firstNameErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "lastName">Last Name: </label></td>
                        <td><input type = "text" id = "lastName" name ="lastName" value=""><h8> <%=(lastNameErr != null ? lastNameErr : "")%> </h8></td>
                    </tr>
                    
                    <tr>
                        <td><label for = "password">Password: </label></td>
                        <td><input type = "password" id = "password" name ="password" value=""><h8> <%=(passwordErr != null ? passwordErr : "")%> </h8></td>
                    </tr>
                    
                 
                    <tr>
                        <td><label for="DOB">Date Of Birth </label></td>
                           <td><input type = "date"  onfocus="this.showPicker()" id = "DOB" name ="DOB" value="1995-12-12"><h8> <%=(DOBErr != null ? DOBErr : "")%> </h8></td>
                    </tr>
                    
                    <tr><td></td>
                        <td>
                            <input class="button" type="submit" value="Update">
                        </td>
                    </tr>
                </table>
            </form>
            <br>
        </div>
    </body>
</html>
