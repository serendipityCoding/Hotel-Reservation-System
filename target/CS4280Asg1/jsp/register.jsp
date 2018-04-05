<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Registration</title>
</head>
<body>
	<div class="container">
		<form:form id="regForm" cssClass="form-horizontal"
			modelAttribute="user" action="registerProcess" method="post">
			<div class="form-group">
				<form:label path="email" cssClass="control-label col-sm-2">Email:</form:label>
				<div class="col-sm-10">
					<form:input path="email" name="email" id="email" cssClass="form-control" required="required"/>
				</div>
			</div>
			<div class="form-group">
				<form:label path="username" cssClass="control-label col-sm-2">Username:</form:label>
				<div class="col-sm-10">
					<form:input path="username" name="username" id="username" cssClass="form-control" required="required"/>
				</div>
			</div>
			<div class="form-group">
				<form:label path="password" cssClass="control-label col-sm-2">Password:</form:label>
				<div class="col-sm-10">
					<form:password path="password" name="password" id="password" cssClass="form-control" required="required"/>
				</div>
			</div>
			<div class="form-group">
				<form:label path="firstname" cssClass="control-label col-sm-2">FirstName:</form:label>
				<div class="col-sm-10">
					<form:input path="firstname" name="firstname" id="firstname" cssClass="form-control" required="required"/>
				</div>
			</div>
			<div class="form-group">
				<form:label path="lastname" cssClass="control-label col-sm-2">LastName:</form:label>
				<div class="col-sm-10">
					<form:input path="lastname" name="lastname" id="lastname" cssClass="form-control" required="required"/>
				</div>
			</div>
			<div class="form-group">
				<form:label path="address" cssClass="control-label col-sm-2">Address:</form:label>
				<div class="col-sm-10">
					<form:input path="address" name="address" id="address" cssClass="form-control"/>
				</div>
			</div>
			<div class="form-group">
				<form:label path="phone" cssClass="control-label col-sm-2">Phone:</form:label>
				<div class="col-sm-10">
					<form:input path="phone" name="phone" id="phone" cssClass="form-control" required="required"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<form:button id="register" name="register" class="btn btn-default">Register</form:button>
					<a href="home.jsp">Home</a>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>