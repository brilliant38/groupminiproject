<!-- 2018-07-05 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>CompanyMemberWrite</title>
		<link rel="stylesheet" type="text/css" href="../css/board_write_main.css">
	</head>
	<body>
		<form action="./CompanyMemberWriteAction.jsp" method="post">
			<section id="main">
			  <h2 id="board_title">기업회원의뢰양식 </h2>
			  <table>
			    <tr id="name">
			      <td class="col1">아이디</td>
			      <td class="col2"><input type="text" name="id"></td>
			    </tr>
			    <tr id="name">
			      <td class="col1">비밀번호</td>
			      <td class="col2"><input type="password" name="pw"></td>
			    </tr>
			    <tr id="subject">
			      <td class="col1">회사명</td>
			      <td class="col2"><input type="text" name="companyName"></td>
			    </tr>
			    <tr id="content">
			      <td class="col1">사업자등록번호</td>
			      <td class="col2"><input type="text" name="companyNumber"></td>
			    </tr>
			    <tr id="content">
			      <td class="col1">의뢰시작일자</td>
			      <td class="col2"><input type="date" name="beginPeriod"></td>
			    </tr>
			    <tr id="content">
			      <td class="col1">의뢰종료일자</td>
			      <td class="col2"><input type="date" name="endPeriod"></td>
			    </tr>
			     <tr id="content">
			      <td class="col1">상품종류</td>
			      <td class="col2"><input type="text" name="goods"></td>
			    </tr>
			     <tr id="content">
			      <td class="col1">희망기사도착시간</td>
			      <td class="col2"><input type="text" name="arrivingTime">시</td>
			    </tr>
			  </table>
			  <div id="buttons">
			  	<input TYPE="IMAGE" src="../image/ok.png" name="Submit" value="Submit">
			    <a href="./CompanyMemberList.jsp"><img src="../image/list.png"></a>
			  </div>
			</section>
		</form>
		<div class="clear"></div>
	</body>
</html>
