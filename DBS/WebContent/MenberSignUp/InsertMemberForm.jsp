<!-- 28�� ���ؼ� 2018-07-04 -->
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
	<td>���̵�</td>
	<td><input type="text" name="m_id" size="20"></td>
</tr>
<tr>
	<td>��й�ȣ</td>
	<td><input type="password" name="m_pw" size="20"></td>
</tr>
<tr>
	<td>�̸�</td>
	<td><input type="text" name="m_name" size="20"></td>
</tr>
<tr>
	<td>��ȭ��ȣ</td>
	<td><input type="text" name="m_phone" size="20"></td>
</tr>
<tr>
	<td>�ּ�</td>
	<td><input type="text" name="m_address" size="20"></td>
</tr>
<tr>
	<td>�̸���</td>
	<td><input type="text" name="m_email" size="20"></td>
</tr>
<tr>
	<td>�������</td>
	<td><input type="text" name="m_bankAccount" size="20"></td>
</tr>
<tr>
	<td>ī���ȣ</td>
	<td><input type="text" name="m_cardNumber" size="20"></td>
</tr>
<tr>
	<td>����</td>
	<td><input type="radio" name="m_gender" value="male"size="20">��
		<input type="radio" name="m_gender" value="female"size="20">��</td>
</tr>
<tr>
	<td>����</td>
	<td><input type="date" name="m_birthDay" size="20"></td>
</tr>

<tr>
	<td>��ǥ����</td>
	<td><input type="text" name="m_boss" size="20"></td>
</tr>
<tr>
	<td>����ڼ���</td>
	<td><input type="text" name="m_manager" size="20"></td>
</tr>

<tr>
	<td>����ڵ�Ϲ�ȣ</td>
	<td><input type="text" name="m_companyNumber" size="20"></td>
</tr>
<tr>
	<td colspan="4"><input type="submit" value="ȸ�����Թ�ư"></td>
</tr>
</table>
</form>
</body>
</html>