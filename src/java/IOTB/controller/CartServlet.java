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

public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");

        String action = request.getParameter("action");
        String deviceId = request.getParameter("deviceId");

        if (action != null && action.equals("addToCart")) {
            ArrayList<String> cart = (ArrayList<String>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<String>();
            }
            cart.add(deviceId);
            session.setAttribute("cart", cart);
        }
        
        if ("removeFromCart".equals(action)) {
            if (deviceId != null) {
                try {
                    // Get the current cart from the session
                    ArrayList<Device> cart = (ArrayList<Device>) session.getAttribute("cart");

                    // Find and remove the device with the given ID
                    for (Iterator<Device> it = cart.iterator(); it.hasNext(); ) {
                        Device device = it.next();
                        if (deviceId.equals(device.getDeviceID())) {
                            it.remove();
                            break;
                        }
                    }

                    // Update the cart in the session
                    session.setAttribute("cart", cart);
                } catch (Exception e) {
                    // Handle any errors that might occur
                    e.printStackTrace();
                }
            }
        }
    }
 
}

