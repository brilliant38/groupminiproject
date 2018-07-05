<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html >
<%@ page import = "kr.co.dbs.dao.MemberDao"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.co.dbs.dto.Member" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table width="100%" border="1">
<tr>
	<td>코드</td>
	<td>아이디</td>
	<td>이름</td>
	<td>전화번호</td>
	<td>주소</td>
	<td>이메일</td>
	<td>성별</td>
	<td>생일</td>
	<td>수정</td>
	<td>삭제</td>
</tr>

<%
request.setCharacterEncoding("euc-kr");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<-- sk");
System.out.println(sv + "<-- sv");

MemberDao memberdao = new MemberDao();
ArrayList<Member> get_alm = memberdao.memberSearch(sk, sv);
for(int i=0;i<get_alm.size();i++){
	Member m  = get_alm.get(i);

%>
	<tr>
		<td><%= m.getM_id() %></td>
		<td><%= m.getM_name() %></td>
		<td><%= m.getM_phone() %></td>
		<td><%= m.getM_address() %></td>
		<td><%= m.getM_email() %></td>
		<td><%= m.getM_gender() %></td>
		<td><%= m.getM_birthDay() %></td>
			<td>	
		<a href="../MenberSignUp/UpdateMemberForm.jsp?send_id=<%= m.getM_id() %>">수정버튼</a>			
	</td>
	<td>
		<a href="../MenberSignUp/DeleteMemberForm.jsp?send_id=<%= m.getM_id() %>">삭제버튼</a>			
	</td>
	
	
	</tr>
	<%}
%>
</table>


</body>
</html>