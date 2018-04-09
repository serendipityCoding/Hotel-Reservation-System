<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#startDate").datepicker({
			minDate : new Date(),
			dateFormat: "yy-mm-dd"
		});
		$("#endDate").datepicker({
			maxDate : new Date().setDate(new Date().getDate() + 90),
			dateFormat: "yy-mm-dd",
			useCurrent : false,
		});
		$('#startDate').on('dp.change', function(e) {
			$('#endDate').data('DatePicker').minDate(e.date);
			$('#endDate').data('DatePicker').maxDate(m);
		});
	});
</script>
</head>
<body>
	<div class="container">
		<form:form id="roomSearch" cssClass="form-horizontal"
			modelAttribute="criteria" action="searchProcess" method="post">
			<div class="form-group">
				<form:label path="startDate" cssClass="control-label col-sm-2">Start Date:</form:label>
				<div id="datepicker1" class="input-group date"
					data-date-format="mm-dd-yyyy">
					<form:input path="startDate" cssClass="form-control"
						name="startDate" id="startDate" required="required" />
					<span class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>

				</div>
			</div>
			<div class="form-group">
				<form:label path="endDate" cssClass="control-label col-sm-2">End Date:</form:label>
				<div id="datepicker2" class="input-group date"
					data-date-format="mm-dd-yyyy">
					<form:input path="endDate" cssClass="form-control" name="endDate"
						id="endDate" required="required" />
					<span class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>


			<div class="form-group">
				<form:label path="location" cssClass="control-label col-sm-2">Location:</form:label>
				<div class="col-sm-10">
					<form:select path="location" cssClass="form-control" name="location"
						id="location" required="required" >
						<form:option value=""></form:option>
						<form:option value="NewYork">New York</form:option>
						<form:option value="Shanghai">Shanghai</form:option>
						<form:option value="Tokyo">Tokyo</form:option>
						<form:option value="London">London</form:option>
						<form:option value="Hong Kong">Hong Kong</form:option>
					</form:select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<form:button id="search" name="search" class="btn btn-default">Search</form:button>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>