<!-- 2018-07-05 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.dbs.dao.CompanyDao" %>
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
			p.setM_id(request.getParameter("id"));
			p.setM_pw(request.getParameter("pw"));
			p.setP_companyName(request.getParameter("companyName"));
			p.setM_companyNumber(request.getParameter("companyNumber"));
			p.setP_beginPeriod(request.getParameter("beginPeriod"));
			p.setP_endPeriod(request.getParameter("endPeriod"));
			p.setP_goods(request.getParameter("goods"));
			p.setP_arrivingtime(request.getParameter("arrivingTime"));
		
			CompanyDao companyDao = new CompanyDao();
			companyDao.companyMemberWrite(p);
			
			response.sendRedirect("./CompanyMemberList.jsp"); 
		%>
	</body>
</html>