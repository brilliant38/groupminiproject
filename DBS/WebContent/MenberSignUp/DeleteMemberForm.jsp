<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>����â</title>
<script>
var con_test = confirm("�����Ͻðٽ��ϱ�?.");
if(con_test == true){
  document.documentURI("../MenberSignUp/DeleteMemberAction.jsp")
}
else if(con_test == false){
  document.write("��Ҹ� �����̱���.");
}
</script>
</head>
<body>
</body>
</html>
