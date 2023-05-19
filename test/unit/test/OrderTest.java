/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package unit.test;

import org.junit.Test;

import static org.junit.Assert.*;

import IOTB.model.dao.DBManager;

import IOTB.model.dao.DBConnector;

import IOTB.model.beans.Order;

import IOTB.model.beans.Device;

import IOTB.model.beans.OrderLine;

import java.sql.SQLException;


/**
 *
 * @author georg
 */
public class OrderTest {
    
    private DBManager manager;
    private DBConnector connector;
    
    public OrderTest() throws SQLException {
        this.connector = new DBConnector();
        this.manager = new DBManager(connector.openConnection());
    }
    
    
    @Test //TC301
    public void clearCart() throws SQLException{
        Order order = manager.findOrder("624057979125065");
        manager.clearCart("624057979125065");
        assertNull(manager.findOrder("624057979125065"));
    }
    
    @Test //TC302
    public void checkSOHUpdate() throws SQLException{
        manager.updateQuantity("921000000000000", 100);
        OrderLine orderline = new OrderLine();
        orderline.setOrderLineID("000000000000000");
        orderline.setDeviceID("921000000000000");
        orderline.setOrderID("678630402606338");
        orderline.setOrderlineQuantity(10);
        Device device = manager.findDevice("921000000000000");
        assertEquals(90, device.getDeviceSOH());
    }
    
}
