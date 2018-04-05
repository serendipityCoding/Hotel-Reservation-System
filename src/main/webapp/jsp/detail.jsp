<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
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
	<form:form id="booking" modelAttribute="order" action="booking" method="POST">
		<form:input type="hidden" path="price" name="price" id="price" value="${roomDetail.price}"/>
		<form:input type="hidden" path="roomType" name="roomType" id="roomType" value="${roomDetail.type}"/>
		<form:input type="hidden" path="fromDate" name="fromDate" id="fromDate" value="${startDate}"/>
		<form:input type="hidden" path="toDate" name="toDate" id="toDate" value="${endDate}"/>
		<form:input type="hidden" path="location" name="location" id="location" value="${location}"/>		
		<form:select path="roomCount" name="roomCount" id="roomCount" required="required">
			<c:forEach var="i" begin="1" end="${maxAvailRoom}">
				<form:option value="${i}">${i}</form:option>
			</c:forEach>
		</form:select> 
		<input type="submit" value="Add to Cart" />
	</form:form>
</body>
</html>