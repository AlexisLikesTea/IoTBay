<%-- 
    Document   : registerStaff.jsp
    Created on : 14/05/2023, 8:22:09 PM
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
            
        %>
        <div class="topbanner"></div>

        <div class="topnav">
            <a href="mainpage.jsp"> Home </a>
            <% if (session.getAttribute("staff") != null) { %>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a href ='Catalogue.jsp'> Manage Inventory </a>
            <a href =''> Manage AccessLogs</a>
            <% } %>
            
            <% if (session.getAttribute("admin") != null) { %>
            <a class = "active" href='StaffManager.jsp'> Manage Staff Member</a>
            <a href='CustomerManager.jsp'> Manage Customer</a>
            <a href ='Catalogue.jsp'> Manage Inventory</a>
            <a href =''> Manage AccessLogs</a>
               
            <% } %>
            
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null || session.getAttribute("admin") != null) { %>
            <a href = 'edit.jsp'> my account </a>
            <% } %> 
            <%if (session.getAttribute("customer") != null && session.getAttribute("staff") == null) { %>
            <a href ='Catalogue.jsp'>Catalogue</a>
            <% } %>

            <a  href="logout.jsp" >Logout</a>
        </div>

        <div class="contentcontainer">
            <% if(session.getAttribute("admin") != null) { %>
                <h1 id ="underlineandcenter"> Register a new Staff </h1>
                <a href="StaffManager.jsp"> Return </a>
            <% } %>
            <br>
            <form action="RegisterStaffController" method = "POST">  
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
                        <td><label for = "lastName">Position: </label></td>
                        <td><input type = "text" id = "position" name ="position" value=""></td>
                    </tr>
                 
                    
                    
                    <tr><td></td>
                        <td>
                            <input class="button" type="submit" value="Add">
                            
                        </td>
                    </tr>
                </table>
            </form>
            <br>
        </div>
    </body>
</html>

