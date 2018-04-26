<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/search.css">
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script src="./resources/js/search.js"></script>
<title>GOGO Pikachu|Search</title>
<script>
$(document).ready(function(){
	var name = '<%=session.getAttribute("user")%>';
		if (name == "null") {
			$("#loginIcon").show();
			$("#signUpIcon").show()
			$("#personalIcon").hide();
			$("#logoutIcon").hide();
		} else {
			$("#signUpIcon").hide()
			$("#loginIcon").hide();
			$("#personalIcon").show();
			$("#logoutIcon").show();
		}
	})
</script>
</head>
<body>
<a href="?language=en_HK">English</a> | <a href="?language=cn">&#20013;&#25991;</a>
	<div class="container">
		<div id="contentHeader">
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
							<li class="active"><a href="search"><spring:message code="nav.opt2" text="default text" /></a></li>
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
								data-target="#login"><span
									class="glyphicon glyphicon-log-in"></span> <spring:message code="nav.opt8" text="default text" /> </a></li>
							<li id="logoutIcon"><a href="#" onclick="logout()"><span
									class="glyphicon glyphicon-log-out"></span> <spring:message code="nav.opt9" text="default text" /></a></li>
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

		</div>
		<div id="contentBody">
			<div id="roomSearch">
				<form>
					<div class="form-group">
						<label><spring:message code="table.startDate" text="default text" /></label>
						<div id="datepicker1" class="input-group date"
							data-date-format="mm-dd-yyyy">
							<input type="text" class="form-control form-control-warning"
								name="startDate" id="startDate" required="true" /> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label><spring:message code="table.endDate" text="default text" /></label>
						<div id="datepicker2" class="input-group date"
							data-date-format="mm-dd-yyyy">
							<input class="form-control form-control-warning" name="endDate"
								id="endDate" required /> <span class="input-group-addon">
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label><spring:message code="table.location" text="default text" /></label>
						<div>
							<select class="form-control form-control-warning" name="location"
								id="location" required>
								<option value=""></option>
								<option value="New York"><spring:message code="options.newYork" text="default text" /></option>
								<option value="Shanghai"><spring:message code="options.shanghai" text="default text" /></option>
								<option value="Tokyo"><spring:message code="option.tokyo" text="default text" /></option>
								<option value="London"><spring:message code="options.london" text="default text" /></option>
								<option value="HongKong"><spring:message code="options.hongkong" text="default text" /></option>
							</select>
						</div>
					</div>
				</form>
				<div class="form-group">
					<div>
						<button id="search" name="search" onclick="searchRoom()"
							class="btn btn-default"><spring:message code="button.search" text="default text" /></button>
					</div>
				</div>
			</div>

			<div id="searchRes">
				<table id="roomList" class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col"><spring:message code="table.name" text="default text" /></th>
							<th scope="col"><spring:message code="table.roomType" text="default text" /></th>
							<th scope="col"><spring:message code="table.price" text="default text" /></th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>