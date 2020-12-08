<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>SELECT</h3>
<table border="1">
  <tr>
    <th>상품명</th>
    <th>총 판매 금액</th>
    <th>판매 개수</th>
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
		String query = "SELECT category.name, SUM(sale.sale_price) ,SUM(SALE.AMOUNT) "+
				"FROM SALE, PRODUCT, CATEGORY "+
				"WHERE category.category_id = product.category_id "+
				"AND product.product_id = sale.product_id "+
				"GROUP BY category.name, category.category_id "+
				"ORDER BY category.category_id";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
				out.print("<tr>");
				out.print("<td>"+ rs.getString(1) + "</td>");
				out.print("<td>"+ rs.getInt(2) + "</td>");
				out.print("<td>"+ rs.getInt(3) + "</td>");
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