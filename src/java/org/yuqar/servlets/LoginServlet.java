package org.yuqar.servlets;


import java.io.IOException;
import java.net.Inet4Address;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.RandomStringUtils;
import org.mypackage.yuqar.beans.Messenger;
import org.mypackage.yuqar.hibernate.Logon;
import org.mypackage.yuqar.hibernate.YuQarHelper;

/**
 *
 * @author Devcon
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

   public static int logonID=1;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response,String jspName)
            throws ServletException, IOException {
        ServletContext sc = this.getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(jspName);
        rd.include(request, response);
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       
        try {
            connectJavaDB(request, response,request.getParameter("index"));
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
     
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        try {
            String register = request.getParameter("register");
          String forgot= request.getParameter("forgotPassword");
       
            if(register.equalsIgnoreCase(""))
            {
            connectJavaDB(request, response,forgot);
            }
            else
            {
                connectJavaDB(request, response,register);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch(ServletException n)
                {
                     Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, n);
        } catch (IOException n) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, n);
        }
                
    }
 protected void connectJavaDB(HttpServletRequest request, HttpServletResponse response,String decide) throws SQLException, ServletException, IOException
 {  
      String usernameRequest =request.getParameter("username");
      String passwordRequest =request.getParameter("password");
      String passwordRequest2 =request.getParameter("verifyPassword");
      String emailRequest =request.getParameter("email");
      
      ////////set up a cookie for this user/////////
      Cookie userCookie = new Cookie("userCookie",usernameRequest);
      userCookie.setMaxAge(60*10);
      response.addCookie(userCookie);
      ///////end of cookie///////////
      //Getting current date
       DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
       Date date = new Date();
     
       String currentDate =dateFormat.format(date);
       
       //getting IP Address
       String ip;
      
       try {
           ip=Inet4Address.getLocalHost().getHostAddress();
           String[] var ={usernameRequest,passwordRequest,emailRequest,currentDate+"",ip};
         ////////////////////////////*/////////////////////////////////////////////////////////////////////////////////////////
///////////////////        /* Register as new user     //////////////////////////////////////////////////////////////
///////////////////         *///////////////////////////////////////////////////////////////////////////////////////////
         if(decide.equals("register"))
         {
             //check if user exist in the database
             YuQarHelper helper = new YuQarHelper();
            List<Logon> logon=helper.selectDataFromDB(usernameRequest);
            
            // insert user details into database
            if(logon.isEmpty())
            {
               YuQarHelper helper2=new YuQarHelper();
               helper2.insertIntoLogonTable(var);
            
               YuQarHelper helper3 = new YuQarHelper();
               helper3.insertIntoLogTable(var,"Yes","Registered","Register Page","Gauteng");
               
               response.setHeader("registrationSuccess", "Registration Complete, Welcome to YuQar Technologies"); 
                 response.setHeader("passwordChanged", "");
               processRequest(request, response,"/response.jsp");
            }
            else//username exists in the database
            {
                String temp=logon.get(0).getId().getUsername();
                 //notify user with a popup screen
                response.setHeader("RegistrationError","User with the same username( "+temp+" ) exists");
                processRequest(request, response,"/newUser.jsp");
            }
           
           
         }
/////////////////////////////*/////////////////////////////////////////////////////////////////////////////////////////
///////////////////        /* Login into the system     //////////////////////////////////////////////////////////////
///////////////////         *///////////////////////////////////////////////////////////////////////////////////////////
         else if(decide.equals("index"))
         {                         
             YuQarHelper helper = new YuQarHelper();//open session
             List<Logon> logonDetails=helper.selectDataFromDB(usernameRequest);
             if(logonDetails.isEmpty())
             {
                 //invalid login
                 response.setHeader("invalidLogin", "Invalid Username/Email and/or Password ");
                //Log into database 
                 YuQarHelper helper2=new YuQarHelper();
                 helper2.insertIntoLogTable(var,"No","Invalid Login","Login Page","Gauteng");
             
                processRequest(request,response,"/index.jsp");
             } 
             
             else
             {
               String tempPassword=logonDetails.get(0).getId().getPassword();
               String tempUser =logonDetails.get(0).getId().getUsername();
              
               //check if username and password match for login
             if(tempUser.equals(usernameRequest) && tempPassword.equals(passwordRequest) && !usernameRequest.equals("") && !passwordRequest.equals(""))
               {        
                 YuQarHelper helper2=new YuQarHelper();
                 helper2.insertIntoLogTable(var,"Yes","Valid Login","Login Page","Gauteng");
              
                 response.setHeader("registrationSuccess", "");
                 response.setHeader("passwordChanged","");
                 processRequest(request, response,"/response.jsp");
                }
              else//if user credentials dont exist in the database
               {
                   //invalid login
                 response.setHeader("invalidLogin", "Invalid Username/Email and/or Password ");
                //Log into database 
                 YuQarHelper helper2=new YuQarHelper();
                 helper2.insertIntoLogTable(var,"No","Invalid Login","Login Page","Gauteng");
             
                processRequest(request,response,"/index.jsp");
               }
             }
         }
/////////////////////////////*/////////////////////////////////////////////////////////////////////////////////////////
///////////////////        /* Forgot Password     //////////////////////////////////////////////////////////////
///////////////////         *///////////////////////////////////////////////////////////////////////////////////////////
         else if(request.getParameter("forgotPassword").equals("forgotPassword"))
         {
             //Create Random Password
             RandomStringUtils randomString = new RandomStringUtils();
             String password =RandomStringUtils.random(12,"abcdefghijklmnopqrstuvxyz0123456789");//generate random password
             YuQarHelper helper = new YuQarHelper();//connect to hibernate object
             List<Logon> logon =helper.selectDataFromDB(usernameRequest);
             
             if(logon.isEmpty())//no record of the user in the database
             {
                 //Invalid password reset (username or email)
                  response.setHeader("invalidForgot", "Invalid Username/Email");
                //Log into database                  
                 YuQarHelper helper2=new YuQarHelper();
                 helper2.insertIntoLogTable(var,"No","Invalid Password Reset - Username Invalid","Forgot Password Page","Gauteng");
          
                 processRequest(request,response,"/forgotPassword.jsp");
             }
             else
             {     
             String user=logon.get(0).getId().getUsername();
             String email=logon.get(0).getId().getEmail();
             
             if(user.equalsIgnoreCase(usernameRequest) && email.equalsIgnoreCase(emailRequest))
              {
                  YuQarHelper helper2 = new YuQarHelper();
               int result=helper2.updateLogonTable(password, usernameRequest);
                //send user email
               Messenger message =new Messenger();
               message.sendEmail(email, password, user);
               
               response.setHeader("registrationSuccess", "");
               response.setHeader("passwordChanged", "YES");
               processRequest(request, response,"/index.jsp");
              }
              else
              {  
                  //Invalid password reset (username or email)
                  response.setHeader("invalidForgot", "Invalid Username/Email");
                //Log into database                  
                 YuQarHelper helper2=new YuQarHelper();
                 helper2.insertIntoLogTable(var,"No","Invalid Password Reset - Email Invalid","Forgot Password Page","Gauteng");
               
                 processRequest(request,response,"/forgotPassword.jsp");
              }
           }
    
       } 
       }
       catch (ServletException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
       catch (IOException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        catch(NullPointerException e)
        {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, e);
        }
        }  
 
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
