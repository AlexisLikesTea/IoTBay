<%-- 
    Document   : CustomerDBtestPage
    Created on : 03/05/2023, 2:32:47 PM
    Author     : kyler
--%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*, IOTB.model.beans.*, IOTB.model.dao.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DataBase Test page </title>

    </head><!-- comment -->
    <body>
        <%
            // Establish a DB manager for the page and get going!
            DBManager manager = (DBManager) session.getAttribute("manager");
        %>

        <H1> Add customer example  </H1>
            <%     //Customer ID should be auto generated
                //Should add an if to check it the email exists anywhere using for(Customers cus : customers) method
                String firstName = "Johnson";
                String lastName = "YERTVA";
                String DOB = "1996-05-05";
                String email = "Johnny@ye.com.au";
                String phoneNum = "997-9973";
                String street = "13 Yert Street";
                String suburb = "Yertington";
                String state = "YER";
                String postCode = "3383";
                String userName = "IAmYERTVA";
                String passWord = "ABC123";

                manager.addCustomer(firstName, lastName, DOB, email, phoneNum, street, suburb, state, postCode, userName, passWord);
                
                out.println("Customer added " + firstName + " " + lastName + " " + userName);
                %>
        <h4> unique email example  </h4>
                <%
                ArrayList<Customer> emailCheck = manager.fetchCustomers();
                
                firstName = "Johnson2";
                lastName = "YERTVA2";
                DOB = "1996-05-05";
                email = "lmacritchie2@sphinn.com";
                out.println("testing "+ email + ": ");
                phoneNum = "997-9973";
                street = "13 Yert Street2";
                suburb = "Yertington";
                state = "YER";
                postCode = "3383";
                userName = "IAmYERTVA";
                passWord = "ABC123";
                
                boolean Mailcheck = false;
                for(Customer cust : emailCheck){
                    if(cust.getEmail().equals(email) ){
                        Mailcheck = true;
                        out.println("this email already exists my dude");
                    }
                }
                if(Mailcheck == false){
                     manager.addCustomer(firstName, lastName, DOB, email, phoneNum, street, suburb, state, postCode, userName, passWord);
                      out.println("Customer added " + firstName + " " + lastName + " " + userName);
                }
                //out.println("Customer added " + firstName + " " + lastName + " " + userName);
                
                %>
        
                <%
                firstName = "Johnson2";
                lastName = "YERTVA2";
                DOB = "1996-05-05";
                email = "Johnny@ye.com.au2";
                phoneNum = "997-9973";
                street = "13 Yert Street2";
                suburb = "Yertington";
                state = "YER";
                postCode = "3383";
                userName = "IAmYERTVA";
                passWord = "ABC123";

                manager.addCustomer(firstName, lastName, DOB, email, phoneNum, street, suburb, state, postCode, userName, passWord);

                //out.println("Customer added " + firstName + " " + lastName + " " + userName);

            %>
        <h1>CUSTOMER_T dump</h1>

        <%    ArrayList<Customer> customers = manager.fetchCustomers();
            // Output customer information in a table
            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Name</th><th>Email</th><th>Pass</th></tr>");
            for (int i = 1; i <= 10; i++) {
                out.println("<tr>");
                out.println("<td>" + customers.get(i).getCustomerId() + "</td>");
                out.println("<td>" + customers.get(i).getFirstName() + " " + customers.get(i).getLastName() + "</td>");
                out.println("<td>" + customers.get(i).getEmail() + "</td>");
                out.println("<td>" + customers.get(i).getPassword()+ "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

        %>

        <H1>manager.findCustomer("esemor0@naver.com","esemor0", "oQFPvYNDX");</H1>

        <%        // Execute the findCustomer method
            Customer customer = null;
            customer = manager.findCustomer("esemor0", "oQFPvYNDX");

            // Close the database connection
            if (customer == null) {
                out.println("Customer not found");
            } else {
                out.println("Customer found: " + customer.getFirstName() + " " + customer.getLastName());
            }
        %>


        <h1> update Test </h1>
        <%
            //in the application just use the Set functions to change individual fields 
            //then copy paste the update customer line below 
            customer = manager.findCustomer( "IAmYERTVA","ABC123");

            if (customer != null) {
                out.println(customer.getFirstName() + "will be altered");
                customer.setFirstName("Sheeeevaaaa");
                customer.setLastName("YERTSON");
                customer.setEmail("Shevason@ yeet.com");

                manager.updateCustomer(customer.getCustomerId(), customer.getFirstName(), customer.getLastName(), customer.getDOB(), customer.getEmail(), customer.getPhoneNum(), customer.getStreet(), customer.getSuburb(), customer.getPostCode(), customer.getUserName(), customer.getPassword());
                out.println("Name changed too " + customer.getFirstName());
            } else {
                out.println("customer does not exist");
            }


        %>


        <h1> deleteCustomer(customerId) test </h1>

        <%    //sample delete construct, probably add a field to test for email equality 
            customer = manager.findCustomer("Johnny@ye.com.au", "ABC123");
            if (customer == null) {
                out.println("no customer to delete");
            } else {
                manager.deleteCustomer(customer.getCustomerId());

                out.println("customer delted!");
            }


        %>

        <h1> All customer DB tests complete! </h1>



        <h1> staff </h1>

        <% ArrayList<Staff> staff = manager.fetchStaff();
            // Output customer information in a table
            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Name</th><th>Email</th><th>Pass</th></tr>");
            for (int i = 1; i <= 10; i++) {
                out.println("<tr>");
                out.println("<td>" + staff.get(i).getStaffID() + "</td>");
                out.println("<td>" + staff.get(i).getStaffFirstName() + " " + staff.get(i).getStaffLastName() + "</td>");
                out.println("<td>" + staff.get(i).getStaffEmail() + "</td>");
                out.println("<td>" + staff.get(i).getStaffPassword() + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

        %>
        <h1> find Staff </h1>

        <%                
            Staff testStaff = manager.findStaff("tbockin0@usnews.com", "P59H1lzI");

            if (testStaff == null) {
                out.println("no such staff my dude");
            } else {
                out.println("staff Found: " + testStaff.getStaffFirstName() + testStaff.getStaffLastName());
            }


        %>

        <h1> staff insert test <h1> 
         <%
              manager.addStaff("Johnney", "Johnson", "john@john.john", "staffboi", "aBAUDbaia");
                    
             
              Staff newBoi = manager.findStaff("john@john.john", "aBAUDbaia");
            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Name</th><th>Email</th><th>Pass</th></tr>");
                out.println("<tr>");
                out.println("<td>" + newBoi.getStaffID() + "</td>");
                out.println("<td>" + newBoi.getStaffFirstName() + " " + newBoi.getStaffLastName() + "</td>");
                out.println("<td>" + newBoi.getStaffEmail() + "</td>");
                out.println("<td>" + newBoi.getStaffPassword() + "</td>");
                out.println("</tr>");
            out.println("</table>");
            
            %>
            <h4>Testing find staff w/ username</h4>
            <%
            
            Staff newBoi2 = manager.findStaff("staffboi", "aBAUDbaia");
            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Name</th><th>Email</th><th>Pass</th></tr>");
                out.println("<tr>");
                out.println("<td>" + newBoi.getStaffID() + "</td>");
                out.println("<td>" + newBoi.getStaffFirstName() + " " + newBoi.getStaffLastName() + "</td>");
                out.println("<td>" + newBoi.getStaffEmail() + "</td>");
                out.println("<td>" + newBoi.getStaffPassword() + "</td>");
                out.println("</tr>");
            out.println("</table>");
         %>
         <h1>delete staff test </h1>
         
         <%
             manager.deleteStaff("296103000000000");
             
            Staff fSt = manager.findStaff("john@john.john", "aBAUDbaia");
            if (fSt == null) {
                out.println("no customer to delete");
            } else {
                manager.deleteStaff(fSt.getStaffID());

                out.println("customer delted!");
            }
             %>
             
             <h3> update staff test </h3>
             

    </body>
</html>