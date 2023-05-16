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
            String phoneNumErr = (String) session.getAttribute("phoneNumErr");
            String streetErr = (String) session.getAttribute("streetErr");
            String suburbErr = (String) session.getAttribute("suburbErr");
            String stateErr = (String) session.getAttribute("stateErr");
            String postCodeErr = (String) session.getAttribute("postCodeErr");
            //Staff updated = request.getParameter("Updated");
        %>


        <div class="topbanner"></div>

        <!-- This is the top nav bar code-->
        <div class="topnav">
            <a href="index.jsp"> Home </a>
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
            <% }%> 
        </div>

        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
        <div class="contentcontainer">
            <br>

            <!-- Placeholder buttons -->
            <div id = "accessTabs">
                <form action = "AccessLogController" method = "post">
                    <input type = "submit" value = "Access Logs">
                </form>
                <span>   |   </span>
                <a> Payment Details  </a>
            </div>

            <form action="PaymentManager" method = "POST">  


                <!<!-- this whole thing will have to be wrapped in an IF -->
                <% if (staff == null && customer != null) {%>




                <h1 id="underlineandcenter"> Payment Details     </h1>

                <table>
                    <tr>
                        <td><label for = "state"> Name on card: </label></td>
                        <td><input type = "text" id = "cardName" name = "cardName" placeholder ="Your name on the card"  value = "${(customer.state != "" ? customer.state : null)}"><h8> <%=(stateErr != null ? stateErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "phonenum">Card Number: </label></td>
                        <td><input type = "long" id = "cardNum" name = "cardNum" placeholder ="Please add your cards number" value = "${(customer.phoneNum != "" ? customer.phoneNum : null)}"><h8> <%=(phoneNumErr != null ? phoneNumErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "CVC"> CVC: </label></td>
                        <td><input type = "text" id = "CVC" name = "CVC" placeholder ="Your cards CVV" value = "${(customer.suburb != "" ? customer.suburb : null)}"><h8> <%=(suburbErr != null ? suburbErr : "")%> </h8></td>
                    </tr>
                    <tr>
                        <td><label for = "Expiry"> Expiry Date: </label></td>
                        <td><input type = "date" id = "Expiry" name = "Expiry" placeholder ="Your cards Expiry Date" value = "${(customer.street != "" ? customer.street : null)}"><h8> <%=(streetErr != null ? streetErr : "")%> </h8></td>
                    </tr>
                    <tr><td></td>
                        <td>
                            <span>${requestScope.payment.paymentCardNumber}</span>
                            <input class="button" type="submit" value="Update">

                        </td>
                    </tr>


                </table>
                <span>${payment.paymentCardNumber}</span>

                <% }%> 
            </form>


            <br>
        </div>
        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
    </body>
</html>