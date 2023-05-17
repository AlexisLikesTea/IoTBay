package unit.test;

 

import org.junit.Test;

import static org.junit.Assert.*;

import IOTB.model.dao.DBManager;

import IOTB.model.dao.DBConnector;

import IOTB.model.beans.Customer;

import IOTB.model.beans.Staff;

import java.sql.SQLException;



public class LoginTest {
    
    private DBManager manager;
    private DBConnector connector;
    
    public LoginTest() throws SQLException {
        this.connector = new DBConnector();
        this.manager = new DBManager(connector.openConnection());
    }
    
    @Test // TC101
    public void correctCustomerLogin() throws SQLException{ 
        Customer customer = manager.findCustomer("rbrasierk", "Kk374Z3lPBT");
        String customerID = customer.getCustomerId();
        assertEquals("498000000000000", customerID);
    }
    
    @Test // TC102
    public void incorrectCustomerLogin() throws SQLException{
        Customer customer = manager.findCustomer("rbrasierk", "password");
        assertNull(customer);
    }
    
    @Test // TC103
    public void correctStaffLogin() throws SQLException{
        Staff staff = manager.findStaff("lchassonh@washingtonpost.com", "4luQxunjfS");
        String staffID = staff.getStaffID();
        assertEquals("734209000000000", staffID);
    }
    
    @Test // TC104
    public void incorrectStaffLogin() throws SQLException{
        Staff staff = manager.findStaff("lchassonh@washingtonpost.com", "password");
        assertNull(staff);
    }
    
}
