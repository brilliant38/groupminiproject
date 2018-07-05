<!-- 2018-07-05 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.dbs.dao.CustomerDao"%>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="c" class="kr.co.dbs.dto.Customer"/>
<jsp:setProperty property="*" name="c"/>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>국내배송예약검색</title>
		
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
						<th>송장번호</th>
						<th>보내는사람</th>
						<th>받는사람</th>
						<th>상품명</th>
						<th>상품갯수</th>
						<th>상품내용</th>
						<th>발송일자</th>
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
					out.println("송장번호가 잘못 되었습니다.");
				}
			}
		%>
	</body>
</html>