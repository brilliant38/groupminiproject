<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>자바스크립트</title>
<script>
var con_test = confirm("어떤 값이 나올까요. 확인을 눌러보세요.");
if(con_test == true){
  document.write("확인을 누르셨군요");
}
else if(con_test == false){
  document.write("취소를 누르셨군요.");
}
</script>
</head>
<body>
</body>
</html>
