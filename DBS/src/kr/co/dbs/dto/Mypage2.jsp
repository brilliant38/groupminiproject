<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
</head>
<body>


<form action="<%= request.getContextPath() %>/loginAction.jsp" method="post">
<!-- 	<input type="hidden" name="g_code"> -->	
<input type="hidden" name="m_id" value="<%= userID %>">
	
	
<a href="<%= request.getContextPath() %>/MenberSignUp/UpdateMemberForm.jsp">ȸ����������</a>
<a href="<%= request.getContextPath() %>/MenberSignUp/DeleteMemberForm.jsp">ȸ����������</a>
<a href="<%= request.getContextPath() %>/MenberSignUp/SearchMemberForm.jsp">ȸ�������˻�</a>
</form>
</body>
</html>