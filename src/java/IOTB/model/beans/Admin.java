/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.model.beans;

/**
 *
 * @author Ali
 */
public class Admin {
    private String AdminID;
    private String AdminEmail;
    private String AdminPassword;
    

    public Admin(String AdminID, String AdminEmail, String AdminPassword) {
        this.AdminID = AdminID;
        this.AdminEmail = AdminEmail;
        this.AdminPassword = AdminPassword;
        
    }

    public String getAdminID() {
        return AdminID;
    }
    
    public String getAdminEmail(){
        return AdminEmail;
    }
    
    
    public String getAdminPassword(){
        return AdminPassword;
    }
    public void  setAdminEmail(String email){
        this.AdminEmail = email;
    }
    public void  setAdminPassword(String password){
        this.AdminPassword = password;
    }

}
