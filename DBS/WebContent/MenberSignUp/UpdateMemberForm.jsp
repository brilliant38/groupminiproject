<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.co.dbs.dao.MemberDao" %>
<%@ page import = "kr.co.dbs.dto.Member" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
String send_id = request.getParameter("send_id");
System.out.println(send_id +  "<-send_id üũ"); 
MemberDao memberdao = new MemberDao();
Member m = memberdao.memberUpdateSelect(send_id);
System.out.println(m+"<-m");
String dbid = m.getM_id();
System.out.print(dbid + "<-dbiddnfpfpfpfpfpf");
String dbpw = m.getM_pw();
String dbname = m.getM_name();
String dbphone =m.getM_phone();
String dbaddress = m.getM_address();
String dbemail = m.getM_email();
int dbbankAccount = m.getM_bankAccount();
int dbcardNumber = m.getM_cardNumber();
String dbgender = m.getM_gender();
String dbbirthday = m.getM_birthDay();
String dbboss = m.getM_boss();
String dbmanager = m.getM_manager();
int dbcompanyNumber = m.getM_companyNumber();
%>

<form action="../MenberSignUp/UpdateMemberAction.jsp" method="post">
<table border="1">
<tr>
	<td>���̵�</td>
	<td><input type="text" name="m_id" size="20"value="<%=dbid %>" readonly></td>
</tr>
<tr>
	<td>��й�ȣ</td>
	<td><input type="password" name="m_pw" size="20"value="<%=dbpw %>"></td>
</tr>
<tr>
	<td>�̸�</td>
	<td><input type="text" name="m_name" size="20"value="<%=dbname %>"></td>
</tr>
<tr>
	<td>��ȭ��ȣ</td>
	<td><input type="text" name="m_phone" size="20"value="<%=dbphone %>"></td>
</tr>
<tr>
	<td>�ּ�</td>
	<td><input type="text" name="m_address" size="20"value="<%=dbaddress %>"></td>
</tr>
<tr>
	<td>�̸���</td>
	<td><input type="text" name="m_email" size="20"value="<%=dbemail %>"></td>
</tr>
<tr>
	<td>�������</td>
	<td><input type="text" name="m_bankAccount" size="20"value="<%=dbbankAccount %>"></td>
</tr>
<tr>
	<td>ī���ȣ</td>
	<td><input type="text" name="m_cardNumber" size="20"value="<%=dbcardNumber %>"></td>
</tr>
<tr>
	<td>����</td>
	<td><input type="radio" name="m_gender" value="male"size="20"value="<%=dbgender %>">��
		<input type="radio" name="m_gender" value="female"size="20"value="<%=dbgender %>">��</td>
</tr>
<tr>
	<td>����</td>
	<td><input type="date" name="m_birthDay" size="20"value="<%=dbbirthday %>"></td>
</tr>

<tr>
	<td>��ǥ����</td>
	<td><input type="text" name="m_boss" size="20"value="<%=dbboss %>"></td>
</tr>
<tr>
	<td>����ڼ���</td>
	<td><input type="text" name="m_manager" size="20"value="<%=dbmanager %>"></td>
</tr>
<tr>
	<td>����ڵ��ȣ</td>
	<td><input type="text" name="m_companyNumber" size="20"value="<%=dbcompanyNumber %>"></td>
</tr>
<tr>
	<td colspan="4"><input type="submit" value="ȸ��������ư"></td>
</tr>
</table>
</form>
</body>
</html>