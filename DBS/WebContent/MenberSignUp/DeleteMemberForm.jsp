<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>�ڹٽ�ũ��Ʈ</title>

<script>
<%
String send_id = request.getParameter("send_id");
System.out.println(send_id +  "<-send_id DELETEMEmberFormüũ");
%>
var con_test = confirm("���� �Ͻðٽ��ϱ�?.");
if(con_test == true){
	location.href="../MenberSignUp/DeleteMemberAction.jsp"; 
}
else if(con_test == false){
  document.write("����մϴ�.");
}
</script>
</head>
<body>
</body>
</html>
