<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/staffLogin.css">
<link href="./resources/css/general.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>GOGO Pikachu|Staff Login</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-8">
				<form:form id="loginForm" cssClass="form-horizontal"
					modelAttribute="staffLogin" action="staff" method="post">
					<div class="form-group">
						<form:label path="username" cssClass="control-label col-sm-2">Username: </form:label>
						<div class="col-sm-10">
							<form:input path="username"
								cssClass="form-control input-sm chat-input" name="username"
								id="username" required="required" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="password" cssClass="control-label col-sm-2">Password:</form:label>
						<div class="col-sm-10">
							<form:password path="password"
								cssClass="form-control input-sm chat-input" name="password"
								id="password" required="required" />
						</div>
					</div>
					<div class="form-group">
						<form:label path="role" cssClass="control-label col-sm-2">Role:</form:label>
						<div class="col-sm-10">
							<form:label path="role" cssClass="radio-inline">
								<input type="radio" path="role" name="role" value="2"
									checked="checked">
						Hotel Manager
					</form:label>
							<form:label path="role" cssClass="radio-inline">
								<input type="radio" path="role" name="role" value="1">
						Chief Manager
					</form:label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<form:button id="login" name="login" class="btn btn-default">Login</form:button>
							<a href="home.jsp" class="btn btn-default">Home</a>
						</div>
					</div>
				</form:form>
			</div>
			<table align="center">
				<tr>
					<td style="font-style: italic; color: red;">${message}</td>
				</tr>
			</table>

		</div>
	</div>

</body>