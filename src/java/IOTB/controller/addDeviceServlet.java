/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.controller;

import IOTB.model.dao.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jack
 */
public class addDeviceServlet extends HttpServlet {

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
    
        try {
            
            String name = (String) session.getAttribute("name");
            String description = (String) session.getAttribute("description");
            float i = (float) 1.00;
            float b = (float) 1.00;
            
//            manager.addDevice("9999999999999",name,description,"1","1","1","1",i,b,"1",1,"1");
            request.getRequestDispatcher("Catalouge.jsp").include(request, response);
        } catch (Exception e) {
            Logger.getLogger(DeleteCustomerServlet.class.getName()).log(Level.SEVERE, null, e);
        }
}
}
