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
    <body>
        <div class="topbanner"></div>

        <div class="topnav">
            <a href="index.html"> Home </a>
            <a href="register.jsp"> Register </a>
            <a class="active" href ="login.jsp">Login </a>
        </div>
        <div class="contentcontainer">
        <br>
            <form action="welcome.jsp" method = "POST">  
            <table>
                <tr>
                    <h1 id="underlineandcenter">Login</h1>
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
                
                   <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
                <tr>
                    <td><label for = "tos">Terms of Service: </label></td> 
                    <td> <input type="checkbox" id="tosAgree" name="tosAgree" value="Agreed">I Agree</td>  

                </tr>
                <tr>
                    <td><button>Login</button></td>
                </tr>
            </table>
        </form>
        <br>
    </div>
    </body>
</html>
