<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/css.css">
<title>asdf</title>
</head>
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	
	<%
	switch(section){
	case "insert_sale":
		%><%@include file="page/insert_sale.jsp" %><%
		break;
	case "select_sales_inquiry":
		%><%@include file="page/select_sales_inquiry.jsp" %><%
		break;
	case "select_sales_status":
		%><%@include file="page/select_sales_status.jsp" %><%
		break;
	case "select_sales_status_category":
		%><%@include file="page/select_sales_status_category.jsp" %><%
		break;
	default:
		%><%@include file="static/index.jsp" %><%
	}
	%>
	
	<%@ include file="static/footer.jsp" %>
</body>
</html>