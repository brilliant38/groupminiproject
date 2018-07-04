<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet"  href="css/bootstrap.css">
<title>(스마트 택배)글 목록 </title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
<nav class="navbar navbar-default">
  <div class="navbar-header">
<button type="button" class="navbar-toggle collapsed"
  data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
  aria-expanded="false">
</button>
<a class="navbar-brand" href="main"><font face="바탕체">(주)스마트 택배</font></a>
</div>
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
</ul>
<ul class="nav navbar-nav navbar-right">
	<li class="dropdown">
	<li><a href="main.jsp"> <font color="red"> <font face="바탕체">Home</font></font></a><li>
	<li><a href="B1.jsp">   <font color="red"><font face="바탕체">Services</font></font></a><li>
	<li><a href="B2.jsp">	<font color="red"><font face="바탕체">Portfolio</font></font></a></li>
	<li><a href="B3.jsp">	<font color="red"><font face="바탕체">About</font></font></a><li>
	<li><a href="B4.jsp">	<font color="red"><font face="바탕체">Contact</font></font></a><li>
	<li><a href="B5.jsp">	<font color="red"><font face="바탕체">|</font></font></a><li>
</ul>
</div>
</nav>
<div class ="container"></div>
<div class="row">
	<form method="post" action="writeAction.jsp">
	<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
<thead>
<tr>
<th colspan="2" style="background-color: #eeeeee; text-align:center;">(스마트 택배 글쓰기)</th>
</tr>
</thead>
<tbody>
<tr>
	<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
</tr>
<tr>
	<td><textarea  class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style= "height: 350px;"></textarea></td>
</tr>
</tbody>
</table>
	<a class="btn btn-primary pull-right">글쓰기</a>
</form>
</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
