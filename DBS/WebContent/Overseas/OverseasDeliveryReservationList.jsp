<!-- 2018-07-05 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.dbs.dao.CustomerDao"%>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="o" class="kr.co.dbs.dto.Overseas"/>
<jsp:setProperty property="*" name="o"/>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>해외배송예약검색</title>
		
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
							<th>송장번호</th>
							<th>보내는사람</th>
							<th>받는사람</th>
							<th>상품종류</th>
							<th>상품내용</th>
							<th>상품무게</th>
							<th>상품갯수</th>
							<th>지불방식</th>
							<th>발송일자</th>
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
					out.println("송장번호가 잘못 되었습니다.");
				}
				
			}
		%>
	</body>
</html>