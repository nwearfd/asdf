<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost/xe", "system", "1234");
%>

<script>
	function submit_form() {
		alert("정상적으로 처리되었습니다.")
		document.input_form.submit();
    }
	function reset_form() {
		document.input_form.reset();
	}
</script>
<h3>판매등록</h3>
<form action="action/insert_sale_action.jsp" method="post" name="input_form">
    <table border="1">
        <tr>
            <td> 판매한 상품 </td>
            <td>
            	<select name="pro_id">
					<%
						Statement stmt_shop = conn.createStatement();
						ResultSet rs_shop = stmt_shop.executeQuery("SELECT product_id, name FROM product");
						while (rs_shop.next()) {
							%>
								<option value="<%=rs_shop.getString(1) %>"><%=rs_shop.getString(2) %></option>
							<%
						}
					%>
				</select>
            </td>
        </tr>
        <tr>
            <td> 수량 </td>
            <td><input type="number" name="count"></td>
        </tr>
        <tr>
            <td> 판매날짜 </td>
            <td><input type="date" name="date"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="등록하기" >
                <input type="button" value="다시쓰기" onclick="reset_form()">
            </td>
        </tr>
    </table>
</form>
<%
		stmt_shop.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>