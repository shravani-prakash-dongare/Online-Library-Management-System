package ConnectionProvider;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProviders {
	
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinelibrary", "root", "shravani");
			System.out.println(con);
			return con;
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR...............!");
		}
		return null;	
	}

}
