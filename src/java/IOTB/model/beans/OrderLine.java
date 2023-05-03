/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.model.beans;
//Must include time stamp
import java.sql.Timestamp;


/**
 *
 * @author kyler
 */
public class OrderLine {
    private String orderID;
    private String deviceID;
    private Timestamp orderlineDateAdded;
    private int orderlineQuantity;

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getDeviceID() {
        return deviceID;
    }

    public void setDeviceID(String deviceID) {
        this.deviceID = deviceID;
    }

    public Timestamp getOrderlineDateAdded() {
        return orderlineDateAdded;
    }

    public void setOrderlineDateAdded(Timestamp orderlineDateAdded) {
        this.orderlineDateAdded = orderlineDateAdded;
    }

    public int getOrderlineQuantity() {
        return orderlineQuantity;
    }

    public void setOrderlineQuantity(int orderlineQuantity) {
        this.orderlineQuantity = orderlineQuantity;
    }
}
