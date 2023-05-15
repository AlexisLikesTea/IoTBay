/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.model.beans;

/**
 *
 * @author kyler
 */
public class Staff {
    private String staffID;
    private String staffFirstName;
    private String staffLastName;
    private String staffEmail;
    private String staffPosition;
    private String staffUsername;
    private String staffPassword;

    public Staff(String staffID, String staffFirstName, String staffLastName, String staffEmail,String staffPosition, String staffUsername, String staffPassword) {
        this.staffID = staffID;
        this.staffFirstName = staffFirstName;
        this.staffLastName = staffLastName;
        this.staffEmail = staffEmail;
        this.staffPosition = staffPosition;
        this.staffUsername = staffUsername;
        this.staffPassword = staffPassword;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getStaffFirstName() {
        return staffFirstName;
    }

    public void setStaffFirstName(String staffFirstName) {
        this.staffFirstName = staffFirstName;
    }

    public String getStaffLastName() {
        return staffLastName;
    }

    public void setStaffLastName(String staffLastName) {
        this.staffLastName = staffLastName;
    }

    public String getStaffEmail() {
        return staffEmail;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public String getStaffUsername() {
        return staffUsername;
    }

    public void setStaffUsername(String staffUsername) {
        this.staffUsername = staffUsername;
    }
    

    public String getStaffPassword() {
        return staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }
    public String getStaffPosition() {
        return staffPosition;
    }

    public void setStaffPosition(String staffPosition) {
        this.staffPosition = staffPosition;
    }
}
