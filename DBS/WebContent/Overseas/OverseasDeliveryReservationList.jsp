<!-- 2018-07-05 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.dbs.dao.CustomerDao"%>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="o" class="kr.co.dbs.dto.Overseas"/>
<jsp:setProperty property="*" name="o"/>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�ؿܹ�ۿ���˻�</title>
		
	</head>
	<body>
		
		<%@ include file="./OverseasDeliveryReservationSearchForm.jsp" %>
		<br>
		
		<%
			
			String oCode = request.getParameter("code");
			
			CustomerDao customerDao = new CustomerDao();
			o = customerDao.overseasDeliveryReservationList(oCode);
			
			
			if(request.getParameter("code") != null) {
				if(o.getM_name() != null) {
		%>
					<table border="1">
						<tr>
							<th>�����ȣ</th>
							<th>�����»��</th>
							<th>�޴»��</th>
							<th>��ǰ����</th>
							<th>��ǰ����</th>
							<th>��ǰ����</th>
							<th>��ǰ����</th>
							<th>���ҹ��</th>
							<th>�߼�����</th>
						</tr>
					
						<tr>
							<td><%= o.getO_code()%></td>
							<td><%= o.getM_name()%></td>
							<td><%= o.getO_name()%></td>
							<td><%= o.getO_goodstype()%></td>
							<td><%= o.getO_goods()%></td>
							<td><%= o.getO_goodsweight()%></td>
							<td><%= o.getO_goodsnumber()%></td>
							<td><%= o.getO_payment()%></td>
							<td><%= o.getO_date()%></td>
						</tr>
					</table>
		<%
				} else {
					out.println("�����ȣ�� �߸� �Ǿ����ϴ�.");
				}
				
			}
		%>
	</body>
</html>