<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="./resources/js/cart.js" ></script>
<title>Shopping Cart</title>
<script type="text/javascript">
$(document).ready(function(){
	var name = '<%=session.getAttribute("user")%>';
		console.log(name);
		if (name == "null") {
			$("#signUpIcon").show()
			$("#loginIcon").show();
			$("#cartIcon").show();
			$("#personalIcon").hide();
			$("#logoutIcon").hide();
		} else {
			$("#signUpIcon").hide()
			$("#loginIcon").hide();
			$("#cartIcon").show();
			$("#personalIcon").show();
			$("#logoutIcon").show();
		}
	})
</script>
</head>
<body>
	<div class="container">
		<h2>GOGO Pikachu</h2>
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
						<li><a href="#">Our Hotels</a></li>
						<li><a href="search">Find Rooms</a></li>
						<li><a href="#">Offers</a></li>
						<li><a href="#">Dining</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li id="signUpIcon"><a href="register"><span
								class="glyphicon glyphicon-user"></span> Sign Up</a></li>
						<li id="personalIcon"><a href="record"><span
								class="glyphicon glyphicon-user"></span> Personal</a></li>
						<li id="cartIcon"><a href="cart"><span class="glyphicon glyphicon-shopping-cart"></span></a>
						<li id="loginIcon"><a data-toggle="modal"
							data-target="#login"><span class="glyphicon glyphicon-log-in"></span>
								Login </a></li>
						<li id="logoutIcon"><a href="#"><span
								class="glyphicon glyphicon-log-out"></span> Logout</a></li>
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
						<form:form id="loginForm" cssClass="form-horizontal"
							modelAttribute="login" action="loginProcess" method="post">
							<div class="form-group">
								<form:label path="username" cssClass="control-label">Username: </form:label>
								<div>
									<form:input path="username" type="text" cssClass="form-control"
										name="username" id="loginUsername" required="required" />
								</div>
							</div>
							<div class="form-group">
								<form:label path="password" cssClass="control-label">Password:</form:label>
								<div>
									<form:input path="password" type="password" cssClass="form-control"
										name="password" id="loginPassword" required="required" />
								</div>
							</div>
							<div class="form-group">
								<div >
									<form:button id="login" name="login" class="btn btn-default">Login</form:button>
								</div>
							</div>
						</form:form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>Room Type</th>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Location</th>				
					<th>Price</th>
				</tr>
			</thead>
			<c:forEach items="${sessionScope.orders}" var="order">
				<tr>
					<td><input type="checkbox" name="checkOutItems[]" class="checkout" id="checkOutItems"
					data-value='{"fromDate":"${order.fromDate}", "toDate":"${order.toDate}", "roomType":"${order.roomType}", "location":"${order.location}",  "roomCount":${order.roomCount},  "price":${order.price}}'>
					</td>
					<td>${order.roomType}</td>
					<td>${order.fromDate}</td>
					<td>${order.toDate}</td>
					<td>${order.location}</td>
					<td>${order.price}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" class="btn btn-default" value="Checkout" onclick='checkout()' />
	</div>
</body>
</html>