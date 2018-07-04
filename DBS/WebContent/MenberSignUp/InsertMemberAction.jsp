<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.co.dbs.dao.MemberDao" %>

<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="m" class="kr.co.dbs.dto.Member"/>
<jsp:setProperty name="m" property="*"/>
<%
MemberDao memberdao = new MemberDao();
memberdao.memberInsert(m);
response.sendRedirect(request.getContextPath() + "/MenberSignUp/MyPage.jsp");
%>