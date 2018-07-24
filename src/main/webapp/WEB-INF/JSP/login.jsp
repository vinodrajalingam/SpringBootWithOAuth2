<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
	<script	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="JS/login.js"></script>
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"	rel="stylesheet">
	<link href="CSS/login.css" rel="stylesheet">
	<title>Portal Login</title>
</head>

<body ng-app="app" ng-controller="home as home">
	<div class="container" ng-show="!home.authenticated">
		<div class="omb_login">
			<h3 class="omb_authTitle">
				Login or <a href="/userSignUP">Sign up</a>
			</h3>
			<div class="row omb_row-sm-offset-3 omb_socialButtons">
				 <div class="col-xs-4 col-sm-2" >
			         <a href="/fAuth" class="btn btn-lg btn-block omb_btn-facebook" id = "fAuth">
				        <i class="fa fa-facebook visible-xs"></i>
				        <span class="hidden-xs">Facebook</span>
			        </a> 
			        <!-- <fb:login-button 
 									 scope="public_profile,email"
  									 onlogin="checkLoginState();" class="btn btn-lg btn-block omb_btn-facebook">
  									 <i class="fa fa-facebook visible-xs"></i>
					</fb:login-button> -->
	        	</div> 
				<div class="fb-login-button" data-max-rows="1" data-size="large"
					data-button-type="continue_with" data-show-faces="true"
					data-auto-logout-link="false" data-use-continue-as="true" style="display: none">
				</div>
				<div class="col-xs-4 col-sm-2">
					<a href="/gitAuth" class="btn btn-lg btn-block omb_btn-twitter"> <i
						class="fa fa-twitter visible-xs"></i> <span class="hidden-xs">GitHub</span>
					</a>
				</div>
				<div class="col-xs-4 col-sm-2">
					<!-- <a href="" class="btn btn-lg btn-block omb_btn-google" id="gAuth" ng-click="home.googleCall()">  -->
					<a href="/gAuth" class="btn btn-lg btn-block omb_btn-google" id="gAuth"> 
					<i class="fa fa-google-plus visible-xs"></i> <span class="hidden-xs">Google+</span>
					</a>
				</div>
			</div>

			<div class="row omb_row-sm-offset-3 omb_loginOr">
				<div class="col-xs-12 col-sm-6">
					<hr class="omb_hrOr">
					<span class="omb_spanOr">or</span>
				</div>
			</div>

			<div class="row omb_row-sm-offset-3">
				<div class="col-xs-12 col-sm-6">
					<form class="omb_loginForm" action="/inputLogin" method="POST">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input type="text" class="form-control" name="username"
								placeholder="Enter Username">
						</div>
						<span class="help-block"></span>

						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="password" class="form-control" name="password"
								placeholder="Enter Password">
						</div>
						<span class="help-block" style="display: none">Password
							error</span> <span class="help-block"></span>

						<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
					</form>
				</div>
			</div>
			<div class="row omb_row-sm-offset-3">
				<div class="col-xs-12 col-sm-3">
					<label class="checkbox"> <input type="checkbox"
						value="remember-me">Remember Me
					</label>
				</div>
				<div class="col-xs-12 col-sm-3">
					<p class="omb_forgotPwd">
						<a href="#">Forgot password?</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<div class="container" style="display: none">
		<div class="container-fluid well span6">
				<div class="row-fluid">
			        <div class="span2" >
					    <img src="" class="img-circle" id="userPic">
			        </div>
			        
			        <div class="span8">
			            <h3>User Name : <span ng-bind="home.user"></span></h3>
			            <h6>Email: <span ng-bind="home.email"></span></h6>
			            <h6>Gender : <span ng-bind="home.gender"></span></h6>
			            <h6>locale : 1 Year <span ng-bind="home.locale"></span></h6>
			            <h6><a href="#">More... </a></h6>
			        </div>
			        
			        <div class="span2">
			            <div class="btn-group">
			                <a class="btn dropdown-toggle btn-info" data-toggle="dropdown" href="#">
			                    Action 
			                    <span class="icon-cog icon-white"></span><span class="caret"></span>
			                </a>
			                <ul class="dropdown-menu">
			                    <li><button href="#"><span class="icon-wrench"></span> Modify</a></li>
			                    <li><button href="#"><span class="icon-trash"></span> Delete</a></li>
			                </ul>
			            </div>
			        </div>
				</div>
		</div>
	</div>

<div class="container" ng-show="home.authenticated">
  <nav class="navbar navbar-default nav-menu">
    <div class="navbar-header">
        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".button-menu">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">Hi <span ng-bind="home.user"></span></a>
	</div>
	
	<div class="collapse navbar-collapse button-menu">
		<ul class="nav navbar-nav ">
            <li><a href="#"><i class="fa fa-home"></i> HOME</a></li>
            <li><a href="#">BILLER</a></li>
            <li><a href="#">USERS</a></li>
            <li><a href="#">OFFICES</a></li>
		</ul>
        
        <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span> 
                        <strong><span ng-bind="home.user"></span></strong>
                        <span class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="navbar-login">
                                <div class="row">
                                    <div class="col-lg-4" id="userPic">
                                     <img src="" class="img-circle">
                                        <!-- <p class="text-center">
                                            <span class="glyphicon glyphicon-user icon-size"></span> 
                                            <img src="" class="img-circle" id="userPic">
                                        </p>-->
                                    </div>
                                    <div class="col-lg-8">
                                        <p class="text-left"><strong><span ng-bind="home.user"></span></strong></p>
                                        <p class="text-left small"><span ng-bind="home.email"></span></p>
                                        <p class="text-left">
                                            <a href="/j_spring_security_logout" class="btn btn-primary btn-block btn-sm" id="userLogout">Logout</a>                                           
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="navbar-login navbar-login-session">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <p>
                                        	<a href="#" class="btn btn-primary btn-block">My Profile</a>
                                            <a href="#" class="btn btn-danger btn-block">Change Password</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>   
	</div>
  </nav>
</div>
</body>
</html>