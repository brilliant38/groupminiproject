package kr.co.dbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.dbs.driverdb.DriverDB;
import kr.co.dbs.dto.Company;

public class CompanyDao {
	
	public ArrayList<Company> companyMemberList() {
		ArrayList<Company> List = new ArrayList<Company>();
		
		try {
			DriverDB driverDb = new DriverDB();
			Connection connection = driverDb.driverDbcon();
			System.out.println(connection + ": connection called");
			
			String companyMemberListSql = "SELECT p_code, m_id, m_pw, m_companynumber, p_companyname, p_beginperiod, p_endperiod, p_goods, p_arrivingtime, p_date FROM company";
			PreparedStatement preparedStatementCompanyMemberList = connection.prepareStatement(companyMemberListSql);
			
			
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
			
			if(resultSetpNumbering.next()) {
				resultSetpNumbering.getInt(1);
			}
			
			int resultSetpNumber = 1 + resultSetpNumbering.getInt(1);
			company.setP_code(resultSetpNumber);
			
			String companyMemberWriteSql = "insert into company (p_code, m_id, m_pw, m_companynumber, p_companyname, p_beginperiod, p_endperiod, p_goods, p_arrivingtime, p_date) values (?,?,?,?,?,?,?,?,?,now())";
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
