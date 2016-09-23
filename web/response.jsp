<%-- 
    Document   : response
    Created on : 14 May 2015, 1:22:44 PM
    Author     : A199026
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Clubbing on the go">
        <meta name="keywords" content="club,party,events,crowd">
        <meta name="author" content="Gontse Ntshegi">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Signed In</title>
        <link runat="server" rel="shortcut icon" href="uqar.png" type="image/x-icon" />     
        <link rel="stylesheet" href="master.css" type="text/css" />    
        <link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css"
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


        
        <script src="http://maps.googleapis.com/maps/api/js"></script>
         <script type="text/javascript" src="ajax.js"></script>
     <% String str = response.getHeader("registrationSuccess");
        String str2 = response.getHeader("passwordChanged");
     %>
    <script type="text/javascript">
            function initialize() {
             var mapProp = {center:new google.maps.LatLng(51.508742,-0.120850),zoom:5,mapTypeId:google.maps.MapTypeId.HYBRID};
                var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
                var marker=new google.maps.Marker({
                    position:myCenter,animation:google.maps.Animation.BOUNCE,
                    icon:'GooglePointer.jpeg'
                    });
                    marker.setMap(map);
             }
            google.maps.event.addDomListener(window, 'load', initialize);
            
            function registrationSuccess(s)
            {
              //if("=str%>!=="")
              //{
                var header ="<%=str%>";
                if(header!==""){
                  alert(header);
                return false;
               }
         
            }
</script>
     
        
    </head>
    
    
    <body onload="return registrationSuccess()">
       
        <jsp:useBean id="myBean" scope="session" class="org.mypackage.yuqar.beans.Yuqar" />
        <jsp:setProperty name="myBean" property="*"/>         
        
          
     <nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" aria-label="right align" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="glyphicon glyphicon-align-left" aria-hidden="true"></span>
        
          <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">YuQar</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="response.jsp">Home <span class="sr-only">(current)</span></a></li>
        <li><a href="#">About us</a></li>
        <li><a href="#">News</a></li>
        <li><a href="#">Contact us</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Services <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="header.jsp">Services Catalogue</a></li>
            <li><a href="#">Product Catalogue</a></li>           
            <li role="separator" class="divider"></li>
            <li><a href="#">Deleted Catalogue</a></li>       
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search" size="50px">
        </div>
        <button type="submit" class="btn btn-default">Search</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
          <li><label >Dashboard <a href="#"><span class="label label-default">17</span></a></label></li>
          <li><label >Hello, <jsp:getProperty name="myBean" property="username"/></label></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
        
        <div id='content' class='container-fluid'>
       
        <div class='row'>
            <div class='col-md-12'>
                
            </div>
        </div>
        
         <div class='row'>
          <div class='col-md-12'>
        <div  id="googleMap" style="width:500px;height:380px;" align='center' class="img-thumbnail" alt="google"></div>
          </div>
         </div>
        
        </div>
        
      <div class=''> </div>
      <%
      response.setHeader("registrationSuccess", "R");
      %>
    </body>
</html>
