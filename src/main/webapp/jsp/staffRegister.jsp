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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<link href="./resources/css/staffRegister.css" rel="stylesheet">
<title>GOGO Pikachu|Staff Register</title>
<script type="text/javascript">
	function registerStaff() {
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
			<div class="row">
			<div class="col-md-offset-3 col-md-8">
			
			<form data-toggle="validator" role="form" id="registerStaffForm" class="form-horizontal"
				action="staffRegister" method="POST">
				<h2>Registration Form</h2>
		
				<div class="form-group">
					<label>Username:</label> <input name="username" id="username"
						class="form-control" required />

				</div>
				<div class="form-group">
					<label>Password:</label> <input type="password" name="password"
						id="password" data-minlength="6"  class="form-control" required />
					<div class="help-block">Minimum of 6 characters</div>
					
				</div>
				<div class="form-group">
					<label>Retype Password:</label> <input type="password"
						name="retypePassword" id="retypePassword" class="form-control"
						data-match="#password" data-match-error="Whoops, these don't match"  required />
					<div class="help-block with-errors"></div>
									</div>
				<button type="button" class="btn btn-default"
					onclick="registerStaff()">Register</button>
			</form>
			</div>
			</div>
		</div>
	</div>
</body>
</html>