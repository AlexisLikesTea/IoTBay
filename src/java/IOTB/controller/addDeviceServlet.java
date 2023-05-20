/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.controller;

import IOTB.model.beans.Customer;
import IOTB.model.beans.Device;
import IOTB.model.dao.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Random;

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
        Random r = new Random();
        switch (request.getParameter("submit")) {
            case "addDevice":
                try {
                    ArrayList<String> deviceIDList = new ArrayList<String>();
                    for(Device d : manager.fetchDevices()){
                        deviceIDList.add(d.getDeviceID());          //populate the list with all device id's
                    }
                    
                    String deviceID = r.nextInt(999999999)+""+r.nextInt(999999);
                    boolean matching = true;
                    while(matching){
                        deviceID = r.nextInt(999999999)+""+r.nextInt(999999); //generate deviceID up to 15 characters long
                        for(String s : deviceIDList){ //for all device id's in list populated above
                            if(deviceID.equals(s)){ // check if the generated ID matches the ID
                                matching = true;
                                break; // if it does match set matching to true again and break back to the while loop and regenerate an ID
                            }
                            matching = false; //if it doesnt match make matching false and check the next one, if it reachs
                        }                    //the end of the list then it will exit the for loop and matching will be false so it will exit the while
                    }
                    String name = (String) request.getParameter("name");
                    String description = (String) request.getParameter("description");
                    String brand = (String) request.getParameter("Brand");
                    String supplier = (String) request.getParameter("Supplier");
                    String specifications = (String) request.getParameter("Specifications");
                    String warranty = (String) request.getParameter("Warranty");
                    String stdPriceCheck = (String) request.getParameter("stdPrice");
                    String currentPriceCheck = (String) request.getParameter("currentPrice");
                    float stdPrice = 0;
                    float currentPrice = 0;
                    String type = (String) request.getParameter("Type");
                    String sohCheck = (String) request.getParameter("soh");
                    int soh = 0;
                    String imageUrl = (String) request.getParameter("url");
                    
                    Boolean ValidForm = true;
                    
                    if (!validator.validateFloat(stdPriceCheck)){
                        session.setAttribute("stdPriceErr", "Standard Price is invalid, Please enter a floating point number e.g. 10.00");
                        ValidForm = false;
                    }else{
                        stdPrice = Float.parseFloat(request.getParameter("stdPrice"));
                        session.setAttribute("stdPriceErr", "");
                    }
                    if (!validator.validateFloat(currentPriceCheck)){
                        session.setAttribute("currentPriceErr", "Current Price is invalid, Please enter a floating point number e.g. 10.00");
                        ValidForm = false;
                    } else{
                        currentPrice = Float.parseFloat(request.getParameter("currentPrice"));
                        session.setAttribute("currentPriceErr", "");
                    }
                    if (!validator.validateInteger(sohCheck)){ //still need to fix this as it doesnt work properly
                        session.setAttribute("sohErr", "Stock On Hand is invalid, Please enter an integer number e.g. 1,2,3... (not decimals)");
                        ValidForm = false;
                    } else{
                        soh = Integer.parseInt(request.getParameter("soh"));
                        session.setAttribute("sohErr", "");
                    }
                    if (name.isEmpty()){
                        session.setAttribute("nameErr", "Devices must have a name");
                        ValidForm = false;
                    }else{
                        stdPrice = Float.parseFloat(request.getParameter("stdPrice"));
                        session.setAttribute("nameErr", "");
                    }
                    if(ValidForm == true){
                        Device newDevice = new Device(
                                deviceID,
                                name,
                                description,
                                brand,
                                supplier,
                                specifications,
                                warranty,
                                stdPrice,
                                currentPrice,
                                type,
                                soh,
                                imageUrl);
                        manager.addDevice(newDevice);
                        request.getRequestDispatcher("deviceAdded.jsp").include(request, response);
                    } else {
                        request.getRequestDispatcher("addDevice.jsp").include(request, response);
                    }
                    validator.clear(session);
                } catch (SQLException e) {
                    System.out.print(e);
                }   break;
            case "Update":
                {
                    if(!request.getParameter("price").isEmpty()){
                    float newPrice = Float.parseFloat(request.getParameter("price"));
                    String deviceID = (String) request.getParameter("deviceId");
                    //need to add some validation for the price
                    try{
                        manager.updatePrice(deviceID,newPrice);
                        request.getRequestDispatcher("deviceUpdated.jsp").include(request, response);
                    } catch (SQLException e) {
                        System.out.print(e);
                    }}else{
                        request.getRequestDispatcher("devUpdateFailed.jsp").include(request, response); //push to another page to force them to jump back to catalouge
                    } break;
                }
            case "Delete":
                {
                    String deviceID = (String) request.getParameter("deviceId");
                    try{
                        manager.deleteDevice(deviceID);
                        request.getRequestDispatcher("deviceDeleted.jsp").include(request, response);
                    } catch (SQLException e) {
                        System.out.print(e);
                    }           break;
                }
            default:
                break;
        }    
    }
}
