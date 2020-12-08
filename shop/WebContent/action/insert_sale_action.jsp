<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
int pro_id = Integer.parseInt(request.getParameter("pro_id"));
int count = Integer.parseInt(request.getParameter("count"));
String date = request.getParameter("date");
int pro_price = 0;
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
	("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
	Statement stmt1 = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	ResultSet pro_price_rs = stmt1.executeQuery("SELECT product.price FROM PRODUCT "+
			"WHERE product.product_id = "+pro_id+" "+
			"GROUP BY product.price");
	if(pro_price_rs.next()){
		pro_price = pro_price_rs.getInt(1);
	}
	
	String query = "INSERT INTO SALE(SALE_ID, PRODUCT_ID, PURCHASE_DATE, SALE_PRICE, AMOUNT) VALUES(sale_SEQ.NEXTVAL, %d, '%s', %d, %d)";
	
	ResultSet rs = stmt2.executeQuery(String.format(query, pro_id, date, pro_price*count, count));
	
	conn.commit();
	
	stmt1.close();
	stmt2.close();
	conn.close();
}
catch (Exception e) {
	e.printStackTrace();
}
response.sendRedirect("../index.jsp?section=insert_sale");
%>