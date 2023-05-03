 package IOTB.controller;

 

   import java.io.IOException;

   import java.sql.Connection;

   import java.sql.SQLException;

   import java.util.logging.Level;

   import java.util.logging.Logger;

   import javax.servlet.ServletException;

   import javax.servlet.http.HttpServlet;

   import javax.servlet.http.HttpServletRequest;

   import javax.servlet.http.HttpServletResponse;

   import javax.servlet.http.HttpSession;

   import IOTB.model.dao.*;

 

  public class ConnServlet extends HttpServlet {

 

       private DBConnector db;

       private DBManager manager;

       private Connection conn;

        

       @Override //Create and instance of DBConnector for the deployment session

       public void init() {
               db = new DBConnector();
       }

      

       @Override //Add the DBConnector, DBManager, Connection instances to the session

       protected void doGet(HttpServletRequest request, HttpServletResponse response)

               throws ServletException, IOException {

           response.setContentType("text/html;charset=UTF-8");       

           HttpSession session = request.getSession();
           
           //Missing from the lab, any method that throws an exception must be caught.
           try {
                 conn = db.openConnection();
                 
           } catch (SQLException ex) {

                 Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

           }

           try {

               manager = new DBManager(conn);

           } catch (SQLException ex) {

               Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

           }

           //export the DB manager to the view-session (JSPs)

           session.setAttribute("manager", manager);           

       }   

        

       @Override //Destroy the servlet and release the resources of the application (terminate also the db connection)

        public void destroy() {

           try {

               db.closeConnection();

           } catch (SQLException ex) {

               Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

           }

       }

   }