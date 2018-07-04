package kr.co.dbs.dao;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.co.dbs.driverdb.DriverDB;
import kr.co.dbs.dto.Member;

public class MemberDao {
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	
//01 insertAction

	public void memberInsert(Member m) throws ClassNotFoundException, SQLException {
		System.out.println("01 memberInsert체크");
		DriverDB db = new DriverDB();
		connection = db.driverDbcon();
		System.out.println(connection +"<-02 memberInsert체크2");
		preparedStatement = connection.prepareStatement(
			"INSERT INTO member VALUES(? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,?,? )");
		preparedStatement.setInt(1, m.getM_code());
		preparedStatement.setString(2, m.getM_id());
		preparedStatement.setString(3, m.getM_pw());
		preparedStatement.setString(4, m.getM_name());
		preparedStatement.setInt(5, m.getM_phone());
		preparedStatement.setString(6, m.getM_address());
		preparedStatement.setString(7, m.getM_email());
		preparedStatement.setInt(8, m.getM_bankAccount());
		preparedStatement.setInt(9, m.getM_cardNumber());
		preparedStatement.setString(10, m.getM_gender());
		preparedStatement.setString(11, m.getM_birthDay());
		preparedStatement.setString(12, m.getM_date());
		preparedStatement.setString(13, m.getM_boss());
		preparedStatement.setString(14, m.getM_manager());
		preparedStatement.setInt(15, m.getM_companyNumber());
		
		preparedStatement.executeUpdate();
		
		preparedStatement.close();
		connection.close();
	}
	
}