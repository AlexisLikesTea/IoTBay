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
        <div class="topbanner"></div>

        <div class="topnav">
            <a href="index.jsp"> Home </a>
            <a class="active"  href="register.jsp"> Register </a>
            <a href="login.jsp"> Login </a>
            <% if (session.getAttribute("staff") != null) { %>
                <a href='CustomerManager.jsp'> Manage Customers</a>
                <a   href ='Catalogue.jsp'> Manage Inventory </a>
                <a href =''> Manage AccessLogs</a>
            <% } %>
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null) { %>
                <a href = 'edit.jsp'> my account </a>
                <a  href="logout.jsp"  >Logout</a>
            <% } %> 
            <%if(session.getAttribute("staff") == null){ %>
                 <a href ='Catalogue.jsp'>Catalogue</a>
                <% } %>

        </div>
                
        <div class="contentcontainer">
        <br>
            <form action="welcome.jsp" method = "POST">  
            <table>
                <tr>
                    <h1 id="underlineandcenter">Registration form</h1>
                </tr>
                
                <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
                
                <tr>
                    <td><label for = "email">Email:</label></td>
                    <td><input type = "email" id = "email" name = "email" ></td>
                </tr>
                <tr>
                    <td><label for = "name">Name: </label></td>
                    <td><input id = "name" type = "text" name = "name"></td>
                </tr>
                <tr>
                    <td><label for = "password">Password: </label></td>
                    <td><input type = "password" id = "password" name ="password" ></td>
                </tr>
                <tr>
                    <td><label for="gender">Gender: </label></td>
                    <td>
                        <select for = "gender"  name = "gender" id = "gender">
                            <option value = "male">Male</option>
                            <option value = "female">Female</option>
                            <option value = "other">other</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for = "favColoro">FavColor: </label></td>
                    <td><input type="color" id="color-picker" name="color-picker" value="#ff0000">
                    </td>
                </tr>
                <tr>
                    <td><label for = "tos">Terms of Service: </label></td> 
                    <td> <input type="checkbox" id="tosAgree" name="tosAgree" value="Agreed">I Agree</td>  

                </tr>
                
                   <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
                <tr>
                    <td><button>Register</button></td>
                </tr>
            </table>
        </form>
        <br>
    </div>
    </body>
</html>
