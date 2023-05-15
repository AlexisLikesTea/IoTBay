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
import java.util.ArrayList;
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
public class AccessLogController extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
       //Standard Controller / servlet construction
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        DBManager manager = (DBManager) session.getAttribute("manager"); 
        // _____________________________________________

        

        
        try {   
            Customer customer = (Customer) session.getAttribute("customer");
            Staff staff = (Staff) session.getAttribute("staff");
            String ID;
            if (staff != null) {
                ID = staff.getStaffID();
            } else {
                ID = customer.getCustomerId();
            }
            ArrayList<AccessLog> logSearch = manager.findAccessLogs(ID, request.getParameter("addYear"),request.getParameter("addMonth"));
            session.setAttribute("AccessLogList", logSearch);
            request.getRequestDispatcher("activityLogs.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AccessLogController.class.getName()).log(Level.SEVERE, null, ex);
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
