<%-- 
    Document   : edit
    Created on : 28 Mar 2023, 12:20:35 pm
    Author     : Jack
--%>
<%@page import="Customer.Info.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
    </head>
    <body>
        <%
            Customer customer = (Customer)session.getAttribute("customer");
            String updated = request.getParameter("Updated");
        %>
        <div class="contentcontainer">
            <br>
            <h1>Edit your current details<span><%= (updated != null) ? "Update was successful":""%></span></h1>
                <form action="edit.jsp" method = "POST">  
                <table>
                    <tr>
                        <h1 id="underlineandcenter">Registration form</h1>
                    </tr>
                    <tr>
                        <td><label for = "email">Email:</label></td>
                        <td><input type = "email" id = "email" name = "email" value="${customer.email}"></td>
                    </tr>
                    <tr>
                        <td><label for = "name">Name: </label></td>
                        <td><input id = "name" type = "text" name = "name" value="${customer.name}"></td>
                    </tr>
                    <tr>
                        <td><label for = "password">Password: </label></td>
                        <td><input type = "password" id = "password" name ="password" value="${customer.password}"></td>
                    </tr>
                    <tr>
                        <td><label for="gender">Gender: </label></td>
                        <td>
                            <select for = "gender"  name = "gender" id = "gender" value="${customer.gender}">
                                <option value = "male">Male</option>
                                <option value = "female">Female</option>
                                <option value = "other">other</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for = "favColoro">FavColor: </label></td>
                        <td><input type="color" id="color-picker" name="color-picker" value="${customer.favColor}">
                        </td>
                    </tr>
                    <tr><td></td>
                        <td>
                            <a href="mainpage.jsp" class="button"> Main</a>
                            <input class="button" type="submit" value="Update">
                            <input type="hidden" name="updated" id="updated">
                        
                        
                        </td>
                    </tr>
                </table>
            </form>
            <%
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String gender = request.getParameter("gender");
                String favColor = request.getParameter("color-picker");
                customer = new Customer(name,email,password,gender,favColor);
                session.setAttribute("customer", customer);
            %>
            <br>
        </div>
    </body>
</html>
