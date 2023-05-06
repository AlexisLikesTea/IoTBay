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
            //Staff updated = request.getParameter("Updated");
        %>

      
        <div class="topbanner"></div>

        <!-- This is the top nav bar code-->
        <div class="topnav">
            <a href="index.jsp"> Home </a>
            <a href="register.jsp"> Register </a>
            <a href="login.jsp"> Login </a>
            <% if (session.getAttribute("staff") != null) { %>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a  href ='Catalogue.jsp'> Manage Inventory </a>
            <a href =''> Manage AccessLogs</a>
            <% } %>
            <%if (session.getAttribute("staff") == null) { %>
            <a  href ='Catalogue.jsp'>Catalogue</a>
            <% } %>
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null) { %>
            <a class="active" href = 'edit.jsp'> my account </a>
            <a  href="logout.jsp"  >Logout</a>
            <% } %> 
        </div>

        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
        <div class="contentcontainer">
            <br>

            
            <h1 id="underlineandcenter">Edit your current details</h1>
            <form action="editAccount" method = "POST">  
                <table>
                    <tr>
                        <td><label for = "email">Email:</label></td>
                        <td><input type = "email" id = "email" name = "email" value="${(customer!=null ? customer.email : staff.staffEmail)}"></td>
                    </tr>
                    <tr>
                        <td><label for = "userName">Name: </label></td>
                        <td><input id = "userName" type = "text" name = "userName" value="${(customer!=null ? customer.userName : staff.staffUsername)}"></td>
                    </tr>
                    <tr>
                        <td><label for = "name">Name: </label></td>
                        <td><input id = "name" type = "text" name = "name" value="${(customer!=null ? customer.firstName : staff.staffFirstName)}"></td>
                    </tr>
                    <tr>
                        <td><label for = "password">Password: </label></td>
                        <td><input type = "password" id = "password" name ="password" value="${(customer!=null ? customer.lastName : staff.staffLastName)}"></td>
                    </tr>
                    
                    <% if(staff == null){ %>
                    <tr>
                        <td><label for="DOB">Date Of Birth </label></td>
                           <td><input type = "date"  onfocus="this.showPicker()" id = "DOB" name ="DOB" value="${(customer!=null ? customer.DOB : "")}"></td>
                    </tr>
                    <% } else { %>
                     <tr>
                        <td><label for="ID"> Your staff ID </label></td>
                        <td><h3>${(staff!=null ? staff.staffID : "")}</h3></td>
                    </tr>
                    <% } %> 
                    
                    <tr><td></td>
                        <td>
                            <input class="button" type="submit" value="Update">
                            
                        </td>
                    </tr>
                </table>
                    
                    <!<!-- this whole thing will have to be wrapped in an IF -->
                        <% if(staff == null && customer != null){ %>
                        <h1 id="underlineandcenter"> Shipping Details </h1>
                        
                        <table>
                            <tr>
                                <td><label for = "phonenum">Contact Number: </label></td>
                                <td><input type = "text" id = "phonenum" name = "phonenum" placeholder ="You need to add your phone number" value = "${(customer.phoneNum != "" ? customer.phoneNum : null)}"></td>
                            </tr>
                            <tr>
                                <td><label for = "street"> Street Number and Name: </label></td>
                                <td><input type = "text" id = "street" name = "street" placeholder ="You need to add your street" value = "${(customer.street != "" ? customer.street : null)}"></td>
                            </tr>
                            <tr>
                                <td><label for = "suburb"> Suburb: </label></td>
                                <td><input type = "text" id = "suburb" name = "suburb" placeholder ="You need to add your suburb" value = "${(customer.suburb != "" ? customer.suburb : null)}"></td>
                            </tr>
                            <tr>
                                <td><label for = "state"> STATE: </label></td>
                                <td><input type = "text" id = "state" name = "state" placeholder ="You need to add your state"  value = "${(customer.state != "" ? customer.state : null)}"></td>
                            </tr>
                            <tr>
                                <td><label for = "postCode"> Post Code: </label></td>
                                <td><input type = "text" id = "postCode" name = "postCode" placeholder ="You need to add a post code"  value = "${(customer.postCode != "" ? customer.postCode : null)}"></td>
                            </tr>
                            <tr><td></td>
                                <td>
                                    <input class="button" type="submit" value="Update">

                                </td>
                            </tr>
                            
                            
                        </table>
                        
                        
                        <% } %> 
            </form>
                        
                        
            <br>
        </div>
        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
    </body>
</html>
