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

import IOTB.model.beans.Staff;

import java.sql.SQLException;
/**
 *
 * @author georg
 */
public class StaffManagementTest {
    
     private DBManager manager;
    private DBConnector connector;
    
    public StaffManagementTest() throws SQLException {
        this.connector = new DBConnector();
        this.manager = new DBManager(connector.openConnection());
    }
    
    @Test //TC601
    public void createStaff() throws SQLException {
        manager.addStaff("Jane", "Smith", "jsmith@gmail.com", "Salesperson","jsmith", "password123");
        Staff staff = manager.findStaff("jsmith@gmail.com", "password123");
        assertNotNull(staff);
    }
    
}
