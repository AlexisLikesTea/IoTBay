<%-- 
    Document   : StaffManager.jsp
    Created on : 14/05/2023, 11:19:35 AM
    Author     : aliaghajafari
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

        <!-- This is the top nav bar code-->
        <div class="topbanner"></div>
        <div class="topnav">
            <a href="mainpage.jsp"> Home </a>
            <% if (session.getAttribute("staff") != null) { %>
            <a href='CustomerManager.jsp'> Manage Customers</a>
            <a href ='Catalogue.jsp'> Manage Inventory </a>
            <% } %>
            
            <% if (session.getAttribute("admin") != null) { %>
            <a class = "active" href='StaffManager.jsp'> Manage Staff Member</a>
            <a href='CustomerManager.jsp'> Manage Customer</a>
            <a href ='Catalogue.jsp'> Manage Inventory</a>
               
            <% } %>
            
            <% if (session.getAttribute("staff") != null || session.getAttribute("customer") != null || session.getAttribute("admin") != null) { %>
            <a href = 'edit.jsp'> my account </a>
            <% } %> 
            <%if (session.getAttribute("customer") != null && session.getAttribute("staff") == null && session.getAttribute("admin") == null) { %>
            <a href ='Catalogue.jsp'>Catalogue</a>
            <% } %>

            <a  href="logout.jsp" >Logout</a>
        </div>
            
 
                
               <%   ///Page Variables
                    DBManager manager = (DBManager) session.getAttribute("manager");
                    ArrayList<Staff> staffs = manager.searchStaff(request.getParameter("staffSearch"));
                    
                    Staff EditStaff = (Staff) session.getAttribute("editStaff");
                           
                    String userNameErr = (String) session.getAttribute("userNameErr");
                    String emailErr = (String) session.getAttribute("emailErr");
                    String firstNameErr = (String) session.getAttribute("firstNameErr");
                    String lastNameErr = (String) session.getAttribute("lastNameErr");
                    String passwordErr = (String) session.getAttribute("passwordErr");
                    
                   String deleteErr = (String) session.getAttribute("deleteErr");
               %> 

              <div style = "display:flex">
                 

           <div class ="contentcontainer" >
              
                <br>
                <h1 id="underlineandcenter">Staff List</h1>
                
                <a id = "accessTabs" href = "registerStaff.jsp"> Register New Staff <a/>
                <h1 id="underlineandcenter"> <%= (deleteErr != null ? deleteErr : "") %> </h1>
                <form  id="underlineandcenter" method = "post">
                    <input id="staffSearch"  type="text" name="staffSearch" placeholder="Search Staff By First Name Last Name or Email">                
                </form>
                <br>
                  
                    <table border='1'>
                    <tr><th>ID</th><th>Name</th><th>Email</th><th>Action</th></tr>
                    
                     <%for(Staff staff: staffs) { %>
                        <td><%= staff.getStaffID() %></td>
                        <td><%= staff.getStaffFirstName() %> <%=staff.getStaffLastName()%></td>
                         <td><%= staff.getStaffEmail() %></td>
                        <!-- Add more columns for other attributes -->
                        <td>
                           <form action="editCustomer" method="post">
                              <input type="hidden" name="staffId" id = "staffId" value="<%=staff.getStaffID()%>">
                              <input type="submit" value="Edit">
                             
                           </form>
                              <br>
                               <form action = "DeleteCustomerServlet" method = "post">
                                  <input type="hidden" name="DELstaffId" id = "DELstaffId" value="<%=staff.getStaffID()%>">
                                  <input type ="submit" value ="Delete">
                              </form>
                        </td>
                     </tr>
                    <%}%>
             
                
            </div>
         
                </div>
        </div>  
    </body>
</html>
