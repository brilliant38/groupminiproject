<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.co.dbs.dao.MemberDao"%>
<%

String send_id = request.getParameter("send_id");
System.out.println(send_id + "<-- send_id");
MemberDao memberdao = new MemberDao();
memberdao.memberDelete(send_id);
response.sendRedirect(request.getContextPath() + "./MenberSignUp/MyPage.jsp");
%>