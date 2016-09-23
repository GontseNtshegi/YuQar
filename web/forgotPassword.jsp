<%-- 
    Document   : forgotPassword
    Created on : 30 May 2015, 10:41:27 AM
    Author     : A199026
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.yuqar.servlets.LoginServlet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <link rel="stylesheet" href="master.css" type="text/css" />
        <link runat="server" rel="shortcut icon" href="uqar.png" type="image/png" />
        <link runat="server" rel="icon" href="uqar.png" type="image/png" />
         
    </head>
    <body>
        <section class="container">
        
        <div class="login">
            <h1> YuQar Technologies Password Recovery</h1>
            <h1>Enter your details</h1>
            <form name="forgotPassword" method="post" action="LoginServlet">
                <%
                    String str = response.getHeader("invalidForgot");
                    
                  try{
                   if(!str.equals(null))
                   { 
                %>
                <label><font color="red"><%=str%></font></label>
                       
                <%   
                  }
                  
                 
                %>
                <p><input type="text" name="username" value="" placeholder="Username" required></p>
                <p><input type="text" name="email" value="" placeholder="Email" required></p>
                <p class="submit"><input type="submit" name="forgot" value="Reset"></p>
                <input type="hidden" name="forgotPassword" value="forgotPassword">
            </form>
        </div>
        </section>
                <%
                  }
                  catch(NullPointerException e)
                  {
                %>
                <p><input type="text" name="username" value="" placeholder="Username" required></p>
                <p><input type="text" name="email" value="" placeholder="Email" required></p>
                <p class="submit"><input type="submit" name="forgot" value="Reset"></p>
                <input type="hidden" name="forgotPassword" value="forgotPassword">
                 <input type="hidden" name="register" value="">
            </form>
        </div>
        </section>
         <%
                  }
                      %>
    </body>
</html>