package IOTB.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import IOTB.model.beans.Customer;
import IOTB.model.beans.Staff;
import IOTB.model.dao.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kyler
 */
public class editCustomerValidate extends HttpServlet {

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
        
        //Get page Parameters//
            String email = null;
            String userName = null;
            String firstName = null;
            String lastName = null;
            String password = null;
            //customer only attribs
            String DOB = null;
            String phoneNum = null;
            String street = null;
            String suburb = null;
            String state = null;
            String postCode= null;
        
        try {
            Customer customer = (Customer) session.getAttribute("editCus");
            if(customer != null){
                email = request.getParameter("email");
                userName = request.getParameter("userName");
                password = request.getParameter("password");
                firstName = request.getParameter("firstName");
                lastName =  request.getParameter("lastName");
                DOB = request.getParameter("DOB");
                phoneNum = request.getParameter("phonenum");
                street = request.getParameter("street");
                suburb = request.getParameter("suburb");
                state = request.getParameter("state");
                postCode = request.getParameter("postCode");
                
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
                    session.setAttribute("editCus", customer); //refresh the customer bean
                    manager.updateCustomer(customer.getCustomerId(), customer.getFirstName(), customer.getLastName(), customer.getDOB(), customer.getEmail(), customer.getPhoneNum(), customer.getStreet(), customer.getSuburb(), customer.getPostCode(), customer.getUserName(), customer.getPassword());

                   // response.sendRedirect("edit.jsp");
                    request.getRequestDispatcher("CustomerManagerEdit.jsp").include(request, response);
                
            }
        }catch (SQLException ex){
                    System.out.println(ex.getMessage() == null ? "Staff or Customer does not exist" : "Successful login");

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
