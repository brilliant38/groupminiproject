<!-- 2018-07-05 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.dbs.dao.CustomerDao"%>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="c" class="kr.co.dbs.dto.Customer"/>
<jsp:setProperty property="*" name="c"/>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>������ۿ���˻�</title>
		
	</head>
	<body>
		
		<%@ include file="./DomesticDeliveryReservationSearchForm.jsp" %>
		<br>
		
		<%
			
			String cCode = request.getParameter("code");
			
			CustomerDao customerDao = new CustomerDao();
			c = customerDao.domesticDeliveryReservationList(cCode);
			
			
			if(request.getParameter("code") != null) {
				if(c.getM_name() != null) {
		%>
				<table border="1">
					<tr>
						<th>�����ȣ</th>
						<th>�����»��</th>
						<th>�޴»��</th>
						<th>��ǰ��</th>
						<th>��ǰ����</th>
						<th>��ǰ����</th>
						<th>�߼�����</th>
					</tr>
				
					<tr>
						<td><%= c.getC_code()%></td>
						<td><%= c.getM_name()%></td>
						<td><%= c.getC_name()%></td>
						<td><%= c.getC_goods()%></td>
						<td><%= c.getC_goodsnumber()%></td>
						<td><%= c.getC_text()%></td>
						<td><%= c.getC_date()%></td>
					</tr>
				</table>
		<%
				}  else {
					out.println("�����ȣ�� �߸� �Ǿ����ϴ�.");
				}
			}
		%>
	</body>
</html>