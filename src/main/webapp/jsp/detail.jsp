<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
<link href="./resources/css/general.css" rel="stylesheet">

<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="./resources/js/detail.js"></script>
<title>GOGO Pikachu</title>

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
</div>
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
							<img src="./resources/image/type1detail1.jpg" alt="detail1" style="width: 100%;">
						</div>

						<div class="item">
							<img src="./resources/image/type1detail2.jpg" alt="detail2" style="width: 100%;">
						</div>

						<div class="item">
							<img src="./resources/image/type1detail3.jpg" alt="detail3" style="width: 100%;">
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
						<td><spring:message code="detail.roomType" text="default text" /></td>
						<td>${roomDetail.type}</td>
					</tr>
					<tr>
						<td><spring:message code="details.size" text="default text" /></td>
						<td>${roomDetail.size}</td>
					</tr>
					<tr>
						<td><spring:message code="details.singleBed" text="default text" /></td>
						<td>${roomDetail.singleBedNo}</td>
					</tr>
					<tr>
						<td><spring:message code="details.kingSizeBed" text="default text" /></td>
						<td>${roomDetail.doubleBedNo}</td>
					</tr>
					<tr>
						<td><spring:message code="details.maxGuestNo" text="default text" /></td>
						<td>${roomDetail.guestNo}</td>
					</tr>
					<tr>
						<td><spring:message code="details.refrigerator" text="default text" /></td>
						<td>${roomDetail.hasRefrigerator==true ? "Yes" : "No"}</td>
					</tr>
					<tr>
						<td><spring:message code="details.livingRoom" text="default text" /> </td>
						<td>${roomDetail.hasLivingRoom==true ? "Yes" : "No"}</td>
					</tr>
					<tr>
						<td><spring:message code="details.wifi" text="default text" /></td>
						<td>${roomDetail.hasWIFI==true ? "Yes" : "No"}</td>
					</tr>
					<tr>
						<td><spring:message code="details.parkingLot" text="default text" /></td>
						<td>${roomDetail.hasParkingLot==true ? "Yes" : "No"}</td>
					</tr>
				</table>
			</div>
			<div class="col-md-6">
				<h3>${roomDetail.name}</h3>
				<p class="help-block">${roomDetail.description}</p>
				<form id="booking" action="booking" method="POST">	
					<input type="hidden" value="${roomDetail.type}" id="type" />
					<input type="hidden" value="${roomDetail.price}" id="price" />
					<div class="form-group">
						<label for="fromDate"><spring:message code="table.startDate" text="default text" /></label>
						<div id="datepicker1" class="input-group date"
					data-date-format="mm-dd-yyyy">
							<input type="text" value="${startDate}" id="fromDate" name="fromDate" class="form-control"/>
							<span class="input-group-addon"> 
							<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="toDate"><spring:message code="table.endDate" text="default text" /></label>
						<div id="datepicker2" class="input-group date"
					data-date-format="mm-dd-yyyy">
							<input type="text" value="${endDate}" id="toDate" name="toDate" class="form-control"/>
							<span class="input-group-addon"> 
							<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
					<div class="form-group">
						<label for="location"><spring:message code="table.location" text="default text" /></label>
						<input type="text" value="${location}" id="location" class="form-control" readonly="readonly"/>
					</div>
					<div class="form-group">
						<label for="roomCount"><spring:message code="details.roomCount" text="default text" /></label>
						<select name="roomCount" id="roomCount" class="form-control">
							<c:forEach var="i" begin="1" end="${maxAvailRoom}">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select> 
						<span id="helpBlock" class="help-block"><spring:message code="details.roomLeft" text="default text" /> <span id="availCount">${maxAvailRoom}</span>  <spring:message code="details.roomLeftCount" text="default text" /></span>
					</div>
					<input type="button" class="btn btn-default" value="<spring:message code="details.addToCart" text="default text" />" onclick='addToCart()' />
				</form>
			</div>
		</div>


	</div>
</body>
</html>