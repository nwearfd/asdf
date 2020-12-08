<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>SELECT</h3>
<table border="1">
  <tr>
    <th>판매 ID</th>
    <th>상품명</th>
    <th>구매 일자</th>
    <th>총 구매 금액</th>
    <th>구매 개수</th>
  </tr>

<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
		if (conn != null) {
			System.out.println("Database Connected!");
		}
		else {
			System.out.println("Database Connect Fail!");
		}
		Statement stmt = conn.createStatement();
		String query = "SELECT SALE.SALE_ID, PRODUCT.NAME, sale.purchase_date, sale.sale_price, SALE.AMOUNT FROM SALE, PRODUCT "+
						"WHERE sale.product_id = product.product_id";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
				out.print("<tr>");
				out.print("<td>"+ rs.getInt(1) + "</td>");
				out.print("<td>"+ rs.getString(2) + "</td>");
				out.print("<td>"+ rs.getString(3) + "</td>");
				out.print("<td>"+ rs.getInt(4) + "</td>");
				out.print("<td>"+ rs.getInt(5) + "</td>");
				out.print("</tr>");
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>