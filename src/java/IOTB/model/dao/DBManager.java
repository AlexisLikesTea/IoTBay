/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.model.dao;

import java.sql.*;
import java.util.ArrayList;
import IOTB.model.beans.Customer;
import IOTB.model.beans.Staff;
import IOTB.model.beans.Device;
import IOTB.model.beans.Payment;
import IOTB.model.beans.Order;
import IOTB.model.beans.OrderLine;
import java.math.BigInteger;

/**
 * Each BEAN has a DataBase manager function associated with it such that you
 * can 
 * Find* -> returns a single bean 
 * add* -> adds directly to db 
 * update* -> updates directly to DB 
 * delete* -> deletes directly to DB 
 * fetch* -> returns an ArrayList<Type> of beans
 *
 * @author kyler
 */
public class DBManager {

    private final Statement st;

    private final Connection connect;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();

        connect = conn;
    }

    //Customer Section 

    public Customer findCustomer(String EmailOrUsername, String password) throws SQLException {

        String query1= "select * from CUSTOMER_T where CUSTOMEREMAIL= ? and  CUSTOMERPASSWORD= ?";
        String query2= "select * from CUSTOMER_T where CUSTOMERUSERNAME=? and CUSTOMERPASSWORD= ?";
       
        try (PreparedStatement statement = connect.prepareStatement(query1)) {
            statement.setString(1, EmailOrUsername);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String customerEmail = rs.getString(5);  //Do not change the relative position of Customer columns
                String customerPassWord = rs.getString(12); //if you do we need to change this
                if (customerEmail.equals(EmailOrUsername) && customerPassWord.equals(password)) {
                    return new Customer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
                }
            }
        } try (PreparedStatement statement = connect.prepareStatement(query2)) {
            statement.setString(1, EmailOrUsername);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String customerUsername = rs.getString(11); 
                String customerPassWord = rs.getString(12); 
                if (customerUsername.equals(EmailOrUsername) && customerPassWord.equals(password)) {
                    return new Customer(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12));
                }
            }
        }
        return null;
    }

    public void addCustomer(String firstName, String lastName, String DOB, String email, String phoneNum, String street, String suburb, String state, String postCode, String userName, String passWord) throws SQLException {
        //Have to find a unique Customer id first 
        ResultSet maxIdRs = st.executeQuery("SELECT MAX(CUSTOMERID) FROM CUSTOMER_T");
        //Always finds the highest customer ID and + 1's it. Not the most incredible solution but yeah.
        int IDLEN = 15;
        BigInteger freshID;
        String customerID = null;

        if (maxIdRs.next()) {
            freshID = new BigInteger(maxIdRs.getString(1));
            freshID = freshID.add(BigInteger.ONE);
            customerID = freshID.toString();
        } else {
            customerID = "1";
        }
        // Add a bunch of zeros
        while (customerID.length() < IDLEN) {
            customerID += "0";
        }
        //Secure databse entry statement 
        String query = "INSERT INTO ISDUSER.CUSTOMER_T VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connect.prepareStatement(query)) {
            statement.setString(1, customerID);
            statement.setString(2, firstName);
            statement.setString(3, lastName);
            statement.setString(4, DOB);
            statement.setString(5, email);
            statement.setString(6, phoneNum);
            statement.setString(7, street);
            statement.setString(8, suburb);
            statement.setString(9, state);
            statement.setString(10, postCode);
            statement.setString(11, userName);
            statement.setString(12, passWord);
            statement.executeUpdate();
        }
    }

    //update, Requires a valid customerId, You can update any field you like but you cannot update customer ID!. 
    //requires you to pass in ALL private fields in the accompanying bean!
    public void updateCustomer(String customerId, String firstName, String lastName, String DOB, String customerEmail, String phoneNum, String street, String suburb, String postCode, String userName, String customerPassWord) throws SQLException {

        String query = "UPDATE ISDUSER.CUSTOMER_T SET CUSTOMERFIRSTNAME=?, CUSTOMERLASTNAME=?, CUSTOMERDOB=?, CUSTOMEREMAIL=?, CUSTOMERPHONENUMBER=?, CUSTOMERSTREET=?, CUSTOMERSUBURB=?, CUSTOMERPOSTCODE=?, CUSTOMERUSERNAME=?, CUSTOMERPASSWORD=? WHERE CUSTOMERID = ?";
        try (PreparedStatement statement = connect.prepareStatement(query)) {
            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, DOB);
            statement.setString(4, customerEmail);
            statement.setString(5, phoneNum);
            statement.setString(6, street);
            statement.setString(7, suburb);
            statement.setString(8, postCode);
            statement.setString(9, userName);
            statement.setString(10, customerPassWord);
            statement.setString(11, customerId);
            statement.executeUpdate();
        }
        //backup statement bellow 
        //st.executeUpdate("UPDATE ISDUSER.CUSTOMER_T SET CUSTOMERFIRSTNAME='"+ firstName+"',CUSTOMERLASTNAME='"+lastName+"',CUSTOMERDOB='"+DOB+ "',CUSTOMEREMAIL='"+customerEmail+"',CUSTOMERPHONENUMBER='"+phoneNum+"',CUSTOMERSTREET='"+street+"',CUSTOMERSUBURB='"+suburb+"',CUSTOMERPOSTCODE='"+postCode+"',CUSTOMERUSERNAME='"+userName+"',CUSTOMERPASSWORD='"+customerPassWord+"' WHERE CUSTOMERID = '"+customerId+ "'");
    }

    public void deleteCustomer(String customerId) throws SQLException {
        String query = "DELETE FROM ISDUSER.CUSTOMER_T WHERE CUSTOMERID=?";
        try (PreparedStatement statement = connect.prepareStatement(query)) {
            statement.setString(1, customerId);
            statement.executeUpdate();
        }
        //backup statement 
        //st.executeUpdate("'DELETE FROM ISDUSER.CUSTOMER_T WHERE CUSTOMERID='" + customerId + "'");
    }

    //returns ALl the customers in the arraylist as beans, youll have to filter through them locally 
    public ArrayList<Customer> fetchCustomers() throws SQLException {
        String qurey = "SELECT * FROM ISDUSER.CUSTOMER_T";
        ResultSet rs = st.executeQuery(qurey);

        ArrayList<Customer> allCustomers = new ArrayList<>();

        while (rs.next()) {
            String customerId = rs.getString(1);
            String firstName = rs.getString(2);
            String lastName = rs.getString(3);
            String DOB = rs.getString(4);
            String email = rs.getString(5);
            String phoneNum = rs.getString(6);
            String street = rs.getString(7);
            String suburb = rs.getString(8);
            String state = rs.getString(9);
            String postCode = rs.getString(10);
            String userName = rs.getString(11);
            String password = rs.getString(12);

            allCustomers.add(new Customer(customerId, firstName, lastName, DOB, email, phoneNum, street, suburb, state, postCode, userName, password));

        }
        if (!allCustomers.isEmpty()) {
            return allCustomers;
        } else {
            return null;
        }
    }

    //Staff Section 
    public Staff findStaff(String EmailOrUsername, String password) throws SQLException {
        String query1 = "SELECT * FROM ISDUSER.STAFF_T WHERE STAFFEMAIL =? and STAFFPASSWORD =?";
        String query2 = "SELECT * FROM ISDUSER.STAFF_T WHERE STAFFUSERNAME =? and STAFFPASSWORD =?";
        try (PreparedStatement statement = connect.prepareStatement(query1)) {
            statement.setString(1, EmailOrUsername);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                //where4 and 6 refer to email and password in staff_t
                if (rs.getString(4).equals(EmailOrUsername) && rs.getString(6).equals(password)) { 
                    return new Staff(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                }
            }
        }
        try (PreparedStatement statement = connect.prepareStatement(query2)) {
            statement.setString(1, EmailOrUsername);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                //where5 and 6 refer to username and password in staff_t
                if (rs.getString(5).equals(EmailOrUsername) && rs.getString(6).equals(password)) { 
                    return new Staff(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                }
            }
        }
        return null;
    }
    
    public void addStaff(String staffFirstName, String staffLastName, String staffEmail, String staffUserName, String staffPassword) throws SQLException{
        
        ResultSet maxIdRs = st.executeQuery("SELECT MAX(STAFFID) FROM STAFF_T");
        int IDLEN = 15;
        BigInteger freshID;
        String staffID = null;

        if (maxIdRs.next()) {
            freshID = new BigInteger(maxIdRs.getString(1));
            freshID = freshID.add(BigInteger.ONE);
            staffID = freshID.toString();
        } else {
            staffID = "1";
        }
        while (staffID.length() < IDLEN) {
            staffID += "0";
        }
        
        String qurey = "INSERT INTO ISDUSER.STAFF_T VALUES (?,?,?,?,?,?)";
        try(PreparedStatement statement = connect.prepareStatement(qurey)){
            statement.setString(1, staffID);
            statement.setString(2, staffFirstName);
            statement.setString(3, staffLastName);
            statement.setString(4, staffEmail);
            statement.setString(5, staffUserName);
            statement.setString(6, staffPassword);
            statement.executeUpdate();
        }
    }

    public void updateStaff(String staffID, String staffFirstName, String staffLastName, String staffEmail, String staffUserName, String staffPassword ) throws SQLException {
        
        String qurey = "UPDATE ISDUSER.STAFF_T SET STAFFFIRSTNAME=?, STAFFLASTNAME=?, STAFFEMAIL=?, STAFFUSERNAME=?, STAFFPASSWORD=? WHERE STAFFID =?";
        
        try(PreparedStatement statement = connect.prepareStatement(qurey)){
            statement.setString(1, staffFirstName);
            statement.setString(2, staffLastName);
            statement.setString(3, staffEmail);
            statement.setString(4, staffUserName);
            statement.setString(5, staffPassword);
            statement.setString(6, staffID);
            statement.executeUpdate();
        }
    }
       
    public void deleteStaff(String staffID) throws SQLException{
        String qurey = "DELETE FROM ISDUSER.STAFF_T WHERE STAFFID=?";
        try(PreparedStatement statement = connect.prepareStatement(qurey)){
            statement.setString(1, staffID);
            statement.executeUpdate();
        }
    }
    
    public ArrayList<Staff> fetchStaff() throws SQLException {
        String query = "SELECT * FROM ISDUSER.STAFF_T";
        ResultSet rs = st.executeQuery(query);

        ArrayList<Staff> allStaff = new ArrayList<>();

        while (rs.next()) {
            String staffId = rs.getString(1);
            String staffFirstName = rs.getString(2);
            String staffLastName = rs.getString(3);
            String staffEmail = rs.getString(4);
            String staffUserName = rs.getString(5);
            String staffPassword = rs.getString(6);

            allStaff.add(new Staff(staffId, staffFirstName, staffLastName, staffEmail, staffUserName, staffPassword));
        }
        return allStaff;
    }
    //Devices Section 

    //Order Section 
    //OrderLine Section 
    //Payment Section
}
