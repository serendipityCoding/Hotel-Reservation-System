<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="./resources/css/general.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="./resources/js/roomList.js"></script>
<title>GOGO Pikachu|Staff|Room List</title>
<script>
$(document).ready(function() {
    $('#roomList').DataTable();
} );
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
				<a class="navbar-brand" href="#">Staff</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="roomList">Room</a></li>
					<li><a href="userList">User</a></li>
					<li><a href="#">Personal</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="staffLogin"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
		</div>
		</nav>
		<div id="contentHeader">
			<h2>Room List</h2>
		</div>
		<div id="contentBody">
			<table id="roomList" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Room No</th>
						<th>Floor</th>
						<th>Room Type</th>
						<th>Location</th>
						<th>Active Status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${roomList}" var="item">
						<tr>
							<th>${item.id}</th>
							<td>${item.roomID}</td>
							<td>${item.floorNo}</td>
							<td>${item.roomType}</td>
							<td>${item.location}</td>
							<td id="status" value="${item.isActive}"><input id="status${item.id}"
							value='${item.id}' type="checkbox" data-toggle="toggle"
							data-size="small" data-on="Active" data-off="Inactive"
							class="toggle-event" 
								${item.isActive==1?"checked":''}>			
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>