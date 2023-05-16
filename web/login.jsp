<%-- 
    Document   : login
    Created on : 28 Mar 2023, 11:20:35 am
    Author     : Jack
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="style.css">

    </head>
    <body >
        <div class="topbanner"></div>

        <div class="topnav">
            <a href="index.jsp"> Home </a>
            <a  href="register.jsp"> Register </a>
            <a class="active"  href="login.jsp"> Login </a>
            <% if (session.getAttribute("staff") != null) { %>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a  href ='Catalogue.jsp'> Manage Inventory </a>
<<<<<<< HEAD
            <% } %>
            
            <% if (session.getAttribute("admin") != null) { %>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a  href ='Catalogue.jsp'> Manage Inventory12 </a>
            <% } %>
            
=======
            <a href =''> Manage AccessLogs</a>
            <% } %>
>>>>>>> main
            <%if (session.getAttribute("staff") == null) { %>
            <a href ='Catalogue.jsp'>Catalogue</a>
            <% } %>

            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null) { %>
            <a href = 'edit.jsp'> my account </a>
            <a  href="logout.jsp"  >Logout</a>
            <% } %> 

        </div>


        <%
            String existErr = (String) session.getAttribute("existErr");
            String credentialErr = (String) session.getAttribute("credentialErr");
            String passErr = (String) session.getAttribute("passErr");

        %>


        <br>

        <div class ="contentcontainer">
            <form action="LoginServlet" method = "post">  
                <table>
                    <tr>
                    <h1 id="underlineandcenter">Login</h1>
                    <h4><%=(existErr != null ? existErr : "")%></h4>
                    </tr>

                    <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
                    <tr>
                        <td><label for = "email"> Username or Email:</label></td>
                        <td><input type = "text" id = "emailuser" name = "emailuser" placeholder="<%= (credentialErr != null ? credentialErr : "Enter Email or Username")%>" ></td>
                    </tr>
                    <tr>
                        <td><label for = "password">Password: </label></td>
                        <td><input type = "password" id = "password" name ="password" placeholder ="<%= (passErr != null ? passErr : "Enter password")%>" ></td>
                    </tr>

                    <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->

                    <td></td>
                    <td>                     
                        <input type ="submit" id ="login_btn" value = " Login ">
                    </td>


                </table>
        </div>

    </form>

    <br>

</body>
</html>
