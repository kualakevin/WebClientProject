package Helpers;
import java.sql.*;

public class ArchiveHelper {
	public static String search(String name, String year, String season)
	{
		Connection c = ConnectionHelper.connect();
		String result = "";
		try{
			if(!name.equals("")) name="name='"+name+"'";
			else name="name LIKE '%'";
			if(!year.equals("")) year="year='"+year+"'";
			else year="year LIKE '%'";
			if(!season.equals("")) season="season='"+season+"'";
			else season="season LIKE '%'";
			String sql_query = 
					"SELECT * " +
					"FROM archives " +
					"WHERE "+ name + " AND " + year + " AND " + season;
			PreparedStatement stmt = c.prepareStatement(sql_query);
			ResultSet rs = stmt.executeQuery();
			while(rs.next())
			{
				result = result + rs.getString("filename")+";";
			}
		}catch(Exception e)
		{
			result =  "database error";
		}
		
		ConnectionHelper.close(c);
		return result;
	}
}


