<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Record</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="./resources/js/record.js"></script>
<script>
$(document).ready(function(){
	var name = '<%= session.getAttribute("user") %>';
	if(name==null){
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
</head>
<body>
	<div class="container">
		<div id="contentHeader">
			<h2>GOGO Pikachu</h2>
			<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
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
						<li id="signUpIcon" class="active"><a href="register"><span
								class="glyphicon glyphicon-user"></span> Sign Up</a></li>
						<li id="personalIcon"><a href="record"><span
								class="glyphicon glyphicon-user"></span> Personal</a></li>
						<li id="loginIcon"><a data-toggle="modal"
							data-target="#login"><span class="glyphicon glyphicon-log-in"></span>
								Login </a></li>
						<li id="logoutIcon"><a href="#"><span
								class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					</ul>
				</div>
			</div>
			</nav>
		</div>
		<div id="contentBody">
			<h3>Coming Reservation</h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ID</th>
						<th>Start Date</th>
						<th>End Date</th>
					</tr>
				</thead>
				<c:forEach items="${futureBookings}" var="item">
					<tr>
						<td>${item.roomID}</td>
						<td>${item.fromDate}</td>
						<td>${item.toDate}</td>
						<td><button type="button" class="btn btn-default"
								onclick="showModal({id:${item.id}, fromDate: '${item.fromDate}', toDate: '${item.toDate}'})">Modify</button></td>
					</tr>
				</c:forEach>
			</table>
			<h3>Past Reservation</h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ID</th>
						<th>Start Date</th>
						<th>End Date</th>
					</tr>
				</thead>
				<c:forEach items="${pastBookings}" var="item">
					<tr>
						<td>${item.roomID}</td>
						<td>${item.fromDate}</td>
						<td>${item.toDate}</td>
					</tr>
				</c:forEach>
			</table>
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Order</h4>
						</div>
						<div id="modal-body" class="modal-body">
							<form id="roomSearch" class="form-horizontal" method="POST"
								action="modifySearch">
								<input type="hidden" id="bookingID" />
								<div cssClass="form-group">
									<label cssClass="control-label col-sm-2">Start Date:</label>
									<div id="datepicker1" cssClass="input-group date"
										data-date-format="yyyy-mm-dd">
										<input class="form-control" name="startDate" id="startDate"
											required="required" /> <span class="input-group-addon">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
								</div>
								<div cssClass="form-group">
									<label cssClass="control-label col-sm-2">End Date:</label>
									<div id="datepicker2" cssClass="input-group date"
										data-date-format="yyyy-mm-dd">
										<input class="form-control" name="endDate" id="endDate"
											required="required" /> <span class="input-group-addon">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
								</div>
								<div cssClass="form-group">
									<label path="location" cssClass="control-label col-sm-2">Location:</label>
									<div cssClass="col-sm-10">
										<select path="location" class="form-control" name="location"
											id="location" required="required">
											<option value=""></option>
											<option value="NewYork">New York</option>
											<option value="Shanghai">Shanghai</option>
											<option value="Tokyo">Tokyo</option>
											<option value="London">London</option>
											<option value="Hong Kong">Hong Kong</option>
										</select>
									</div>
								</div>
								<div cssClass="form-group">
									<div cssClass="col-sm-offset-2 col-sm-10">
										<input type="button" id="search" name="search"
											class="btn btn-default" onclick='modifySearch()'
											value="Search" />
									</div>
								</div>
							</form>
							<div id="result"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>