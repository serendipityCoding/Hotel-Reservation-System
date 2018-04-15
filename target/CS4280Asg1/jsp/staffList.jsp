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
<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<title>Staff List</title>
<script>
$(function (){
	$("#toggle-event").change(function(){
		var json={
				id:$(this).val(),
				active:$(this).prop('checked')
		}
		$.ajax({
			type:"POST",
			url:"changeStatus",
			contentType:"application/json",
			dataJSON.stringify(json),
			success:function(data){
				$("#"+id).html("<p>Status Changed</p>");
			},
			error:function(xhr, textStatus, errorThrown) {
				console.log(xhr.statusText);
				console.log(textStatus);
				console.log(errorThrown);
			}
		})
	})
})
</script>
</head>
<body>
	<table class="table">
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
				<tr>
					<th scope="row">${item.id}</th>
					<td>${item.name}</td>
					<td>${item.email}</td>
					<td>${item.lastAccessDate}</td>
					<td>${item.createByName}</td>
					<td><input id="toggle-event" value="${item.id}"
						type="checkbox" checked data-toggle="toggle" data-size="small"
						data-on="Active" data-off="Inactive"></td>
				</tr>
				<tr>
					<div id="${item.id}">
					</div>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>