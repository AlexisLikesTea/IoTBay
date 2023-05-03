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

/**
 * Each BEAN has a DataBase manager function associated with it such that 
 * you can 
 * Find* -> returns a single bean
 * add* -> adds directly to db 
 * update* -> updates directly to DB
 * delete* -> deletes directly to DB
 * fetch* -> returns an ArrayList<Type> of beans 
 * 
 * 
 * @author kyler
 */
public class DBManager {
    
    private final Statement st;
    
    private final Connection connect;
    
    public DBManager (Connection conn) throws SQLException{
        st = conn.createStatement();
        
        connect = conn;
    }
    
    //Customer Section 
    
    public Customer findCustomer(String email, String password) throws SQLException{
        
        String fetch = "select * from ISDUSER where EMAIL = '" + email + "'and PASSWORD ='" + password + "'";
        //results go into a result set
        ResultSet rs = st.executeQuery(fetch);
        //Result set rs is a singly linked list with next. 
        while(rs.next()){
            String customerEmail = rs.getString(5);  //Do not change the relative position of Customer columns
            String customerPassWord = rs.getString(12); //if you do we need to change this
            
            if(customerEmail.equals(email) && customerPassWord.equals(password)){
                //this return statement returns a cusomter BEAN that exactly matches the Database
                String customerId = rs.getString(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String DOB  = rs.getString(4);
                String phoneNum = rs.getString(6);
                String street = rs.getString(7);
                String suburb = rs.getString(8);
                String state = rs.getString(9);
                String postCode = rs.getString(10);
                String userName = rs.getString(11);
                    //There it is in the form to get this output you would need a jsp 
                    //like: Customer SessionC = DBManager.findCustomer(thisGuy,thisPass);
                return new Customer(customerId, firstName, lastName, DOB,customerEmail,phoneNum, street, suburb, state, postCode, userName, customerPassWord);
            }
        }
        return null;
    }
    
    public void addCustomer(String firstName, String lastName, String DOB,String customerEmail,String phoneNum, String street, String suburb, String postCode, String userName, String customerPassWord) throws SQLException{
        //Have to find a unique Customer id first 
        ResultSet maxIdRs = st.executeQuery("SELECT MAX(CUSTOMERID) FROM CUSTOMER_T");
        
        //Always finds the highest customer ID and + 1's it. Not the most incredible solution but yeah.
        int freshID;
        if(maxIdRs.next()){
            String maxIDStr = maxIdRs.getString(1);
            int maxID = Integer.parseInt(maxIDStr);
            freshID = maxID + 1;
            
            System.out.println("Max ID was " + maxIDStr + " new ID is " + freshID + "inserting new customer into cusotomer T");
            
        } else {
            freshID = 1;
            
            System.out.println( "First ID int Customer_T " + freshID + " inserting new customer into cusotomer T");
        }
        
        String customerID = Integer.toString(freshID);
        
        //Secure databse entry statement 
        String query = "INSERT INTO ISDUSER.CUSTOMER_T VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connect.prepareStatement(query)) {
            statement.setString(1, customerID);
            statement.setString(2, firstName);
            statement.setString(3, lastName);
            statement.setString(4, DOB);
            statement.setString(5, customerEmail);
            statement.setString(6, phoneNum);
            statement.setString(7, street);
            statement.setString(8, suburb);
            statement.setString(9, postCode);
            statement.setString(10, userName);
            statement.setString(11, customerPassWord);
            statement.executeUpdate();
        }
        
        //This is a backup statement if the fancy one goes titsup.
        //st.executeUpdate("INSERT INTO ISDUSER.CUSTOMER_T " + "VALUES ('" + customerID + "', '" + firstName + "', '"  + lastName + "', '" + DOB + "', '"  + customerEmail + "', '" + phoneNum + "', '" + street + "', '" + suburb + "', '"  + postCode+ "', '" + userName + "', '"  + customerPassWord + "')" );
      
    }
    
    //update, Requires a valid customerId, You can update any field you like but you cannot update customer ID!. 
    //requires you to pass in ALL private fields in the accompanying bean!
    public void updateCustomer(String customerId, String firstName, String lastName, String DOB,String customerEmail,String phoneNum, String street, String suburb, String postCode, String userName, String customerPassWord) throws SQLException{
        
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
    
    public void deleteCustomer(String customerId) throws SQLException{
        String query = "DELETE FROM ISDUSER.CUSTOMER_T WHERE CUSTOMERID=?";
        try(PreparedStatement statement = connect.prepareStatement(query)){
            statement.setString(1,customerId);
            statement.executeUpdate();
        }     
        //backup statement 
        //st.executeUpdate("'DELETE FROM ISDUSER.CUSTOMER_T WHERE CUSTOMERID='" + customerId + "'");
    }
    
    //returns ALl the customers in the arraylist as beans, youll have to filter through them locally 
    public ArrayList<Customer> fetchCustomers() throws SQLException {
        String fetch = "SELECT * FROM ISDUSER.CUSTOMER_T";
        ResultSet rs = st.executeQuery(fetch);
        
        ArrayList<Customer> allCustomers = new ArrayList<>();
        
        while(rs.next()){
                String customerId = rs.getString(1);
                String firstName = rs.getString(2);
                String lastName= rs.getString(3);
                String DOB= rs.getString(4);
                String email= rs.getString(5);
                String phoneNum= rs.getString(6);
                String street= rs.getString(7);
                String suburb= rs.getString(8);
                String state= rs.getString(9);
                String postCode= rs.getString(10);
                String userName= rs.getString(11);
                String password= rs.getString(12);
                
                allCustomers.add(new Customer(customerId, firstName, lastName, DOB, email, phoneNum, street, suburb, state, postCode, userName, password));
                
        } if(!allCustomers.isEmpty()){
            return allCustomers;
        } else {
            return null;
        }
    }
    
    //Staff Section 
    
    
    //Devices Section 
    
    //Order Section 
    
    //OrderLine Section 
    
    //Payment Section
    
}
