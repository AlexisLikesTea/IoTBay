<%-- 
    Document   : activityLogs
    Created on : 08/05/2023, 10:51:31 AM
    Author     : kyler
--%>

<%@page import="IOTB.model.dao.DBManager"%>
<%@page import="java.util.ArrayList"%>
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
            
            //Turn this whole page into a serverlet 
            Customer customer = (Customer) session.getAttribute("customer");
            DBManager manager = (DBManager) session.getAttribute("manager");
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
            <table>
                    <td><input id = "addLog" type = "text" name = "addLog" value = "" ></td>
                
                    <td><input type="number" id="addYear" name="addYear" value =""></td>
                    <td><input type="number" id="addMonth" name="addMonth" value ="" ></td>
                    
                    <button type="submit">Submit</button>
                    
            </table>
            
            <h1> ${customer.customerId} </h1>
            <%
                
               
                //Call using LOGID for 1 specific log, Call using either staff and Cust for all of their accesslogs
                
                    String ID;
                    if(staff != null){
                        ID = staff.getStaffID();
                    } else {
                        
                        ID = customer.getCustomerId();
                    }
                     ArrayList<AccessLog> logSearch = manager.findAccessLogs(ID, request.getParameter("addYear"),request.getParameter("addMonth"));    
                    
              
                
                    //manager.updateAccessLog(ID);




                 // Output customer information in a table
                    out.println("<table border='1'>");
                    out.println("<tr><th>ID</th><th>ID's</th><th>Sign in </th><th>Sign off</th></tr>");
                    
                    for (AccessLog logs : logSearch) {
                        out.println("<tr>");
                        out.println("<td>" + logs.getLogID()+ "</td>");
                        out.println("<td>" +  logs.getCustomerID() + " " +  logs.getStaffID() + "</td>");
                        out.println("<td>" +  logs.getLogLogin() + "</td>");
                        out.println("<td>" +  logs.getLogLogout()+ "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
             
            %>         
            <br>
        </div>
        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
    </body>
</html>
