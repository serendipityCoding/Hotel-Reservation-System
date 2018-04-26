<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<link rel="shortcut icon" type="image/png" href="./resources/image/icon.png" sizes="16x16">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/css/register.css" rel="stylesheet">
<link href="./resources/css/general.css" rel="stylesheet">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.js"></script>
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
		$("#personalIcon").hide();
	}
	else{
		$("#signUpIcon").hide()
		$("#loginIcon").hide();
		$("#logoutIcon").show();
	}
})
</script>
<title>GOGO Pikachu|Registration</title>
</head>
<body>
	<div class="container">
			<h2><spring:message code="hotel.name" text="default text" /></h2>
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">
							<li><a href="#"><spring:message code="nav.opt1" text="default text" /></a></li>
							<li><a href="search"><spring:message code="nav.opt2" text="default text" /></a></li>
							<li><a href="#"><spring:message code="nav.opt3" text="default text" /></a></li>
							<li><a href="#"><spring:message code="nav.opt4" text="default text" /></a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li id="signUpIcon"><a href="register"><span
									class="glyphicon glyphicon-user"></span> <spring:message code="nav.opt5" text="default text" /></a></li>
							<li id="personalIcon"><a href="record"><span
									class="glyphicon glyphicon-user"></span> <spring:message code="nav.opt6" text="default text" /></a></li>
							<li id="cartIcon"><a href="cart"><span
									class="glyphicon glyphicon-shopping-cart"></span> <spring:message code="nav.opt7" text="default text" /></a></li>
							<li id="loginIcon"><a data-toggle="modal"
								data-target="#loginModal"><span
									class="glyphicon glyphicon-log-in"></span> <spring:message code="nav.opt8" text="default text" /> </a></li>
							<li id="logoutIcon"><a href="#" onclick="logout()"><span
									class="glyphicon glyphicon-log-out"></span> <spring:message code="nav.opt9" text="default text" /></a></li>
						</ul>
					</div>
				</div>
			</nav>
			<div class="modal fade" id="loginModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"><spring:message code="nav.opt8" text="default text" /></h4>
						</div>
						<div class="modal-body">
							<form id="loginForm" class="form-horizontal"
								action="loginProcess" method="post">
								<div class="form-group">
									<label path="username" class="control-label col-sm-2"><spring:message code="login.username" text="default text" />
									</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="username"
											id="loginUsername" required="required" />
									</div>
								</div>
								<div class="form-group">
									<label path="password" class="control-label col-sm-2"><spring:message code="login.password" text="default text" /></label>
									<div class="col-sm-10">
										<input type="password" class="form-control" name="password"
											id="loginPassword" required="required" />
									</div>
								</div>
							</form>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button id="login" name="login" class="btn btn-default"
										onclick="login()"><spring:message code="button.login" text="default text" /></button>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal"><spring:message code="button.close" text="default text" /></button>
						</div>
					</div>

				</div>
			</div>
		
		<div id="contentBody">
			<h2 id="contentTitle"><spring:message code="title.becomeOurMember" text="default text" /></h2>
			<form data-toggle="validator" role="form" id="regForm" class="form-horizontal col-md-10 col-md-offset-2">
				<div class="form-group">
					<label class="control-label col-sm-3"><spring:message code="register.email" text="default text" /></h2></label>
					<div class="col-sm-6">
						<input type="email" name="email" id="email" class="form-control" data-error="<spring:message code="register.emailInfo" text="default text" />" required/>
						<div class="help-block with-errors"></div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"><spring:message code="register.username" text="default text" /></label>
					<div class="col-sm-6">
						<input name="username" id="username" class="form-control" required="required" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"><spring:message code="register.password" text="default text" /></label>
					<div class="col-sm-6">
						<input type="password" name="password" id="password" data-minlength="6" class="form-control" required/>
						<div class="help-block"><spring:message code="register.passwordInfo" text="default text" /></div>
					</div>			
				</div>
				<div class="form-group">
					<label type="password" class="control-label col-sm-3"><spring:message code="register.retypePassword" text="default text" /></label>
					<div class="col-sm-6">
						<input type="password" name="retypePassword"
							id="retypePassword" class="form-control" data-match="#password" data-match-error="<spring:message code="register.retypePasswordInfo" text="default text" />" required />
						 <div class="help-block with-errors"></div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"><spring:message code="register.firstName" text="default text" /></label>
					<div class="col-sm-6">
						<input name="firstname" id="firstname"
							class="form-control" required="required" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"><spring:message code="register.lastName" text="default text" /></label>
					<div class="col-sm-6">
						<input name="lastname" id="lastname" class="form-control" required="required" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"><spring:message code="register.billingAddress" text="default text" /></label>
					<div class="col-sm-6">
						<input name="address" id="address"
							class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"><spring:message code="register.phone" text="default text" /></label>
					<div class="col-sm-6">
						<input name="phone" id="phone"
							class="form-control" required="required" />
					</div>
				</div>
			</form>
			<div class="form-group">
				<div class="col-sm-offset-8">
					<button id="register" name="register" class="btn btn-default" onclick="registerNow()"><spring:message code="button.register" text="default text" /></button>
				</div>
			</div>
		</div>
	</div>






</body>
</html>