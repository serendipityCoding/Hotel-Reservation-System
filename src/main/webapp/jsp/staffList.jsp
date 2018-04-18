<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script src="<c:url value="/resources/js/staffList.js"/>"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<link href="<c:url value="/resources/css/staffList.css" />"
	rel="stylesheet">
<title>GOGO Pikachu|Staff|Staff List</title>
<script>
$(document).ready(function() {
    $('#staffList').DataTable();
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
					<li class="active"><a href="">Room</a></li>
					<li><a href="userList">User</a></li>
					<li><a href="#">Personal</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="staffLogout"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
		</div>
		</nav>
		<h2>Hotel Manager List</h2>
		<button type="button" class="btn btn-default" data-toggle="modal"
			data-target="#addManager" id="addButton">Add Manager</button>
		<!-- Modal -->
		<div class="modal fade" id="addManager" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Hotel Manager Registration</h4>
					</div>
					<div class="modal-body">
						<form id="managerRegistration" action="addManager" method="POST">
							<div class="form-group">
								<label for="employeeID">Employee ID:</label> <input type="text"
									class="form-control" id="employeeID" required>
							</div>
							<div class="form-group">
								<label for="email">Email address:</label> <input type="email"
									class="form-control" id="email" required>
							</div>
							<div class="form-group">
								<label for="name">Name:</label> <input type="text"
									class="form-control" id="name" required>
							</div>
							<button type="button" class="btn btn-default"
								onclick="addManager()">Submit</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<table id="staffList" class="table table-hover">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Last Access Time</th>
					<th scope="col">Created By</th>
					<th scope="col">Active Status</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${staffList}" var="item">
					<tr class="staff">
						<th scope="row">${item.id}</th>
						<td>${item.name}</td>
						<td>${item.email}</td>
						<td>${item.lastAccessDate}</td>
						<td>${item.createByName}</td>
						<td id="status"><input id="status${item.id}"
							value="${item.id}" type="checkbox" data-toggle="toggle"
							data-size="small" data-on="Active" data-off="Inactive"
							class="toggle-event"> <script>
							$(function() {								
								if (${item.isActive} == 1) {								
									$('#status'+${item.id}).bootstrapToggle('on');
								} 
								else {
									$('#status'+${item.id}).bootstrapToggle('off')
								}
							});
						</script></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>