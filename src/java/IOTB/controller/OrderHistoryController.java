/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.controller;

/**
 *
 * @author anishsharma
 */
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import IOTB.model.beans.*;
import IOTB.model.dao.DBManager;


// Ensure this path matches the one in your JSP form action
public class OrderHistoryController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Customer customer = (Customer) session.getAttribute("customer");
        String customerId = customer.getCustomerId();
        
        String action = request.getParameter("action");

        if (action.equals("orderHistory")) {
            response.sendRedirect("OrderHistory.jsp");
        }
        
        
    }
}
