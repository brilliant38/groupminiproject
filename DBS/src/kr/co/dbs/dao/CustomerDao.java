/*2018-07-04 이광재*/
package kr.co.dbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.dbs.driverdb.DriverDB;
import kr.co.dbs.dto.Customer;
import kr.co.dbs.dto.Member;

public class CustomerDao {
	
	public void insertOverseasDeliveryReservation(Customer customer, Member member) {
		
	}
	
	//국내배송예약 테이블에 예약 정보 1행을 추가하는 메소드
	public void insertDomesticReservation(Customer customer, Member member) {
		System.out.println("01 insertReservation 호출완료");
		
		try {
			DriverDB driverDb = new DriverDB();
			Connection connection = driverDb.driverDbcon();
			System.out.println(connection + ": 02 connection 호출완료");

			
			//중복방지넘버 조회 쿼리
			String cNumbering = "SELECT max(c_code) FROM customer";
			PreparedStatement preparedStatementcNumbering = connection.prepareStatement(cNumbering);
			
			ResultSet resultSetcNumbering = preparedStatementcNumbering.executeQuery();
			
			
			if(resultSetcNumbering.next()) {
				resultSetcNumbering.getInt(1);
			}
			
			int cNumber = 1 + resultSetcNumbering.getInt(1);
			System.out.println(cNumber);
			
			
			//배송 예약 정보 입력 쿼리문 작성
			String insertReservationSql = "insert into customer (m_name, m_address, m_phone, c_localoverseas, c_name, c_address, c_phone, c_mail, c_weight, c_goods, c_goodsnumber, c_text, c_date, c_payment) values (?,?,?,?,?,?,?,?,?,?,?,?,now(),?)";
			PreparedStatement preparedStatementInsertReservation = connection.prepareStatement(insertReservationSql);
			preparedStatementInsertReservation.setString(1, member.getM_name() + cNumber);
			preparedStatementInsertReservation.setString(2, member.getM_address());
			preparedStatementInsertReservation.setString(3, member.getM_phone());
			preparedStatementInsertReservation.setString(4, customer.getC_localoverseas() + cNumber);
			preparedStatementInsertReservation.setString(5, customer.getC_name() + cNumber);
			preparedStatementInsertReservation.setString(6, customer.getC_address() + cNumber);
			preparedStatementInsertReservation.setString(7, customer.getC_phone());
			preparedStatementInsertReservation.setString(8, customer.getC_mail());
			preparedStatementInsertReservation.setInt(9, customer.getC_weight());
			preparedStatementInsertReservation.setString(10, customer.getC_goods() + cNumber);
			preparedStatementInsertReservation.setInt(11, customer.getC_goodsnumber());
			preparedStatementInsertReservation.setString(12, customer.getC_text());
			preparedStatementInsertReservation.setString(13, customer.getC_payment());
			
			//쿼리문 실행
			preparedStatementInsertReservation.executeUpdate();
			
			//연결 종료
			preparedStatementInsertReservation.close();
			
			connection.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
}
