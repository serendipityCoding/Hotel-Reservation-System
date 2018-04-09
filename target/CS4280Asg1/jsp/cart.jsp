<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" language="javascript"
	src="http://www.technicalkeeda.com/js/javascripts/plugin/jquery.js"></script>
<script type="text/javascript"
	src="http://www.technicalkeeda.com/js/javascripts/plugin/json2.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<title>Shopping Cart</title>
<script type="text/javascript">
	function checkout() {
		var checkOutItems = [];
		$("input.checkout:checked").each(function() {
			checkOutItems.push($.parseJSON($(this).attr('data-value')));
		});
		console.log(checkOutItems);
		$.ajax({
			type : $("#ordersForm").attr("method"),
			url : $("#ordersForm").attr("action"),
			contentType: "application/json",
			dataType : 'JSON',
			data : JSON.stringify(checkOutItems),
			success : function(data) {
				alert("Make reservation successfully!");
			},
			error : function(xhr, textStatus, errorThrown) {
				alert(xhr.statusText);
				console.log(textStatus);
			}
		});
	}
</script>
</head>
<body>
	<form id="ordersForm" action="checkout" method="POST">
		<c:forEach items="${sessionScope.orders}" var="order">
			<input type="checkbox" name="checkOutItems[]" class="checkout" id="checkOutItems"
				data-value='{"fromDate":"${order.fromDate}", "toDate":"${order.toDate}", "roomType":"${order.roomType}", "location":"${order.location}",  "roomCount":${order.roomCount},  "price":${order.price}}'>
			Start: ${order.fromDate} End: ${order.toDate} Location: ${order.location} Room Type: ${order.roomType} Total rooms: ${order.roomCount}
			<br>
		</c:forEach>
		<input type="button" value="Checkout" onclick='checkout()' />
	</form>
</body>
</html>