/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.controller;

import IOTB.model.beans.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alexis
 */
public class PaymentManager extends HttpServlet {

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
            out.println("<title>Servlet PaymentMan2ager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<a href=\"PaymentDetails.jsp\">Details</a>");
            Payment payment = (Payment) request.getAttribute("payment");
            if (payment != null) {
                out.println("<p>Payment Card Number: " + payment.getPaymentCardNumber() + "</p>");
            }
            out.println("<h1>Servlet PaymentManassger at " + request.getContextPath() + "</h1>");
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
        String paymentID = request.getParameter("paymentID");
        String paymentCardName = request.getParameter("cardName");
        long paymentCardNumber = Long.parseLong(request.getParameter("cardNum"));
        long paymentCardCVC = Long.parseLong(request.getParameter("CVC"));
        LocalDate paymentCardExpiryDate = LocalDate.parse(request.getParameter("Expiry"));
        Payment payment = new Payment(paymentID, paymentCardName, paymentCardNumber, paymentCardCVC, paymentCardExpiryDate);
        request.setAttribute("payment", payment);
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
        String paymentID = request.getParameter("paymentID");
        String paymentCardName = request.getParameter("cardName");
        long paymentCardNumber = Long.parseLong(request.getParameter("cardNum"));
        long paymentCardCVC = Long.parseLong(request.getParameter("CVC"));
        LocalDate paymentCardExpiryDate = LocalDate.parse(request.getParameter("Expiry"));
        Payment payment = new Payment(paymentID, paymentCardName, paymentCardNumber, paymentCardCVC, paymentCardExpiryDate);
        request.setAttribute("payment", payment);
        processRequest(request, response);

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
