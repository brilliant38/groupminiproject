<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.co.dbs.dto.Member" %>
<form action="<%=request.getContextPath() %>/MenberSignUp/SearchMemberAction.jsp" method="post">
	<select name="sk">
		<option value="m_code">코드</option>
		<option value="m_id">아이디</option>
		<option value="m_name">이름</option>
		<option value="m_phone">전화번호</option>
		<option value="m_email">이메일</option>
		<option value="m_gender">성별</option>
		<option value="m_birthDay">생일</option>
		<option value="m_boss">대표성함</option>
		<option value="m_manager">담당자성함</option>
		<option value="m_companyNumber">사업자등륵번호</option>
		</select>
		<input type="text" name="sv">
		<input type="submit" value="검색버튼">
	</form>
