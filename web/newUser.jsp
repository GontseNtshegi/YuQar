<%-- 
    Document   : newUser
    Created on : 27 May 2015, 12:22:50 PM
    Author     : a199026
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.yuqar.servlets.LoginServlet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Register</title>
        <link rel="stylesheet" href="master.css" type="text/css" />
        <link runat="server" rel="shortcut icon" href="uqar.png" type="image/png" />
        <link runat="server" rel="icon" href="uqar.png" type="image/png" />
        
         <% String str = response.getHeader("RegistrationError");%>
         <script>
            function validateForm() {
               var x = document.forms["register"]["password"].value;
               var y = document.forms["register"]["verifyPassword"].value;
               if (x!==y) {
               alert("Passwords do not match");
              return false;
    }
            }
             function registrationOutstanding(s)
            {
           
                var header ="<%=str%>";
                if(header=="")
                {
                 
                //return false;
               }
               else
               {
                  alert(header);
                   //return true;
               }
            }


        </script>
    </head>
    <body >
        <section class="container">
        
        <div class="login">
            <h1> YuQar Technologies Registration</h1>
            <h1>Enter your details</h1>
            <form name="register" method="post" action="LoginServlet" onsubmit="return validateForm()">
                <p><input type="text" name="username" value="" placeholder="Username" required></p>
                <p><input type="text" name="email" value="" placeholder="Email" required></p>
                <p><input type="password" name="password" value="" placeholder="Password" required></p>
                <p><input type="password" name="verifyPassword" value="" placeholder="Verify Password" required></p>
                <p class="submit"><input type="submit" name="login" value="Register"></p>
                <input type="hidden" name="register" value="register">
                <input type="hidden" name="forgotPassword" value="">
            </form>
        </div>
        </section>
    </body>
</html>
