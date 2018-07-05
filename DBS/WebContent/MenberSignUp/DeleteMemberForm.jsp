<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>삭제창</title>
<script>
var con_test = confirm("삭제하시겟습니까?.");
if(con_test == true){
  document.documentURI("../MenberSignUp/DeleteMemberAction.jsp")
}
else if(con_test == false){
  document.write("취소를 누르셨군요.");
}
</script>
</head>
<body>
</body>
</html>
