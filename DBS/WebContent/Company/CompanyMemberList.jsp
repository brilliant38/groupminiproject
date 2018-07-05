<!-- 2018-07-05 �̱��� -->
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
		<%
			String id = "id001"; 
			
			CompanyDao companyDao = new CompanyDao();
			ArrayList<Company> list = companyDao.companyMemberList(id);
			System.out.println(list + " : list called");
			
			Company company = new Company();
			
		%>
		<table border="1">
			<tr>
				<th>�� ��ȣ</th>
				<th>ȸ���</th>
				<th>���̵�</th>
				<th>��۽�������</th>
				<th>�������</th>
				<th>�ۼ��ð�</th>
				<th>��ǰ����</th>
				<th>��ǰ��������ð�</th>
			</tr>
		<%	
			for(int i=0; i<list.size(); i++) {
				company = list.get(i);
				if(company.getP_accept().equals("b")) {
		%>	
					<tr>
						<td><%=company.getP_code() %></td>
						<td><%=company.getP_companyName() %></td>
						<td><%=company.getM_id() %></td>
						<td><%=company.getP_beginPeriod() %></td>
						<td><%=company.getP_endPeriod() %></td>
						<td><%=company.getP_date() %></td>
						<td><%=company.getP_goods() %></td>
						<td><%=company.getP_arrivingtime() %></td>
					</tr>
		<%
				}
			}
		%>
		</table>
	</body>
</html>