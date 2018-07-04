package kr.co.dbs.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	public Connection driverDbcon() throws ClassNotFoundException, SQLException {
		System.out.println("01 드라이버 DB 연결 완료");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/DBS?useUnicode=true&characterEncoding=euckr";
		String dbUser = "DBSID";
		String dbPass = "DBSPW";
		
		
		Connection connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(connection + "<-- connection");
		
		
		return connection;
		
	}

}
