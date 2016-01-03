<%@page import="java.sql.*" %>
<%@page import="Helpers.ConnectionHelper"%>
<html>
	<head>
		<title>Shop</title>
		<link rel="icon" href="../images/Shana.ico">
		<jsp:include page="../html/Shop.html" />
	</head>
	<body>
		<div class="shopping-wrapper">
			<div class="shopping-container">
				<%
					Connection c = ConnectionHelper.connect();
					String sql_query = "SELECT * FROM items";
					PreparedStatement stmt = c.prepareStatement(sql_query);
					ResultSet rs = stmt.executeQuery();
					while(rs.next())
					{
				%>
				<div class="item-wrapper">
					<div class="item">
						<img class="image" src="<%=rs.getString("image")%>" alt="Mountain View"/>
					</div>
					<div class="price-label">
						<div class="price">
							<%=rs.getString("price") %>
						</div>
					</div>
					<div class="add-to-cart">
						<form target="paypal" action="https://www.paypal.com/cgi-bin/webscr" method="post">
							<input type="hidden" name="cmd" value="_s-xclick">
							<input type="hidden" name="hosted_button_id" value="<%=rs.getString("paypal_value")%>">
							<input class="add-to-cart-button" type="submit" name="submit" value="Add To Cart"/>
						</form>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</body>
</html>

