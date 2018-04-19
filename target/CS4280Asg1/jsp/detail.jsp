<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
<link href="./resources/css/detail.css" rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="./resources/js/detail.js"></script>
<title>Detail</title>

<script>
$(document).ready(function(){
	var name = '<%=session.getAttribute("user")%>';
		console.log(name);
		if (name == "null") {
			$("#signUpIcon").show()
			$("#loginIcon").show();
			$("#promotion").show();
			$("#personalIcon").hide();
			$("#logoutIcon").hide();
		} else {
			$("#signUpIcon").hide()
			$("#loginIcon").hide();
			$("#promotion").hide();
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
					<li id="loginIcon"><a data-toggle="modal" data-target="#login"><span
							class="glyphicon glyphicon-log-in"></span> Login </a></li>
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
		
		<div id="detail" class="row">
			<div class="col-md-6">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="./resources/image/type${roomDetail.id}detail1.jpg" alt="detail1" style="width: 100%;">
						</div>

						<div class="item">
							<img src="./resources/image/type${roomDetail.id}detail2.jpg" alt="detail2" style="width: 100%;">
						</div>

						<div class="item">
							<img src="./resources/image/type${roomDetail.id}detail3.jpg" alt="detail3" style="width: 100%;">
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
					<table id="roomInfo" class="table table-striped">
					<tr>
						<td>Size: </td>
						<td>${roomDetail.size}</td>
					</tr>
					<tr>
						<td>Single Bed: </td>
						<td>${roomDetail.singleBedNo}</td>
					</tr>
					<tr>
						<td>King Size Bed: </td>
						<td>${roomDetail.doubleBedNo}</td>
					</tr>
					<tr>
						<td>Max Guest No:</td>
						<td>${roomDetail.guestNo}</td>
					</tr>
					<tr>
						<td>Refrigerator: </td>
						<td>${roomDetail.hasRefrigerator==true ? "Yes" : "No"}</td>
					</tr>
					<tr>
						<td>Living Room: </td>
						<td>${roomDetail.hasLivingRoom==true ? "Yes" : "No"}</td>
					</tr>
					<tr>
						<td>Free WIFI: </td>
						<td>${roomDetail.hasWIFI==true ? "Yes" : "No"}</td>
					</tr>
					<tr>
						<td>Parking Lot: </td>
						<td>${roomDetail.hasParkingLot==true ? "Yes" : "No"}</td>
					</tr>
					<tr>
						<td>Price (USD): </td>
						<td>${roomDetail.price}</td>
					</tr>
				</table>
			</div>
			<div class="col-md-6">
				<h4>${roomDetail.type}</h4>
				<p class="help-block">${roomDetail.description}</p>
				<form id="booking" action="booking" method="POST">	
					<input type="hidden" value="${roomDetail.type}" id="type" />
					<input type="hidden" value="${roomDetail.price}" id="price" />
					<div class="form-group">
						<label for="fromDate">Start Date: </label>
						<div id="datepicker1" class="input-group date"
					data-date-format="mm-dd-yyyy">
							<input type="text" value="${startDate}" id="fromDate" name="fromDate" class="form-control"/>
							<span class="input-group-addon"> 
							<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="toDate">End Date: </label>
						<div id="datepicker2" class="input-group date"
					data-date-format="mm-dd-yyyy">
							<input type="text" value="${endDate}" id="toDate" name="toDate" class="form-control"/>
							<span class="input-group-addon"> 
							<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="location">End Date: </label>
						<input type="text" value="${location}" id="location" class="form-control" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label for="roomCount">Rooms: </label>
						<select name="roomCount" id="roomCount" class="form-control">
							<c:forEach var="i" begin="1" end="${maxAvailRoom}">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select> 
						<span id="helpBlock" class="help-block">Only ${maxAvailRoom} Rooms Left</span>
					</div>
					<input type="button" class="btn btn-default" value="Add to Cart" onclick='addToCart()' />
				</form>
			</div>
		</div>


	</div>
</body>
</html>