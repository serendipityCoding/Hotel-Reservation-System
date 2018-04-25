<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GOGO Pikachu</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="./resources/css/general.css" rel="stylesheet">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script src="./resources/js/record.js"></script>
<script>
$(document).ready(function(){
	var name = '<%=session.getAttribute("user")%>';
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
<style>
#startDate{
	z-index:9999
}
#endDate{
	z-index:9999
}

</style>
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
							<li><a href="search"><spring:message code="nav.opt2" text="default text" /></a></li>
							<li><a href="#"><spring:message code="nav.opt3" text="default text" /></a></li>
							<li><a href="#"><spring:message code="nav.opt4" text="default text" /></a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li id="signUpIcon"><a href="register"><span
									class="glyphicon glyphicon-user"></span> <spring:message code="nav.opt5" text="default text" /></a></li>
							<li  class="active" id="personalIcon"><a href="record"><span
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
		<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"><spring:message code="order.ti" text="default text" /></h4>
						</div>
						<div class="modal-body">
							<form id="roomSearch" class="form-horizontal" method="POST" action="modifySearch">
								<input type="hidden" id="bookingID" />
								<div class="form-group">
									<label class="control-label col-sm-4"><spring:message code="table.startDate" text="default text" /></label>
									<div class="col-sm-6">
										<div id="datepicker1" class="input-group date"
											data-date-format="yyyy-mm-dd">
											<input class="form-control" name="startDate" id="startDate"
												required="required" /> <span class="input-group-addon">
												<span class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4"><spring:message code="table.endDate" text="default text" /></label>
									<div class="col-sm-6">
										<div id="datepicker2" class="input-group date"
											data-date-format="yyyy-mm-dd">
											<input class="form-control" name="endDate" id="endDate"
												required="required" /> <span class="input-group-addon">
												<span class="glyphicon glyphicon-calendar"></span>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4"><spring:message code="table.location" text="default text" /></label>
									<div class="col-sm-6">
										<select class="form-control" name="location"
											id="location" required="required">
											<option value=""></option>
											<option value="NewYork"><spring:message code="options.newYork" text="default text" /></option>
											<option value="Shanghai"><spring:message code="options.shanghai" text="default text" /></option>
											<option value="Tokyo"><spring:message code="option.tokyo" text="default text" /></option>
											<option value="London"><spring:message code="options.london" text="default text" /></option>
											<option value="Hong Kong"><spring:message code="options.hongkong" text="default text" /></option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<input type="button" id="search" name="search"
											class="btn btn-default" onclick='modifySearch()'
											value="<spring:message code="button.search" text="default text" />" />
									</div>
								</div>
							</form>
							<div id="result"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal"><spring:message code="button.close" text="default text" /></button>
						</div>
					</div>

				</div>
			</div>
		<div id="contentBody">
			<h3><spring:message code="title.comingReservation" text="default text" /></h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th><spring:message code="table.roomType" text="default text" /></th>
						<th><spring:message code="table.startDate" text="default text" /></th>
						<th><spring:message code="table.endDate" text="default text" /></th>
						<th><spring:message code="table.location" text="default text" /></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${futureBookings}" var="item">
						<tr>
							<td>${item.id}</td>
							<td>${item.roomType}</td>
							<td>${item.fromDate}</td>
							<td>${item.toDate}</td>
							<td>${item.location}</td>
							<td><button type="button" class='btn btn-default'
									onclick='showModal({id:${item.id}, fromDate: "${item.fromDate}", toDate: "${item.toDate}"})'><spring:message code="button.modify" text="default text" /></button>
								<button type="button" class='btn btn-default' onclick='cancelBooking(${item.id})'><spring:message code="button.cancel" text="default text" /></button>
							</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<h3><spring:message code="title.pastReservation" text="default text" /></h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th><spring:message code="table.roomType" text="default text" /></th>
						<th><spring:message code="table.startDate" text="default text" /></th>
						<th><spring:message code="table.endDate" text="default text" /></th>
						<th><spring:message code="table.location" text="default text" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pastBookings}" var="item">
						<tr>
							<td>${item.id}</td>
							<td>${item.roomType}</td>
							<td>${item.fromDate}</td>
							<td>${item.toDate}</td>
							<td>${item.location}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>