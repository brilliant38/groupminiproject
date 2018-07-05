<!-- 2018-07-05 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.dbs.dao.CompanyDao" %>
<%@ page import = "kr.co.dbs.dto.Company" %>
<%@ page import = "java.util.ArrayList" %>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="p" class="kr.co.dbs.dto.Company"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>CompanyMemberList</title>
	</head>
	<body>
		<table>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		<%
			CompanyDao companyDao = new CompanyDao();
			ArrayList<Company> company = companyDao.companyMemberList();
			System.out.println(company + " : company called");
			
			for(int i=0; i<company.size(); i++) {
		%>
			
		
		
		<%
			}
		%>
		</table>
	</body>
</html>