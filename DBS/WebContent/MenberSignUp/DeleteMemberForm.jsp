<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>자바스크립트</title>

<script>
<%
String send_id = request.getParameter("send_id");
System.out.println(send_id +  "<-send_id DELETEMEmberForm체크");
%>
var con_test = confirm("삭제 하시겟습니까?.");
if(con_test == true){
	location.href="../MenberSignUp/DeleteMemberAction.jsp"; 
}
else if(con_test == false){
  document.write("취소합니다.");
}
</script>
</head>
<body>
</body>
</html>
