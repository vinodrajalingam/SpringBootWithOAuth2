<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
		<script type="text/javascript" src="JS/signup.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="CSS/signup.css" rel="stylesheet">
		<title>Sign UP</title>
	</head>
<body>
<div class="container">
    <div class="login-signup">
      <div class="row">
        <div class="col-sm-6 nav-tab-holder">
        <ul class="nav nav-tabs row" role="tablist">
          <li role="presentation" class="active col-sm-6"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Admin</a></li>
          <li role="presentation" class="col-sm-6"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">User</a></li>
        </ul>
      </div>

      </div>


      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="home">
          <div class="row">

            <div class="col-sm-6 mobile-pull">
              <article role="login">
                <h3 class="text-center"><i class="fa fa-lock"></i> Create Admin Account	!!</h3>
                <form class="signup" action="#" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="FirstName" name="fName">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control" placeholder="LastName" name="lName">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control" placeholder="UserName" name="uName">
                  </div>
                  <div class="form-group">
                    <input type="email" class="form-control" placeholder="Email Address" name="eMail">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control" placeholder="Phone Number" onchange="phoneNoEntered(uPhone)" name="uPhone" id="uPhone">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control" placeholder="Password" name="password">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control" placeholder="OTP" style="display: none" id="otp">
                  </div>
                  <div class="form-group">
                    <div class="checkbox">
                      <label>
                        <input type="checkbox"> Please accept the terms and conditions to proceed with your request.
                      </label>
                    </div>
                  </div>
                  <div class="form-group">
                    <input type="button" class="btn btn-success btn-block"  value="SUBMIT" onclick="signUpSubmit()">
                  </div>
                </form>

                <footer role="signup" class="text-center">
                  <ul>
                    <li>
                      <a href="#">Terms of Use</a>
                    </li>
                    <li>
                      <a href="#">Privacy Statement</a>
                    </li>
                  </ul>
                </footer>

              </article>
            </div>

            <div class="col-sm-6">
              <article role="manufacturer"  class="text-center">
                <header>
                  ADMIN
                </header>
               <!--  <h1>FREE</h1> -->
                <ul class="text-left">
                  <li><i class="fa fa-check"></i>  Unlimited  access</li>
                  <li><i class="fa fa-check"></i>  File Upload Access</li>
                  <li><i class="fa fa-check"></i>  Create Project Lists</li>
                  <li><i class="fa fa-check"></i>  Share Files</li>
                  <li><i class="fa fa-check"></i>  Dashboard Access</li>
                  <li><i class="fa fa-check"></i>  Assign Role to Other Users</li>
                </ul>
              </article>
            </div>

          </div>
          <!-- end of row -->
        </div>
        <!-- end of home -->

      <div role="tabpanel" class="tab-pane" id="profile">
        <div class="row">

          <div class="col-sm-6 mobile-pull">
            <article role="login">
              <h3 class="text-center"><i class="fa fa-lock"></i> Create User Account</h3>
              <form class="signup" action="#" method="post">
              <div class="form-group">
                    <input type="text" class="form-control" placeholder="FirstName" name="fName">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control" placeholder="LastName" name="lName">
                  </div>
                <div class="form-group">
                  <input type="text" class="form-control" placeholder="UserName" name="uName">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control" placeholder="Email Address" name="eMail">
                </div>       
                <div class="form-group">
                  <input type="password" class="form-control" placeholder="Password" name="password">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" placeholder="Confirm Password">
                </div>
                <div class="form-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox"> Please accept the terms and conditions to proceed with your request.
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <input type="button" class="btn btn-success btn-block"  value="SUBMIT" onclick="signUpSubmit()">
                </div>
              </form>
              <footer role="signup" class="text-center">
                <ul>
                  <li>
                    <a href="#">Terms of Use</a>
                  </li>
                  <li>
                    <a href="#">Privacy Statement</a>
                  </li>
                </ul>
              </footer>

            </article>
          </div>

          <div class="col-sm-6">
            <article role="manufacturer"  class="text-center">
              <header>
                USER
              </header>
              <!-- <h1>FREE</h1> -->
              <ul class="text-left">
                <li><i class="fa fa-check"></i>  Limited Access</li>
                <li><i class="fa fa-check"></i>  View Site Access</li>
                <li><i class="fa fa-check"></i>  Navigate to minimal pages Access</li>
                <li><i class="fa fa-check"></i>  Only Read Access</li>
              </ul>
            </article>
          </div>
        </div>
      </div>
  </div>
  </div>	
  </div>
</body>
</html>