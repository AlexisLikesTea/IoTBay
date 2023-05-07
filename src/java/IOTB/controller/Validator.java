package IOTB.controller;

   import java.io.Serializable;
   import java.util.regex.Matcher;
   import java.util.regex.Pattern;
    import javax.servlet.http.HttpSession;


   public class Validator implements Serializable{ 

 
   private final String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";      
   private final String userNamePattern = "[a-zA-Z0-9]{4,}";
   private final String namePattern = "[a-zA-Z]{2,}";       
   private final String passwordPattern = "[a-zA-Z0-9]{4,}"; 
   private final String phoneNumberPattern = "[0-9\\-]+";
   private final String streetPattern = "\\d+.*\\b\\p{Alpha}+";
   private final String statePattern = "[A-Za-z]{2,4}";
   private final String postCodePattern = "[0-9]{2,6}";
              
   public Validator(){    }       


   public boolean validate(String pattern, String input){       
      Pattern regEx = Pattern.compile(pattern);       
      Matcher match = regEx.matcher(input);       

      return match.matches(); 

   }       

 

   public boolean checkEmpty(String email, String password){       

      return  email.isEmpty() || password.isEmpty();   

   }

   
   public boolean validateEmail(String email){                       

      return validate(emailPattern,email);   

   }
   
   public boolean validateUserName(String userName){                       

      return validate(userNamePattern,userName);   

   }

       
   public boolean validateName(String name){

      return validate(namePattern,name); 

   }       
   

   public boolean validatePassword(String password){

      return validate(passwordPattern,password); 

   }  
   
   public boolean validatePhoneNumber(String phoneNumber){
       return validate(phoneNumberPattern, phoneNumber);
   }
   
   public boolean validateStreet(String street){
       return validate(streetPattern, street);
   }
   
   public boolean validateState(String state){
       return validate(statePattern, state);
   }
   
   public boolean validatePostCode(String postCode){
       return validate(postCodePattern, postCode);
   }
   
   //Add and reset your error messages here! 
   public void clear (HttpSession session){
        session.setAttribute("credentialErr", "");
        session.setAttribute("passErr", "");
        session.setAttribute("passwordErr", "");
        session.setAttribute("existErr", "");
        session.setAttribute("userNameErr", "");
        session.setAttribute("firstNameErr", "");
        session.setAttribute("lastNameErr", "");
        session.setAttribute("lNameErr", "");
        session.setAttribute("DOBErr", "");
        session.setAttribute("phoneNumErr", "");
        session.setAttribute("streetErr", "");
        session.setAttribute("suburbErr", "");
        session.setAttribute("phoneNumErr", "");
        session.setAttribute("postCodeErr", "");
        session.setAttribute("stateErr", "");
         session.setAttribute("emailErr", "");
   }
}