package Helpers;

import java.sql.*;

public class EventsHelper {
	public static String available( String search_input)
	{
		Connection c = ConnectionHelper.connect();
		String result = "";
		try{
			
		String sql_query = "SELECT name FROM events WHERE name ='" + search_input + "'";
		PreparedStatement stmt = c.prepareStatement(sql_query);
		ResultSet rs = stmt.executeQuery();
		if(search_input == "") return "";
		
		int i = 0;
		while(rs.next()) ++i;
		if(i == 0){
			result= "not available";
		}else{
			result= "available";
		}
		}catch(Exception e)
		{
			result =  "database error";
		}
		
		ConnectionHelper.close(c);
		return result;
	}
	
	public static String search( String search_input)
	{
		Connection c = ConnectionHelper.connect();
		
		String result = "";
		try{
			String sql_query = "SELECT * FROM events WHERE name ='" + search_input + "'";
			PreparedStatement stmt = c.prepareStatement(sql_query);
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
			{
				result =  rs.getString("name") + ";" + rs.getString("details") + ";" + rs.getString("signup_url");
			}
		}catch(Exception e)
		{
			System.out.println("error");
			return "";
		}
		ConnectionHelper.close(c);
		return result;
	}
}
