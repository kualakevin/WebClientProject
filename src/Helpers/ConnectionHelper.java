package Helpers;
import java.sql.*;


public class ConnectionHelper {

	public static Connection connect(){
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "");
		}catch(Exception e)
		{
			System.out.println("failed to connect to db");
			throw new Error(e);
		}
		//return null;
	}

	public static boolean close(Connection c){
		try{
			c.close();
			return true;
		}catch(Exception e)
		{
			return false;
		}
	}
}
