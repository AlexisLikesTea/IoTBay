/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.model.dao;

import java.sql.*;
import java.util.ArrayList;
import IOTB.model.beans.*;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

/**
 *
 * @author Alexis
 */
public class PaymentDAO {

    public class PaymentDAOt {

        private List<Payment> paymentList;

        public PaymentDAOt() {
            // Initialize an empty list to store payments
            paymentList = new ArrayList<>();
        }

        public void createPayment(String paymentID, String paymentCardName, long paymentCardNumber, long paymentCardCVC,  LocalDate paymentCardExpiryDate) {
            // Create a new Payment object
            Payment payment = new Payment(paymentID, paymentCardName, paymentCardNumber, paymentCardCVC, paymentCardExpiryDate);

            // Add the payment to the list
            paymentList.add(payment);
        }

        public Payment getPaymentByID(String paymentID) {
            // Find the payment with the given ID
            for (Payment payment : paymentList) {
                if (payment.getPaymentID().equals(paymentID)) {
                    return payment;
                }
            }

            // Payment not found
            return null;
        }

    }
}
