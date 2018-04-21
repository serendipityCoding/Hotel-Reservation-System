<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/register.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="./resources/js/register.js"></script>
<script>
$(document).ready(function(){
	var name = '<%= session.getAttribute("user") %>';
	console.log(name);
	if(name=="null"){
		$("#loginIcon").show();
		$("#logoutIcon").hide();
	}
	else{
		$("#signUpIcon").hide()
		$("#loginIcon").hide();
		$("#logoutIcon").show();
	}
})
</script>
<title>Registration</title>
</head>
<body>
	<div class="container">
		<h2>GOGO Pikachu</h2>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="#">Our Hotels</a></li>
						<li><a href="search">Find Rooms</a></li>
						<li><a href="#">Offers</a></li>
						<li><a href="#">Dining</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li id="signUpIcon" class="active">
							<a href="register"><span class="glyphicon glyphicon-user"></span> Sign Up</a>
						</li>
						<li id="personalIcon">
							<a href="record"><span class="glyphicon glyphicon-user"></span> Personal</a>
						</li>
						<li id="cartIcon"><a href="cart"><span
								class="glyphicon glyphicon-shopping-cart"></span> Cart</a>
						<li id="loginIcon">
							<a data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span> Login
							</a>
						</li>
						<li id="logoutIcon">
							<a onclick="logout()"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="modal fade" id="login" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Login</h4>
					</div>
					<div class="modal-body">
						<form id="loginForm" class="form-horizontal" action="loginProcess" method="post">
							<div class="form-group">
								<label path="username" class="control-label col-sm-2">Username: </label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										name="username" id="loginUsername" required="required" />
								</div>
							</div>
							<div class="form-group">
								<label path="password" class="control-label col-sm-2">Password:</label>
								<div class="col-sm-10">
									<input type="password" class="form-control"
										name="password" id="loginPassword" required="required" />
								</div>
							</div>
						</form>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button id="login" name="login" class="btn btn-default" onclick="login()">Login</button>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		
		<div id="contentBody">
			<h2 id="contentTitle">Become our member</h2>
			<form id="regForm" class="form-horizontal col-md-10 col-md-offset-2">
				<div class="form-group">
					<label class="control-label col-sm-2">Email:</label>
					<div class="col-sm-7">
						<input name="email" id="email" class="form-control" required="required" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">Username:</label>
					<div class="col-sm-7">
						<input name="username" id="username" class="form-control" required="required" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">Password:</label>
					<div class="col-sm-7">
						<input type="password" name="password" id="password"
							class="form-control" required="required" />
					</div>
				</div>
				<div class="form-group">
					<label type="password" class="control-label col-sm-2">Retype Password:</label>
					<div class="col-sm-7">
						<input type="password" name="retypePassword"
							id="retypePassword" class="form-control" required="required" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">FirstName:</label>
					<div class="col-sm-7">
						<input name="firstname" id="firstname"
							class="form-control" required="required" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">LastName:</label>
					<div class="col-sm-7">
						<input name="lastname" id="lastname" class="form-control" required="required" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">Address:</label>
					<div class="col-sm-7">
						<input name="address" id="address"
							class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">Phone:</label>
					<div class="col-sm-7">
						<input name="phone" id="phone"
							class="form-control" required="required" />
					</div>
				</div>
			</form>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button id="register" name="register" class="btn btn-default" onclick="registerNow()">Register</button>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="container">All rights reserved</div>
	</footer>
</body>
</html>