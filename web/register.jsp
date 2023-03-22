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
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">

    </head>
    <body>
        <form action="welcome.jsp" method = "POST">
            
            <table>
                <tr>
                    <td><h1>Registration form</h1></td>
                </tr>
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
                    
                    <td><label for = "tos">Tos:</label></td>

                </tr>
                <tr>
                    <td><button>next Page</button></td>
                </tr>

            </table>

        </form>
    </body>
</html>
