<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
</head>
<body>
	<form id="booking" action="booking" method="POST">
		<p>${roomDetail.type}</p>
		<p>${roomDetail.size}</p>
		<p>${roomDetail.singleBedNo}</p>
		<p>${roomDetail.doubleBedNo}</p>
		<p>${roomDetail.guestNo}</p>
		<p>${roomDetail.hasRefrigerator}</p>
		<p>${roomDetail.hasLivingRoom}</p>
		<p>${roomDetail.hasWIFI}</p>
		<p>${roomDetail.hasParkingLot}</p>
		<p>${roomDetail.description}</p>
		<p>${roomDetail.price}</p>
		<input type="submit" value="Add to Cart"/>
	</form>
</body>
</html>