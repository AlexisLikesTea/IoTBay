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

        <div class="topbanner"></div>

        <!-- This is the top nav bar code-->
        <div class="topnav">
            <a href="index.jsp"> Home </a>
            <% if (session.getAttribute("staff") != null) { %>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a  href ='Catalogue.jsp'> Manage Inventory </a>
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
            <h1 id = "underlineandcenter">Access Logs</h1>

            <form action="AccessLogController" method = "post">
                                    
                    <div id = "accessTabs">
                        <span>  |   </span>
                        <a href="edit.jsp"> Return </a>
                        <span>  |   </span>
                    </div>
                
                <table>

                    <td><input type="number" id="addYear" name="addYear" value ="" placeholder = "Search By sign in Year"></td>
                    <td><input type="number" id="addMonth" name="addMonth" value =""placeholder = "Search By Sign in Month"></td>
                    <td> <button type="submit">Submit</button></td>

                    
                </table>
            </form>


            <%
                //Call using LOGID for 1 specific log, Call using either staff and Cust for all of their accesslogs
                ArrayList<AccessLog> logSearch = (ArrayList<AccessLog>) session.getAttribute("AccessLogList");

                // Output customer information in a table
                out.println("<table border='1'>");
                out.println("<tr><th>ID</th><th>ID's</th><th>Sign in </th><th>Sign off</th></tr>");

                for (AccessLog logs : logSearch) {
                    out.println("<tr>");
                    out.println("<td>" + logs.getLogID() + "</td>");
                    out.println("<td>" + (session.getAttribute("customer") != null ? logs.getCustomerID() : logs.getStaffID()) + "</td>");
                    out.println("<td>" + logs.getLogLogin() + "</td>");
                    out.println("<td>" + logs.getLogLogout() + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");

            %>         
            <br>
            </form>
        </div>
        <!--This page and all others need to be updated to include all the new fields in the customer BEAN -->
    </body>
</html>
