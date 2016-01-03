<%@page import="Helpers.ConnectionHelper"%>
<%@page import="java.sql.*" %>
<html>
	<head>
		<title>Signin</title>
		<link rel="icon" href="../images/Shana.ico">
		<jsp:include page="../html/SignIn.html" />
	</head>
	<body>
		<% 
			Connection c = ConnectionHelper.connect();
			if(request.getParameter("button") != null && request.getParameter("button").equals("register"))
			{
				if(request.getParameter("email") != null && request.getParameter("password") != null)
				{
					PreparedStatement stmt = c.prepareStatement("INSERT INTO users (email, password) VALUES ('"+
					request.getParameter("email")+"', '"+ request.getParameter("password") +"')");
					try{
					 stmt.execute();
					}catch (Exception e)
					{
						//the email provided already has a registered account.
					}
				}
			}
			if(request.getParameter("button") != null && request.getParameter("button").equals("signin"))
			{
				if(request.getParameter("email") != null && request.getParameter("password") != null)
				{
					String sql = "Select * " +
								 "FROM users " +
								 "WHERE email = '" + request.getParameter("email") + 
								 	"' AND password = '" + request.getParameter("password") + "'";
					PreparedStatement stmt = c.prepareStatement(sql);
					ResultSet rs = stmt.executeQuery();
					int i =0;
					while(rs.next()) ++i;
					if(i == 0)
					{
						//account with that combination does not exist
					}else
					{
						//sign in success, redirect to home page.
						response.sendRedirect("Home.jsp");
					}
				}
			}
			//System.out.println(request.getQueryString());
			ConnectionHelper.close(c);
		%>
	</body>
</html>
