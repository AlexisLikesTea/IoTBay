/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.controller;

import IOTB.model.dao.*;
import IOTB.model.beans.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Iterator;
import java.util.Random;
import java.time.LocalDate;
import java.sql.Timestamp;

public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("Starting doPost method");
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        if(manager == null) {
            // if manager is null, redirect to error page
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
            return;
        }

        String action = request.getParameter("action");
        String deviceId = request.getParameter("deviceId");
        String quantity = request.getParameter("quantity");
        
        System.out.println("Action: " + action);
        System.out.println("DeviceId: " + deviceId);
        System.out.println("Quantity: " + quantity);
        
        if (quantity == null || quantity.equals("") || quantity.equals(" ")) {
            quantity = "1";
        }

        if (action != null && action.equals("addToCart")) {
            
            System.out.println("Starting addToCart action");
            
            Device device = new Device();
            
            try {
                // Retrieve device and customer from the database
                device = manager.findDevice(deviceId);
                System.out.println("Device: " + device);
            } catch (SQLException ex) {
                Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
          
            Customer customer = (Customer) session.getAttribute("customer"); // null 
            
            if(customer == null){
                customer = (Customer) session.getAttribute("defaultMan");
            }
            
            //sessionattribute defaultcust
           
            int orderLineId;
                do {
                    orderLineId = new Random().nextInt(999999);
                } while (!manager.isOrderLineIdUnique(orderLineId));
            
            System.out.println("Order Line ID: " + orderLineId);
            
            OrderLine orderLine = new OrderLine();
            orderLine.setOrderLineID(Integer.toString(orderLineId));
            orderLine.setDeviceID(deviceId);
            orderLine.setOrderlineQuantity(Integer.parseInt(quantity));
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                
            orderLine.setOrderlineDateAdded(timestamp);
            
            ArrayList<String> cart = null;
            if (session.getAttribute("cart") != null) {
                cart = (ArrayList<String>) session.getAttribute("cart");
            }
//            ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
            if (cart != null) {
                System.out.println(cart);
            } else {
                System.out.println("Cart is null.");
            }
            
            if (cart == null) {
                cart = new ArrayList<>();
                session.setAttribute("cart", cart);
                
                int orderId;
                do {
                    orderId = new Random().nextInt(999999);
                } while (!manager.isOrderIdUnique(orderId));
                
                LocalDate currentdate = LocalDate.now();
                
                Order order = new Order("...", "...", currentdate, 2.6f, "...", false, "...", "...");
                
                order.setOrderID(Integer.toString(orderId));
                orderLine.setOrderID(Integer.toString(orderId));
                
                order.setCustomerID(customer.getCustomerId());
                order.setOrderDate(currentdate);
                order.setOrderTotalAmount(Integer.parseInt(quantity) * device.getDeviceCurrentPrice());
                order.setOrderStatus("In Process");
                order.setOrderComplete(false);
                
                order.setStaffID("17698200000000"); //needs to be replaced
                order.setPaymentID("12598216690911"); //needs to be replaced
               
                
                System.out.println("Order ID " + order.getOrderID());
                
                manager.addOrder(order);
                manager.addOrderLine(orderLine);
                
                session.setAttribute("orderId", Integer.toString(orderId));
                session.setAttribute("orderLineId", Integer.toString(orderLineId));
                
            } else {
                // Update order in the database
                String orderId = (String) session.getAttribute("orderId");
                if(orderId == null){
                    System.out.println("OrderId is not set in the session");
                    return;
                }
                Order order = manager.findOrder(orderId);
                if(order == null){
                    System.out.println("No order found for orderId: " + orderId);
                    session.removeAttribute("cart");
                    session.removeAttribute("orderId");
                    session.removeAttribute("orderLineId");
                    return;
                }
                order.setOrderTotalAmount(order.getOrderTotalAmount() + Integer.parseInt(quantity) * device.getDeviceCurrentPrice());
                manager.updateOrder(order);
                
                orderLine.setOrderID(order.getOrderID());

                // Add new OrderLine to the database
                manager.addOrderLine(orderLine);
            }
            
            cart.add(deviceId);
      
            response.sendRedirect("Catalogue.jsp");
        }

        if ("removeFromCart".equals(action)) {
            String orderId = (String) session.getAttribute("orderId");

            if (deviceId != null && orderId != null) {
                try {
                    // Find the specific order line using device ID, quantity, and order ID
                    OrderLine orderLine = manager.findOrderLine(deviceId, quantity, orderId);
                    if (orderLine != null) {
                        // Remove the specific order line from the database
                        manager.removeOrderLine(orderLine.getOrderLineID());

                        // Update the order total amount
                        Order order = manager.findOrder(orderId);
                        Device device = manager.findDevice(deviceId);
                        order.setOrderTotalAmount(order.getOrderTotalAmount() - device.getDeviceCurrentPrice() * Integer.parseInt(quantity));
                        manager.updateOrder(order);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            // Remove the device ID from the cart
            ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
            if (cart != null) {
                cart.remove(deviceId);
            }

            response.sendRedirect("Order.jsp");
        }

        
        if ("clearCart".equals(action)) {
            String orderId = (String) session.getAttribute("orderId");
            manager.clearCart(orderId);
            manager.removeOrder(orderId);
            manager.removeOrderLineByOrderId(orderId);
            session.removeAttribute("cart");
            session.removeAttribute("orderId");
            session.removeAttribute("orderLineId");
            response.sendRedirect("Order.jsp");
        }
        
        if ("saveCart".equals(action)) {
            // Reset order ID, orderLineId, and cart attributes
            session.removeAttribute("orderId");
            session.removeAttribute("orderLineId");
            session.removeAttribute("cart");
            response.sendRedirect("Order.jsp");
        }
        
        
        
    }
    
 
}

