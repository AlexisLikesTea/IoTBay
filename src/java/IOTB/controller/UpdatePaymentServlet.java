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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alexis
 */
public class UpdatePaymentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdatePaymentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePaymentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        CardValidators cardvalid = new CardValidators();
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Customer customer = (Customer) session.getAttribute("customer");
        
        int paymentCardCVC = 0;
        long paymentCardNumber = 0;
      
        String paymentID = request.getParameter("paymentID");
        String paymentCardName = request.getParameter("cardName");
        
           boolean isValid = true;
            //Validate cVC
        try {
            paymentCardCVC = Integer.parseInt(request.getParameter("cvc"));
            if (!(cardvalid.cvcValidator(String.valueOf(paymentCardCVC)))) {
                request.setAttribute("cvvError", "Invalid CVV. Please enter a 3-digit CVV.");
                isValid = false;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("cvvError", "Invalid CVC. CVC cannot be empty.");
            isValid = false;
        }
        
        //Num validation
         try {
            paymentCardNumber = Long.parseLong(request.getParameter("cardNum"));;
            if (!(cardvalid.cardNumValidator(paymentCardNumber))) {
                request.setAttribute("cardNumError", "Invalid Card Number. Must be 16 numbers in length or more.");
                isValid = false;;
            }
        } catch (NumberFormatException e) {
            request.setAttribute("cardNumError", "Invalid card number. Card Number cannot be empty.");
            isValid = false;
        }
         
         if (!(cardvalid.cardNameValidator(paymentCardName))) {
            request.setAttribute("cNameError", "Invalid Name. Name cannot be empty");
            isValid = false;
        }
         
          if (!isValid) {
            RequestDispatcher rd = request.getRequestDispatcher("/UpdatePayment.jsp");
            rd.forward(request, response);
            return;
        }

        //LocalDate paymentCardExpiryDate = request.getParameter("expiryDate"));
        String customerID = customer.getCustomerId();
        manager.updatePayment(paymentID, paymentCardName, paymentCardNumber, paymentCardCVC, customerID);
        response.sendRedirect("UpdatePayment.jsp");
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
