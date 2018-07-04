package kr.co.dbs.dao;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.dbs.driverdb.DriverDB;
import kr.co.dbs.dto.Member;

public class MemberDao {
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet  resultset = null;
	public void memberDelete(String m) throws ClassNotFoundException, SQLException {
		System.out.println("3 memberDelete체크");
		DriverDB db = new DriverDB();
		connection = db.driverDbcon();
		preparedStatement = connection.prepareStatement(
				"Delete FFOM member WHERE m_id=?");
		System.out.println(preparedStatement + "<-- pstmt 1");
		preparedStatement.setString(1, m);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
				
	}
	public Member memberUpdateSelect(String mid) throws ClassNotFoundException, SQLException {
		System.out.println("03 memberUpdateSelect");
		Member m = null;
		DriverDB db = new DriverDB();
		connection = db.driverDbcon();
		preparedStatement = connection.prepareStatement("select * from member where m_id=?");
		preparedStatement.setString(1, mid);
		resultset = preparedStatement.executeQuery();
		if(resultset.next()) {
			m = new Member();
			m.setM_code(resultset.getInt("m_code"));
			m.setM_id(resultset.getString("m_id"));
			m.setM_pw(resultset.getString("m_pw"));
			m.setM_name(resultset.getString("m_name"));
			m.setM_phone(resultset.getString("m_phone"));
			m.setM_address(resultset.getString("m_address"));
			m.setM_email(resultset.getString("m_email"));
			m.setM_bankAccount(resultset.getInt("m_bankAccount"));
			m.setM_cardNumber(resultset.getInt("m_cardNumber"));
			m.setM_gender(resultset.getString("m_gender"));
			m.setM_birthDay(resultset.getString("m_birthDay"));
			m.setM_boss(resultset.getString("m_boss"));
			m.setM_manager(resultset.getString("m_manager"));
			m.setM_companyNumber(resultset.getInt("m_companyNumber"));
		}
		return null;
		
		
		
	}
	
	public void memberUpdate(Member m) throws ClassNotFoundException, SQLException {
		System.out.println("02 memberUpdate체크");
		DriverDB db = new DriverDB();
		connection = db.driverDbcon();
		preparedStatement = connection.prepareStatement("UPDATE member SET m_code=?,m_pw=?,m_name=?,m_phone=?,m_address=?,m_email=?,m_bankAccount=?,m_cardNumber=?,m_gender=?,m_birthDay=?,m_boss=?,m_manager=?,m_companyNumber=? WHERE m_id=?");
		preparedStatement.setInt(1, m.getM_code());
		preparedStatement.setString(2, m.getM_pw());
		preparedStatement.setString(3, m.getM_name());
		preparedStatement.setString(4, m.getM_phone());
		preparedStatement.setString(5, m.getM_address());
		preparedStatement.setString(6, m.getM_email());
		preparedStatement.setInt(7, m.getM_bankAccount());
		preparedStatement.setInt(8, m.getM_cardNumber());
		preparedStatement.setString(9, m.getM_gender());
		preparedStatement.setString(10, m.getM_birthDay());
		preparedStatement.setString(11, m.getM_boss());
		preparedStatement.setString(12, m.getM_manager());
		preparedStatement.setInt(13, m.getM_companyNumber());
		preparedStatement.setString(14, m.getM_id());
		
		preparedStatement.executeUpdate();
		
		preparedStatement.close();
		connection.close();
	}
	public void memberInsert(Member m) throws ClassNotFoundException, SQLException {
		System.out.println("01 memberInsert체크");
		DriverDB db = new DriverDB();
		connection = db.driverDbcon();
		System.out.println(connection +"<-02 memberInsert체크2");
		
		
		
		
		preparedStatement = connection.prepareStatement(
			"INSERT INTO member VALUES(? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,now() ,? ,? ,?)");
		preparedStatement.setInt(1, m.getM_code());
		preparedStatement.setString(2, m.getM_id());
		preparedStatement.setString(3, m.getM_pw());
		preparedStatement.setString(4, m.getM_name());
		preparedStatement.setString(5, m.getM_phone());
		preparedStatement.setString(6, m.getM_address());
		preparedStatement.setString(7, m.getM_email());
		preparedStatement.setInt(8, m.getM_bankAccount());
		preparedStatement.setInt(9, m.getM_cardNumber());
		preparedStatement.setString(10, m.getM_gender());
		preparedStatement.setString(11, m.getM_birthDay());
		preparedStatement.setString(12, m.getM_boss());
		preparedStatement.setString(13, m.getM_manager());
		preparedStatement.setInt(14, m.getM_companyNumber());
		
		preparedStatement.executeUpdate();
		
		preparedStatement.close();
		connection.close();
	}
	
}