<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.co.dbs.dto.Member" %>
<form action="<%=request.getContextPath() %>/MenberSignUp/SearchMemberAction.jsp" method="post">
	<select name="sk">
		<option value="m_code">�ڵ�</option>
		<option value="m_id">���̵�</option>
		<option value="m_name">�̸�</option>
		<option value="m_phone">��ȭ��ȣ</option>
		<option value="m_email">�̸���</option>
		<option value="m_gender">����</option>
		<option value="m_birthDay">����</option>
		<option value="m_boss">��ǥ����</option>
		<option value="m_manager">����ڼ���</option>
		<option value="m_companyNumber">����ڵ��ȣ</option>
		</select>
		<input type="text" name="sv">
		<input type="submit" value="�˻���ư">
	</form>
