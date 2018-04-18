<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="./resources/css/staffRegister.css" rel="stylesheet">
<title>Staff Register</title>
<script type="text/javascript">
	function registerStaff() {
		if ($("#retypePassword").val() == $("#password").val()) {
			$("#pwAlert").hide();
		} else {
			$("#pwAlert").show();
		}
		var json = {
			username : $("#username").val(),
			password : $("#password").val(),
			employeeID : '${employeeID}'
		};
		$.ajax({
			type : $("#registerStaffForm").attr("method"),
			url : $("#registerStaffForm").attr("action"),
			contentType : "application/json",
			dataType : 'JSON',
			data : JSON.stringify(json),
			success : function(data) {
				alert("Register successfully!");
				window.location.href = 'staffLogin';
			},
			error : function(xhr, textStatus, errorThrown) {
				console.log(xhr.statusText);
				console.log(textStatus);
				console.log(errorThrown);
			}
		});
	}
</script>
</head>
<body>
	<div class="container">
		<div id="contentBody">
			<h2>Registration Form</h2>
			<form id="registerStaffForm" class="form-horizontal"
				action="staffRegister" method="POST">
				<div class="form-group">
					<label>Username:</label> <input name="username" id="username"
						class="form-control" required />

				</div>
				<div class="form-group">
					<label>Password:</label> <input type="password" name="password"
						id="password" class="form-control" required />

				</div>
				<div class="form-group">
					<label>Retype Password:</label> <input type="password"
						name="retypePassword" id="retypePassword" class="form-control"
						required />
					<div class="form-control-feedback" id="pwAlert">Password does
						not match!</div>
					<script>
						$("#retypePassword").on(
								"change",
								function() {
									if ($("#retypePassword").val() != $(
											"#password").val()) {
										$("#pwAlert").show();
									} else {
										$("#pwAlert").hide();
									}
								})
					</script>
				</div>
				<button type="button" class="btn btn-default"
					onclick="registerStaff()">Register</button>
			</form>
		</div>
	</div>
</body>
</html>