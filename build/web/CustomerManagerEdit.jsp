<%-- 
    Document   : CustomerManager
    Created on : 06/05/2023, 1:42:34 PM
    Author     : kyler
--%>

<%@page import="IOTB.model.dao.*"%>
<%@page import="IOTB.model.beans.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        
              <%   ///Page Variables
                    Customer customer = (Customer) session.getAttribute("editCustomer");
                     
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
               %> 
            

        <!-- This is the top nav bar code-->
        <div class="topbanner"></div>
        <div class="topnav">
            <a href="index.jsp"> Home </a>
            <a href="register.jsp"> Register </a>
            <a href="login.jsp"> Login </a>
            <% if (session.getAttribute("staff") != null) { %>
            <a class="active" href='CustomerManager.jsp'> Manage Customers</a>
            <a href ='Catalogue.jsp'> Manage Inventory </a>
            <a href =''> Manage AccessLogs</a>
            <% } %>
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null) { %>
            <a href = 'edit.jsp'> my account </a>
            <% } %> 
            <%if (session.getAttribute("customer") != null && session.getAttribute("staff") == null) { %>
            <a href ='Catalogue.jsp'>Catalogue</a>
            <% } %>

            <a  href="logout.jsp" >Logout</a>
        </div>
            
  <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
        <div class="contentcontainer">
            <br>

            
            <h1 id="underlineandcenter">Edit ${customer.firstName}</h1>
            <form action="" method = "POST">  
                <table>
                    <tr>
                        <td><label for = "email">Email:</label></td>
                        
                        <td><input type = "email" id = "email" name = "email" value="${(customer!=null ? customer.email : "")}"><h8> <%=(emailErr != null ? emailErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "userName">User Name: </label></td>
                        <td><input id = "userName" type = "text" name = "userName" value="${(customer!=null ? customer.userName : "")}"><h8> <%=(userNameErr != null ? userNameErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "firstName">First Name: </label></td>
                        <td><input id = "firstName" type = "text" name = "firstName" value="${(customer!=null ? customer.firstName : "")}"><h8> <%=(firstNameErr != null ? firstNameErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "lastName">Last Name: </label></td>
                        <td><input type = "text" id = "lastName" name ="lastName" value="${(customer!=null ? customer.lastName : "")}"><h8> <%=(lastNameErr != null ? lastNameErr : "")%> </h8></td>
                    </tr>
                    
                    <tr>
                        <td><label for = "password">Password: </label></td>
                        <td><input type = "password" id = "password" name ="password" value="${(customer!=null ? customer.password : "")}"><h8> <%=(passwordErr != null ? passwordErr : "")%> </h8></td>
                    </tr>
                    
                    <tr>
                        <td><label for="DOB">Date Of Birth </label></td>
                           <td><input type = "date"  onfocus="this.showPicker()" id = "DOB" name ="DOB" value="${(customer!=null ? customer.DOB : "")}"><h8> <%=(DOBErr != null ? DOBErr : "")%> </h8></td>
                    </tr>
                    
                    <tr><td></td>
                        <td>
                            <input class="button" type="submit" value="Update">
                            
                        </td>
                    </tr>
                </table>
                    
                    <!-- this whole thing will have to be wrapped in an IF -->
                        <h1 id="underlineandcenter"> Shipping Details </h1>
                        
                        <table>
                            <tr>
                                <td><label for = "phonenum">Contact Number: </label></td>
                                <td><input type = "text" id = "phonenum" name = "phonenum" placeholder ="You need to add your phone number" value = "${(customer.phoneNum != "" ? customer.phoneNum : null)}"><h8> <%=(phoneNumErr != null ? phoneNumErr : "")%> </h8></td>
                            </tr>
                            <tr>
                                <td><label for = "street"> Street Number and Name: </label></td>
                                <td><input type = "text" id = "street" name = "street" placeholder ="You need to add your street" value = "${(customer.street != "" ? customer.street : null)}"><h8> <%=(streetErr != null ? streetErr : "")%> </h8></td>
                            </tr>
                            <tr>
                                <td><label for = "suburb"> Suburb: </label></td>
                                <td><input type = "text" id = "suburb" name = "suburb" placeholder ="You need to add your suburb" value = "${(customer.suburb != "" ? customer.suburb : null)}"><h8> <%=(suburbErr != null ? suburbErr : "")%> </h8></td>
                            </tr>
                            <tr>
                                <td><label for = "state"> STATE: </label></td>
                                <td><input type = "text" id = "state" name = "state" placeholder ="You need to add your state"  value = "${(customer.state != "" ? customer.state : null)}"><h8> <%=(stateErr != null ? stateErr : "")%> </h8></td>
                            </tr>
                            <tr>
                                <td><label for = "postCode"> Post Code: </label></td>
                                <td><input type = "text" id = "postCode" name = "postCode" placeholder ="You need to add a post code"  value = "${(customer.postCode != "" ? customer.postCode : null)}"> <%=(postCodeErr != null ? postCodeErr : "")%> </td>
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
        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
                
             
            

       
    </body>
</html>
