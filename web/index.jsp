<%-- 
    Document   : index
    Created on : 14 May 2015, 1:15:32 PM
    Author     : A199026
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>YuQar Login</title>
        
        <link runat="server" rel="shortcut icon" href="uqar.png" type="image/x-icon" />
        <script src='/jquery-1.11.3.js'></script>
        <link rel="stylesheet" href="master.css" type="text/css" />
        
    </head>
    <body>
        <section class="container">
            <div class="login">
            <h1> Login to YuQar Technologies</h1>
            <form name="access" method="get" action="LoginServlet">
                <%
                    String str = response.getHeader("invalidLogin");
                
                    
                  try{
                   if(!str.equals(null))
                   { 
                %>
                <label><font color="red"><%=str%></font></label>
                       
                <%   
                  }
                  
                  
                %>
            <p><input type="text" name="username" value="Gontse"></p>
            <p><input type="password" name="password" value="Gontse119900"></p>
            <p class="remember_me">
            <label>
            <input type="checkbox" name="rememberMe" id="remember_me">
            Remember me on this computer?
            </label>
            </p>
            <p class="submit"><input type="submit" name="login" value="Login"></p>
            <input type="hidden" name="index" value="index">
      </form>
            </div>
            
            <div class="forgot">
                <p align="center">Forgot your password? <a href="forgot.jsp">Click here to reset password</a>.  <a href="newUser.jsp">New User ?</a></p>
             
              </div>

        </section>
        
                <%
                  }
                  catch(NullPointerException e)
                  {
                %>
                  <p><input type="text" name="username" value="Bradly"></p>
            <p><input type="password" name="password" value="Bradly119900" ></p>
            <p class="remember_me">
            <label>
            <input type="checkbox" name="rememberMe" id="remember_me">
            Remember me on this computer?
            </label>
            </p>
            <p class="submit"><input type="submit" name="login" value="Login"></p>
            <input type="hidden" name="index" value="index">
            <input type="hidden" name="email" value="email">
            <input type="hidden" name="verifyPassword" value="verifyPassword">
      </form>
            </div>
            
            <div class="forgot">
                <p align="center">Forgot your password? <a href="forgotPassword.jsp">Click here to reset password</a>.  <a href="newUser.jsp">New User ?</a></p>
             
              </div>

        </section>
                  
                  
                  <%
                  }
                      %>
    </body>
</html>
