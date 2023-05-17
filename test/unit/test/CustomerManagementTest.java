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

import IOTB.model.beans.Customer;

import java.sql.SQLException;
/**
 *
 * @author georg
 */
public class CustomerManagementTest {
    private DBManager manager;
    private DBConnector connector;
    
    public CustomerManagementTest() throws SQLException {
        this.connector = new DBConnector();
        this.manager = new DBManager(connector.openConnection());
    }
    
    
    @Test //TC501
    public void resetPassword() throws SQLException{
        manager.updateCustomer("498000000000000", "Rubia", "Brasier","2019-06-10","rbrasierk@hud.gov","447-599-0199","90 Dayton Park", "Oltintopkan", "","rbrasierk","@Password123");
        Customer customer = manager.findCustomer("rbrasierk@hud.gov", "@Password123");
        assertNotNull(customer);
    }
    
}
