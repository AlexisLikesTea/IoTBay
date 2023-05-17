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

import IOTB.model.beans.Device;

import java.sql.SQLException;


/**
 *
 * @author georg
 */
public class CatalogueTest {
    
    private DBManager manager;
    private DBConnector connector;
    
    public CatalogueTest() throws SQLException {
        this.connector = new DBConnector();
        this.manager = new DBManager(connector.openConnection());
    }
    
    @Test //TC201
    public void deviceExists() throws SQLException{
        Device device = manager.findDevice("921000000000000");
        assertNotNull(device);
    }
    
    @Test //TC202
    public void deleteDevice() throws SQLException{
        manager.deleteDevice("921000000000000");
        assertNull(manager.findDevice("921000000000000"));
    }    
    
}
