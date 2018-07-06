<!-- 2018-07-05 ÀÌ±¤Àç -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.dbs.dao.CompanyDao" %>
<%@ page import = "kr.co.dbs.dto.Company" %>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="p" class="kr.co.dbs.dto.Company"></jsp:useBean>
<jsp:setProperty property="*" name="p"/>
<!DOCTYPE html>

<% 
	String pCode = request.getParameter("pCode");
	System.out.println(pCode + " : pCode");
	
	CompanyDao companyDao = new CompanyDao();
	companyDao.companyMemberAcceptList(pCode);
	
	
	response.sendRedirect("./CompanyMemberAllList.jsp");
	
%>