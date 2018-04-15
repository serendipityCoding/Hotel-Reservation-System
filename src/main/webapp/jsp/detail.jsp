<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" language="javascript"
	src="http://www.technicalkeeda.com/js/javascripts/plugin/jquery.js"></script>
<script type="text/javascript"
	src="http://www.technicalkeeda.com/js/javascripts/plugin/json2.js"></script>
<title>Detail</title>
<script type="text/javascript">
function addToCart() {
		var order={
				"fromDate":$("#fromDate").val(),
				"toDate":$("#toDate").val(),
				"location": $("#location").val(),
				"roomType":$("#type").val(),
				"roomCount":parseInt($("#roomCount").val()),
				"price":parseFloat($("#price").val())
		}
		$.ajax({
			type : $("#booking").attr( "method"),
			contentType: "application/json",
			dataType : 'JSON',
			url : $("#booking").attr( "action"),
			data :JSON.stringify(order),
			cache : false,
			success : function(response) {
				alert(JSON.parse(response).message);
				var url = "<%=request.getContextPath()%>/search";
				window.location.replace(url);
			},
			error : function(xhr, textStatus, errorThrown) {
				alert(JSON.stringify(order));
				console.log(xhr.statusText);
				console.log(textStatus);

			}
		});
	}
</script>
</head>
<body>
	<p>${roomDetail.type}</p>
	<p>${roomDetail.price}</p>
	<p>${roomDetail.size}</p>
	<p>${roomDetail.singleBedNo}</p>
	<p>${roomDetail.doubleBedNo}</p>
	<p>${roomDetail.guestNo}</p>
	<p>${roomDetail.hasRefrigerator}</p>
	<p>${roomDetail.hasLivingRoom}</p>
	<p>${roomDetail.hasWIFI}</p>
	<p>${roomDetail.hasParkingLot}</p>
	<p>${roomDetail.description}</p>
	<p>${maxAvailRoom}</p>
	<p>${startDate}</p>
	<p>${endDate}</p>
	<p>${location}</p>
	<form id="booking" action="booking" method="POST">
		<input type="hidden" value="${roomDetail.type}" id="type" /> 
		<input type="hidden" value="${roomDetail.price}" id="price" /> <input
			type="hidden" value="${startDate}" id="fromDate" /> <input
			type="hidden" value="${endDate}" id="toDate" /> <input type="hidden"
			value="${location}" id="location" /> <select path="roomCount"
			name="roomCount" id="roomCount" required="required">
			<c:forEach var="i" begin="1" end="${maxAvailRoom}">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select> <input type="button" value="Add to Cart" onclick='addToCart()' />
	</form>
</body>
</html>