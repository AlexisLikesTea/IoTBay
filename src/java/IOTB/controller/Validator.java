package IOTB.controller;

   import java.io.Serializable;
   import java.util.regex.Matcher;
   import java.util.regex.Pattern;
    import javax.servlet.http.HttpSession;


   public class Validator implements Serializable{ 

 
   private final String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";      
   private final String namePattern = "([A-Z][a-z]+[\\s])+[A-Z][a-z]*";       
   private final String passwordPattern = "[a-z0-9]{4,}";       
              
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

       
   public boolean validateName(String name){

      return validate(namePattern,name); 

   }       
   

   public boolean validatePassword(String password){

      return validate(passwordPattern,password); 

   }          
   
   //These will come in handy for creating a new customer. Use the same attribute names
   public void clear (HttpSession session){
        session.setAttribute("emailErr", "Enter a valid email");
        session.setAttribute("passErr", "Enter a valid password");
        session.setAttribute("existErr", "");
        session.setAttribute("userNameErr", "Enter UserName");
        session.setAttribute("fNameErr", "Enter First Name");
        session.setAttribute("lNameErr", "Enter Last Name");
        session.setAttribute("DOBErr", "Enter a DOB in format YYYY-MM-DD");
        session.setAttribute("phoneNumErr", "Enter a phone number");
        session.setAttribute("streetErr", "Enter a Street address");
        session.setAttribute("suburbErr", "Enter a Suburb");
        session.setAttribute("phoneNumErr", "Enter a phone number");
        session.setAttribute("postCodeErr", "Enter a postCode");
   }
}