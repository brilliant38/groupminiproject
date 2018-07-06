<!-- 28기 구해성 2018-07-04 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MemberInsertForm</title>
</head>
<body>
<form action="../MenberSignUp/InsertMemberAction.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="m_id" size="20"></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="password" name="m_pw" size="20"></td>
</tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="m_name" size="20"></td>
</tr>
<tr>
	<td>전화번호</td>
	<td><input type="text" name="m_phone" size="20"></td>
</tr>
<tr>
	<td>주소</td>
	<td><input type="text" name="m_address" size="20"></td>
</tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="m_email" size="20"></td>
</tr>
<tr>
	<td>은행계좌</td>
	<td><input type="text" name="m_bankAccount" size="20"></td>
</tr>
<tr>
	<td>카드번호</td>
	<td><input type="text" name="m_cardNumber" size="20"></td>
</tr>
<tr>
	<td>성별</td>
	<td><input type="radio" name="m_gender" value="male"size="20">남
		<input type="radio" name="m_gender" value="female"size="20">여</td>
</tr>
<tr>
	<td>생일</td>
	<td><input type="date" name="m_birthDay" size="20"></td>
</tr>

<tr>
	<td>대표성함</td>
	<td><input type="text" name="m_boss" size="20"></td>
</tr>
<tr>
	<td>담당자성함</td>
	<td><input type="text" name="m_manager" size="20"></td>
</tr>

<tr>
	<td>사업자등록번호</td>
	<td><input type="text" name="m_companyNumber" size="20"></td>
</tr>
<tr>
	<td colspan="4"><input type="submit" value="회원가입버튼"></td>
</tr>
</table>
</form>
</body>
</html>