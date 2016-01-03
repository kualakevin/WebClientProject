<%@page import="java.sql.*" %>
<%@page import="Helpers.ConnectionHelper"%>
<%!%>
<html>
	<head>
		<title>Events</title>
		<link rel="icon" href="../images/Shana.ico">
		<jsp:include page="../html/Events.html" />
	</head>
	<body>
	<%
		Connection c = ConnectionHelper.connect();
		String sql_query = "SELECT * FROM events LIMIT 5";
		PreparedStatement stmt = c.prepareStatement(sql_query);
		ResultSet rs = stmt.executeQuery();
	%>
		<div class = "body-wrapper">
			<div class = "table-wrapper" id="table-wrapper">
				<table class="table">
					<tr class = "table-header">
						<td class="table-name-wrapper">Name</td>
						<td class="table-detail-wrapper">Details</td>
						<td class="table-url-wrapper">Link</td>
					</tr>
					<%
						while(rs.next())
						{
					%>
					<tr>
						<td class="table-name-wrapper">
							<div class="table-name"><%=rs.getString("name") %></div>
						</td>
						<td class="table-detail-wrapper">
							<div class="table-detail"><%=rs.getString("details") %></div>
						</td>
						<td class="table-url-wrapper">
							<div class="table-url"><%=rs.getString("signup_url") %></div>
						</td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	<%
		ConnectionHelper.close(c);
	%>
	</body>
</html>
	