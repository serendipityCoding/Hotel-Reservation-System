<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<title>GOGO Pikachu | Search</title>
<script>
$(document).ready(function(){
	var name = '<%=session.getAttribute("user")%>';
		if (name == null) {
			$("#loginIcon").show();
			$("#logoutIcon").hide();
		} else {
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
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
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

		<form id="roomSearch">
			<div class="form-group">
				<label>Start Date:</label>
				<div id="datepicker1" class="input-group date"
					data-date-format="mm-dd-yyyy">
					<input class="form-control" name="startDate" id="startDate"
						required /> <span class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>

				</div>
			</div>
			<div class="form-group">
				<label>End Date:</label>
				<div id="datepicker2" class="input-group date"
					data-date-format="mm-dd-yyyy">
					<input class="form-control" name="endDate" id="endDate" required />
					<span class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>


			<div class="form-group">
				<label>Location:</label>
				<div>
					<select class="form-control" name="location" id="location" required>
						<option value=""></option>
						<option value="NewYork">New York</option>
						<option value="Shanghai">Shanghai</option>
						<option value="Tokyo">Tokyo</option>
						<option value="London">London</option>
						<option value="Hong Kong">Hong Kong</option>
					</select>
				</div>
			</div>

		</form>
		<div class="form-group">
			<div>
				<button id="search" name="search" onclick="searchRoom()"
					class="btn btn-default">Search</button>
			</div>
		</div>
		<div id="searchRes">
			<table id="roomList" class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Room Type</th>
						<th scope="col">Price</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</body>
</html>