/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author aliaghajafari
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
public class RegisterStaffController extends HttpServlet {

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
        
        Admin admin = (Admin) session.getAttribute("admin");
        
        //the logic is like edit customer. 
                String email = request.getParameter("email");
                String userName = request.getParameter("userName");
                String password = request.getParameter("password");
                String firstName = request.getParameter("firstName");
                String lastName =  request.getParameter("lastName");
                String position = request.getParameter("position");
               
                
                Boolean ValidForm = true;
        
        
        try {
            
            //manager.addStaff(firstName, lastName, email, position, userName, password);
               
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
                        // validate position
                        if (!validator.validatePosition(position)){
                            session.setAttribute("positionErr", "position must not be empty");
                            //request.getRequestDispatcher("edit.jsp").include(request, response);
                            ValidForm = false;
                        } else {
                            session.setAttribute("position", "position updated successfully, dont forget");
                        }
                        
                        
                        
                        if(ValidForm == true){
                            String placeholder = "Contact Details not Saved";
                            manager.addStaff(firstName, lastName, email, position, userName, password);
                            
//                            Customer customer = manager.findCustomer(userName, password);
//                            
//                            //Allows staff to make customers without logging them in. 
//                            if(admin == null){
//                                String logID = manager.addAccessLog(customer.getCustomerId());
//                                session.setAttribute("customer", customer); //Primary Session Attribs
//                                session.setAttribute("SessionLogId", logID); //Primary
//                            } else {
//                                session.setAttribute("editCus", customer); //Primary Session Attribs
//                            }
                           
                            request.getRequestDispatcher("StaffManager.jsp").include(request, response);
                        } else {
                             request.getRequestDispatcher("registerStaff.jsp").include(request, response);
                        }
                    
            }   catch (SQLException ex) {
            Logger.getLogger(RegisterStaffController.class.getName()).log(Level.SEVERE, null, ex);
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

