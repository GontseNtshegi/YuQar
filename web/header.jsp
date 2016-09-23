<%-- 
    Document   : header
    Created on : 25 Jun 2015, 3:47:53 PM
    Author     : A199026
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Services Catalogue</title>
        <meta name="description" content="Clubbing on the go">
        <meta name="keywords" content="club,party,events,crowd">
        <meta name="author" content="Gontse Ntshegi">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        
        <link runat="server" rel="shortcut icon" href="uqar.png" type="image/x-icon" />     
       <link rel="stylesheet" href="master2.css" type="text/css" /> 
        <link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css"
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />

<script>
  $("#modal_trigger").leanModal({top : 200, overlay : 0.6, closeButton: ".modal_close" });
  </script>

    </head>
    <body>
<!------------------------------------------------------- START of top bar in html page------------------------!-->
        
<jsp:useBean id="myBean" scope="session" class="org.mypackage.yuqar.beans.Yuqar" />
        <jsp:setProperty name="myBean" property="*"/>         
        
        <%
            response.setHeader("registrationSuccess", "R");
            %>
     <nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
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
        <li ><a href="response.jsp">Home </a></li>
        <li><a href="#">About us</a></li>
        <li><a href="#">News</a></li>
        <li><a href="#">Contact us</a></li>
        <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" >Services<span class="caret"></span> </a>
          <ul class="dropdown-menu">
            <li class="active"><a href="header.jsp">Services Catalogue</a></li>
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
 <!---------------------------------------------- END of top bar in html page----------------------------------!-->
 
 <!---------------------------------------------- START of sidebar in html page----------------------------------!-->
 <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="response.jsp">
                        YuQar home
                    </a>
                </li>
                <li>
                    <a href="#">Dashboard</a>
                </li>
                <li>
                  
                
                    <a href="#new-service" id="modal-trigger">add new service</a>
                     <div class="popupContainer" id="new-service" style="min-width:250px;height:250px">
                         <header>
                             <span class="header_title">Service information</span>
                             <span class="modal_close"><i class="fa fa-times"></i></span>
                         </header>
                         <section>
                        <form method="post" action="ServiceServlet">
                           
                            <label for="serviceName" class="ui-hidden-accessible">Service name:</label>
                            <input type="text" name="user" id="serviceName" placeholder="Service name">
                            <label for="image" class="ui-hidden-accessible">Service icon:</label>
                            <input type="file" name="imageFile" accept="image/*" id="image">              
                            <input type="submit" data-inline="true" value="save">
                            
                        </form>
                         </section>
                     </div>
                 
                 
                </li>
                
                <li>
                    <a href="#edit-service">edit service</a>
                </li>
               
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->
     
       <div id="page-content-wrapper"
        <div  class='container-fluid'>
                <jsp:include page="services.jsp"></jsp:include>
                <br/>
          <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Close/Open sidebar menu</a>
        </div>
        </div> 
                
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    
 
    </script>
    </body>
</html>
