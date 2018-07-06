package kr.co.dbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.dbs.driverdb.DriverDB;
import kr.co.dbs.dto.Company;

public class CompanyDao {
	
	public void companyMemberAcceptList(String pCode) {
		
		try {
			DriverDB driverDb = new DriverDB();
			Connection connection = driverDb.driverDbcon();
			System.out.println(connection + ": connection called");
			
			String companyMemberAcceptListSql = "UPDATE company SET p_accept='b' where p_code=?";
			PreparedStatement preparedStatementCompanyMemberAcceptList = connection.prepareStatement(companyMemberAcceptListSql);
			preparedStatementCompanyMemberAcceptList.setString(1, pCode);
			
			preparedStatementCompanyMemberAcceptList.executeUpdate();
			
			preparedStatementCompanyMemberAcceptList.close();
			
			connection.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Company> companyMemberList(String id) {
		ArrayList<Company> List = new ArrayList<Company>();
		
		try {
			DriverDB driverDb = new DriverDB();
			Connection connection = driverDb.driverDbcon();
			System.out.println(connection + ": connection called");
			
			String companyMemberListSql = "SELECT p_code, m_id, m_pw, m_companynumber, p_companyname, p_beginperiod, p_endperiod, p_goods, p_arrivingtime, p_date, p_accept FROM company WHERE m_id=?";
			PreparedStatement preparedStatementCompanyMemberList = connection.prepareStatement(companyMemberListSql);
			preparedStatementCompanyMemberList.setString(1, id);
			
			ResultSet resultSetCompanyMemberList = preparedStatementCompanyMemberList.executeQuery();
			
			while(resultSetCompanyMemberList.next()) {
				Company company = new Company();
				company.setP_code(resultSetCompanyMemberList.getInt(1));
				company.setM_id(resultSetCompanyMemberList.getString(2));
				company.setM_pw(resultSetCompanyMemberList.getString(3));
				company.setM_companyNumber(resultSetCompanyMemberList.getString(4));
				company.setP_companyName(resultSetCompanyMemberList.getString(5));
				company.setP_beginPeriod(resultSetCompanyMemberList.getString(6));
				company.setP_endPeriod(resultSetCompanyMemberList.getString(7));
				company.setP_goods(resultSetCompanyMemberList.getString(8));
				company.setP_arrivingtime(resultSetCompanyMemberList.getString(9));
				company.setP_date(resultSetCompanyMemberList.getString(10));
				company.setP_accept(resultSetCompanyMemberList.getString(11));
				List.add(company);
			}
			resultSetCompanyMemberList.close();
			preparedStatementCompanyMemberList.close();
			connection.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return List;
	}
	
	public ArrayList<Company> companyMemberAllList() {
		ArrayList<Company> List = new ArrayList<Company>();
		
		try {
			DriverDB driverDb = new DriverDB();
			Connection connection = driverDb.driverDbcon();
			System.out.println(connection + ": connection called");
			
			String companyMemberAllListSql = "SELECT p_code, m_id, m_pw, m_companynumber, p_companyname, p_beginperiod, p_endperiod, p_goods, p_arrivingtime, p_date, p_accept FROM company";
			PreparedStatement preparedStatementCompanyMemberAllList = connection.prepareStatement(companyMemberAllListSql);
			
			ResultSet resultSetCompanyMemberAllList = preparedStatementCompanyMemberAllList.executeQuery();
			
			while(resultSetCompanyMemberAllList.next()) {
				Company company = new Company();
				company.setP_code(resultSetCompanyMemberAllList.getInt(1));
				company.setM_id(resultSetCompanyMemberAllList.getString(2));
				company.setM_pw(resultSetCompanyMemberAllList.getString(3));
				company.setM_companyNumber(resultSetCompanyMemberAllList.getString(4));
				company.setP_companyName(resultSetCompanyMemberAllList.getString(5));
				company.setP_beginPeriod(resultSetCompanyMemberAllList.getString(6));
				company.setP_endPeriod(resultSetCompanyMemberAllList.getString(7));
				company.setP_goods(resultSetCompanyMemberAllList.getString(8));
				company.setP_arrivingtime(resultSetCompanyMemberAllList.getString(9));
				company.setP_date(resultSetCompanyMemberAllList.getString(10));
				company.setP_accept(resultSetCompanyMemberAllList.getString(11));
				List.add(company);
			}
			
			resultSetCompanyMemberAllList.close();
			preparedStatementCompanyMemberAllList.close();
			connection.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return List;
	}
	
	public void companyMemberWrite(Company company) {
		System.out.println("companyMemberWrite called");
		
		try {
			DriverDB driverDb = new DriverDB();
			Connection connection = driverDb.driverDbcon();
			System.out.println(connection + ": 02 connection called");
			
			//중복방지넘버 조회 쿼리
			String pNumbering = "SELECT substring(p_code,2,10) FROM company";
			PreparedStatement preparedStatementpNumbering = connection.prepareStatement(pNumbering);
			
			ResultSet resultSetpNumbering = preparedStatementpNumbering.executeQuery();
			System.out.println(resultSetpNumbering + " : 01 resultSetpNumbering");
			
			int resultSetpNumber = 0;
			
			if(resultSetpNumbering.next()) {
				resultSetpNumber = 1 + resultSetpNumbering.getInt(1);
			}
			System.out.println(resultSetpNumber + " : 02 resultSetpNumber");
			
			if (resultSetpNumber == 0) {
				resultSetpNumber = 1;
			}
			
			System.out.println(resultSetpNumber + " : 03 resultSetpNumber");
			
			company.setP_code(resultSetpNumber);
			
			String companyMemberWriteSql = "insert into company (p_code, m_id, m_pw, m_companynumber, p_companyname, p_beginperiod, p_endperiod, p_goods, p_arrivingtime, p_date, p_accept) values (?,?,?,?,?,?,?,?,?,now(),0)";
			PreparedStatement prepareStatement = connection.prepareStatement(companyMemberWriteSql);
			prepareStatement.setString(1, "3" + company.getP_code());
			prepareStatement.setString(2, company.getM_id());
			prepareStatement.setString(3, company.getM_pw());
			prepareStatement.setString(4, company.getM_companyNumber());
			prepareStatement.setString(5, company.getP_companyName());
			prepareStatement.setString(6, company.getP_beginPeriod());
			prepareStatement.setString(7, company.getP_endPeriod());
			prepareStatement.setString(8, company.getP_goods());
			prepareStatement.setString(9, company.getP_arrivingtime());
			
			prepareStatement.executeUpdate();
			
			prepareStatement.close();
			
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
