/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.controller;

import IOTB.model.beans.*;
import IOTB.model.dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kyler
 */
public class editAccount extends HttpServlet {


     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Standard Controller / servlet construction
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        DBManager manager = (DBManager) session.getAttribute("manager"); 
        // _____________________________________________
        
                //Standard out//
//        validator.clear(session);
        

        
        try {
            Customer customer = (Customer) session.getAttribute("customer");
            Staff staff = (Staff) session.getAttribute("staff");
            Admin admin = (Admin) session.getAttribute("admin");

   
            
            if(customer != null){
               String email = request.getParameter("email");
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                String firstName = request.getParameter("firstName");
                String lastName =  request.getParameter("lastName");
                String DOB = request.getParameter("DOB");
                String phoneNum = request.getParameter("phonenum");
                String street = request.getParameter("street");
                String suburb = request.getParameter("suburb");
                String state = request.getParameter("state");
                String postCode = request.getParameter("postCode");
                
                //Logical Tests 
                
                    //Email test
                    if(!customer.getEmail().equals(email)){
                       //validate and allow
                        if (!validator.validateEmail(email)){
                            session.setAttribute("emailErr", "Email is invalid");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else { 
                             customer.setEmail(email);
                             session.setAttribute("emailErr", "Email updated successfully too: " + email);
                        }
                    }
                    //UserName 
                    if(!customer.getUserName().equals(userName)){
                        if (!validator.validateUserName(userName)){
                            session.setAttribute("userNameErr", "UserName is Invalid. Atleast 4 characters long, no spaces or special characters.");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else {
                            customer.setUserName(userName);
                            session.setAttribute("userNameErr", "User Name updated successfully too: " + userName);
                        }
                    }
                    //firstname 

                    if(!customer.getFirstName().equals(firstName)){
                        if (!validator.validateName(firstName)){
                            session.setAttribute("firstNameErr", "first name is invalid must be atleast 2 characters long.");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else {
                            String nameCap = firstName.substring(0, 1).toUpperCase() + firstName.substring(1);
                            customer.setFirstName(nameCap);
                            session.setAttribute("firstNameErr", "First name updated successfully too: " + nameCap);
                        }
                    }
                    
                    //lastName
                    if(!customer.getLastName().equals(lastName)){
                        if (!validator.validateName(lastName)){
                            session.setAttribute("lastNameErr", "last name is invalid must be atleast 2 characters long.");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else {
                            String nameCap = lastName.substring(0, 1).toUpperCase() + lastName.substring(1);
                            customer.setLastName(nameCap);
                            session.setAttribute("lastNameErr", "First name updated successfully too: " + nameCap);
                        }
                    }
                    //passWord 
                    if(!customer.getPassword().equals(password)){
                        if (!validator.validatePassword(password)){
                            session.setAttribute("passwordErr", "Password must be atleast 4 characters long, no special characters.");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else {
                            customer.setPassword(password);
                            session.setAttribute("passwordErr", "Password updated successfully, dont forget");
                        }
                    }
                    
                    LocalDate DOByear = LocalDate.parse(DOB);
                    if(!customer.getDOB().equals(DOB)){
                        if(  DOByear.getYear() <=  LocalDate.now().getYear() && DOByear.getYear() > 1900){
                            customer.setDOB(DOB);
                            session.setAttribute("DOBErr", "Your birthday has been updated.");
                        } else {
                            session.setAttribute("DOBErr", "Invalid birthday selection");
                        }
                        
                    }
                    
                    if(!customer.getPhoneNum().equals(phoneNum)){
                        if (!validator.validatePhoneNumber(phoneNum)){
                            session.setAttribute("phoneNumErr", "Invalid phone number, can include spaces or hyphones only");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else {
                            customer.setPhoneNum(phoneNum);
                            session.setAttribute("phoneNumErr", "Phonenumber has been updated.");
                        }
                    }
                    
                    if(!customer.getStreet().equals(street)){
                        if(!validator.validateStreet(street)){
                            session.setAttribute("streetErr", "Street must start with your street number, then name and type.");
                        } else {
                            customer.setStreet(street);
                            session.setAttribute("streetErr", "New steet address: " + street);
                        }
                    }
                    
                    if(!customer.getSuburb().equals(suburb)){
                        if(!validator.validateName(suburb)){
                            session.setAttribute("suburbErr", "Invalid Suburb");
                        } else {
                            customer.setSuburb(suburb);
                            session.setAttribute("suburbErr", "New suburb: " + suburb);
                        }
                    }
                    
                    if(!customer.getState().equals(state)){
                        if(!validator.validateState(state)){
                            session.setAttribute("stateErr", "Invalid State, must be 2 to 4 characters long");
                        } else {
                            customer.setState(state.toUpperCase());
                            session.setAttribute("stateErr", "New state: " + state.toUpperCase());
                        }
                    }
                    
                    if(!customer.getPostCode().equals(postCode)){
                        if(!validator.validatePostCode(postCode)){
                            session.setAttribute("postCodeErr", "Invalid PostCode must be 2-6 numbers long");
                        } else {
                            customer.setPostCode(postCode);
                            session.setAttribute("postCodeErr", "Postcode updated to: "+ postCode);

                        }
                    }
                    
                    session.setAttribute("customer", customer); //refresh the customer bean
                    manager.updateCustomer(customer.getCustomerId(), customer.getFirstName(), customer.getLastName(), customer.getDOB(), customer.getEmail(), customer.getPhoneNum(), customer.getStreet(), customer.getSuburb(), customer.getPostCode(), customer.getUserName(), customer.getPassword());

                   // response.sendRedirect("edit.jsp");
                    request.getRequestDispatcher("edit.jsp").include(request, response);
                
            } else if (staff != null){
                String email = request.getParameter("email");
                String userName = request.getParameter("userName");
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String password = request.getParameter("password");
                String position = request.getParameter("position");
                
                
                    if(!staff.getStaffEmail().equals(email)){
                       //validate and allow
                        if (!validator.validateEmail(email)){
                            session.setAttribute("emailErr", "Email is invalid");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else { 
                             staff.setStaffEmail(email);
                             session.setAttribute("emailErr", "Email updated successfully too: " + email);
                        }
                    }
                    //UserName 
                    if(!staff.getStaffUsername().equals(userName)){
                        if (!validator.validateUserName(userName)){
                            session.setAttribute("userNameErr", "UserName is Invalid. Atleast 4 characters long, no spaces or special characters.");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else {
                            staff.setStaffUsername(userName);
                            session.setAttribute("userNameErr", "User Name updated successfully too: " + userName);
                        }
                    }
                    //firstname 

                    if(!staff.getStaffFirstName().equals(firstName)){
                        if (!validator.validateName(firstName)){
                            session.setAttribute("firstNameErr", "first name is invalid must be atleast 2 characters long.");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else {
                            String nameCap = firstName.substring(0, 1).toUpperCase() + firstName.substring(1);
                            staff.setStaffFirstName(nameCap);
                            session.setAttribute("firstNameErr", "First name updated successfully too: " + nameCap);
                        }
                    }
                    
                    //lastName
                    if(!staff.getStaffLastName().equals(lastName)){
                        if (!validator.validateName(lastName)){
                            session.setAttribute("lastNameErr", "last name is invalid must be atleast 2 characters long.");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else {
                            String nameCap = lastName.substring(0, 1).toUpperCase() + lastName.substring(1);
                            staff.setStaffLastName(nameCap);
                            session.setAttribute("lastNameErr", "First name updated successfully too: " + nameCap);
                        }
                    }
                    //passWord 
                    if(!staff.getStaffPassword().equals(password)){
                        if (!validator.validatePassword(password)){
                            session.setAttribute("passwordErr", "Password must be atleast 4 characters long, no special characters.");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else {
                            staff.setStaffPassword(password);
                            session.setAttribute("passwordErr", "Password updated successfully, dont forget");
                        }
                    }
                    
                    // position 
                    if(!staff.getStaffPosition().equals(position)){
                       if (!validator.validatePosition(position)){
                          // session.setAttribute("lastNameErr", "Position is empty.");
                           // request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else {
                            String posCap = position.substring(0, 1).toUpperCase() + position.substring(1);
                            staff.setStaffPosition(posCap);
                            //session.setAttribute("lastNameErr", "Position updated too!: " + posCap);
                       }
                   }
                    session.setAttribute("staff", staff);
                    manager.updateStaff(staff.getStaffID(), staff.getStaffFirstName(), staff.getStaffLastName(), staff.getStaffEmail(), staff.getStaffPosition(), staff.getStaffUsername(), staff.getStaffPassword());
                    request.getRequestDispatcher("edit.jsp").include(request, response);
                    
            }else if(admin != null){
                String email = request.getParameter("Ademail");
                String password = request.getParameter("Adpassword");
                
                if(!admin.getAdminEmail().equals(email)){
                       //validate and allow
                        if (!validator.validateEmail(email)){
                            session.setAttribute("emailErr", "Email is invalid");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else { 
                             admin.setAdminEmail(email);
                             session.setAttribute("emailErr", "Email updated successfully too: " + email);
                        }
                }
                if(!admin.getAdminPassword().equals(password)){
                        if (!validator.validatePassword(password)){
                            session.setAttribute("passwordErr", "Password must be atleast 4 characters long, no special characters.");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else {
                            admin.setAdminPassword(password);
                            session.setAttribute("passwordErr", "Password updated successfully, dont forget");
                        }
                 }
                session.setAttribute("admin", admin);
                manager.updateAdmin(admin.getAdminID(), admin.getAdminEmail(), admin.getAdminPassword());
                request.getRequestDispatcher("edit.jsp").include(request, response);
                
            }
             validator.clear(session);

            }
            catch (SQLException ex){
                    System.out.println(ex.getMessage() == null ? "Staff or Customer does not exist" : "UPdate error with SQL query ");

            } 
       
    }

   
}
