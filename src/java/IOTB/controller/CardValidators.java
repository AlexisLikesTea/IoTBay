/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IOTB.controller;

import javax.servlet.RequestDispatcher;
import java.time.LocalDate;

/**
 *
 * @author Alexis
 */
public class CardValidators {

    public boolean cvcValidator(String cvcInput) {
        if (cvcInput == null || cvcInput.length() != 3 || cvcInput.matches("\\d+")) {
            return false;
        }
        return true;
    }

    public boolean cardNumValidator(String cardNum) {
        if (cardNum.length() < 15 || !cardNum.matches("\\d+")) {
            return false;
        }
        return true;
    }
    
    public boolean cardNameValidator(String cardName) {
        if (cardName.isEmpty()) {
            return false;
        }
        return true;
    }
    
    public boolean cardDateValidator(LocalDate cardDate) {
        LocalDate currentDate = LocalDate.now();
        if(cardDate.isBefore(currentDate)){
            return false;
        }
        return true;
                 
       
       
    }
}
