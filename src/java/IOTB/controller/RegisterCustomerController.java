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
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kyler
 */
public class RegisterCustomerController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        //Standard Controller / servlet construction
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        DBManager manager = (DBManager) session.getAttribute("manager"); 
        // _____________________________________________
        
        //Standard out//
        validator.clear(session);
        
        Staff staff = (Staff) session.getAttribute("staff");
        
        //the logic is like edit customer. 
            String email = null;
            String userName = null;
            String firstName = null;
            String lastName = null;
            String password = null;
            String DOB = null;
        
        try {
            
                email = request.getParameter("email");
                userName = request.getParameter("userName");
                password = request.getParameter("password");
                firstName = request.getParameter("firstName");
                lastName =  request.getParameter("lastName");
                DOB = request.getParameter("DOB");
                
                Boolean ValidForm = true;
        
               
                        if (!validator.validateEmail(email)){
                            session.setAttribute("emailErr", "Email is invalid");
                            ValidForm = false;
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else { 
                             session.setAttribute("emailErr", "Email updated successfully too: " + email);
                        }
                        
                        if (!validator.validateUserName(userName)){
                            session.setAttribute("userNameErr", "UserName is Invalid. Atleast 4 characters long, no spaces or special characters.");
                            ValidForm = false;
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                        } else {
                            session.setAttribute("userNameErr", "User Name updated successfully too: " + userName);
                        }
                        
                        if (!validator.validateName(firstName)){
                            session.setAttribute("firstNameErr", "first name is invalid must be atleast 2 characters long.");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                            ValidForm = false;
                        } else {
                            String nameCap = firstName.substring(0, 1).toUpperCase() + firstName.substring(1);
                            session.setAttribute("firstNameErr", "First name updated successfully too: " + nameCap);
                        }
                        
                        if (!validator.validateName(lastName)){
                            session.setAttribute("lastNameErr", "last name is invalid must be atleast 2 characters long.");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                            ValidForm = false;
                        } else {
                            String LnameCap = lastName.substring(0, 1).toUpperCase() + lastName.substring(1);
                            session.setAttribute("lastNameErr", "First name updated successfully too: " + LnameCap);
                        }
                        
                        if (!validator.validatePassword(password)){
                            session.setAttribute("passwordErr", "Password must be atleast 4 characters long, no special characters.");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                            ValidForm = false;
                        } else {
                            session.setAttribute("passwordErr", "Password updated successfully, dont forget");
                        }
                        
                        LocalDate DOByear = LocalDate.parse(DOB);
                        if(  DOByear.getYear() <=  LocalDate.now().getYear() && DOByear.getYear() > 1900){
                            session.setAttribute("DOBErr", "Your birthday has been updated.");
                        } else {
                            session.setAttribute("DOBErr", "Invalid birthday selection");
                            
                            ValidForm = false;
                        }
                        
                        if(ValidForm == true){
                            String placeholder = "Contact Details not Saved";
                            manager.addCustomer(firstName, lastName, DOB, email, "123456789" , "35 Example Street", "Suburb", "AAA", "0000", userName, password);
                            
                            Customer customer = manager.findCustomer(userName, password);
                            
                            //Allows staff to make customers without logging them in. 
                            if(staff == null){
                                String logID = manager.addAccessLog(customer.getCustomerId());
                                session.setAttribute("customer", customer); //Primary Session Attribs
                                session.setAttribute("SessionLogId", logID); //Primary
                            } else {
                                session.setAttribute("editCus", customer); //Primary Session Attribs
                            }
                           
                            request.getRequestDispatcher("welcome.jsp").include(request, response);
                            
                        } else {
                                
                             request.getRequestDispatcher("register.jsp").include(request, response);
                        }
                    
            }   catch (SQLException ex) {
            Logger.getLogger(RegisterCustomerController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
