/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Customer.Info;

/**
 *
 * @author Jack
 */
public class Customer {
    private String name;
    private String email;
    private String password;
    private String gender;
    private String favColor;
    
    //insert construtor

    public Customer(String name, String email, String password, String gender, String favColor) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.favColor = favColor;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getFavColor() {
        return favColor;
    }

    public void setFavColor(String favColor) {
        this.favColor = favColor;
    }
    
    
}
