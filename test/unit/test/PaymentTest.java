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

import java.sql.SQLException;

/**
 *
 * @author georg
 */
public class PaymentTest {
    
    private DBManager manager;
    private DBConnector connector;
    
    public PaymentTest() throws SQLException {
        this.connector = new DBConnector();
        this.manager = new DBManager(connector.openConnection());
    }
    
    
    @Test //TC401
    public void deletePayment() throws SQLException{
        assertEquals(false, manager.deletePayment("286000000000000"));        
    }
    
}
