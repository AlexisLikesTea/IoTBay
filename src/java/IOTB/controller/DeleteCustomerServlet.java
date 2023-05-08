/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.controller;

import IOTB.model.beans.AccessLog;
import IOTB.model.beans.Customer;
import IOTB.model.dao.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Set;
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
public class DeleteCustomerServlet extends HttpServlet {

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
           
            String ID = (String) request.getParameter("DELcustId");
            
            if(ID != null){
                 session.setAttribute("DELcust", "DELcustId");
                 session.setAttribute("deleteErr", ID + " was removed from the data base. ");
            }
           
            //logic to remove their access logs first. 
            ArrayList<AccessLog> Logs = (ArrayList<AccessLog>) manager.findAccessLogs(ID, null, null);
            
            for(AccessLog log : Logs){
                manager.deleteAccessLog(log.getLogID());
            }
            
            String delete = (String) session.getAttribute("DELcust");
            manager.deleteCustomer((String) request.getParameter("DELcustId"));
            request.getRequestDispatcher("CustomerManager.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
