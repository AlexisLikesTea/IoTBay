/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import IOTB.model.beans.*;
import IOTB.model.dao.*;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kyler
 */
public class LoginServlet extends HttpServlet {


   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Standard Controller / servlet construction
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        DBManager manager = (DBManager) session.getAttribute("manager"); 
        // _____________________________________________
        
        //Get page Parameters//
        String emailUser = request.getParameter("emailuser");
        String password = request.getParameter("password");
        
        session.setAttribute("customer", null);
        session.setAttribute("staff", null);
        //_____________________________________________//
        
        //Standard out//
        validator.clear(session);
        //Page logic 
        
            try{
                Customer customer = manager.findCustomer(emailUser, password);
                Staff staff = manager.findStaff(emailUser, password);
                if(customer != null){
                    session.setAttribute("customer", customer);
                    request.getRequestDispatcher("mainpage.jsp").include(request, response);
                } else if (staff != null){
                    session.setAttribute("staff", staff);
                    //if session.getAttribute("staffLogin") != null. Show some special buttons for them.
                    request.getRequestDispatcher("mainpage.jsp").include(request, response);
                } else {
                    session.setAttribute("existErr", "Credentials are incorrect or the account does not exist");
                    request.getRequestDispatcher("login.jsp").include(request, response);
                }
            } catch (SQLException ex){
                System.out.println(ex.getMessage() == null ? "Staff or Customer does not exist" : "Successful login");
                
            } 
        }
    }


