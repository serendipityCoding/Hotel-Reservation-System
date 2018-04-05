<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Result</title>
</head>
<body>
	<c:forEach items="${roomType}" var="item">
		<form id="roomDetail" action="roomDetail" method="GET">
			<input type="hidden" name="typeID" id="typeID" value="${item.id}">
			<p>${item.type}</p>
			<p>${item.description}</p>
			<p>${item.price}</p>
			<input type="submit" value="View Detail" />
		</form>
	</c:forEach>
</body>
</html>