<!-- 2018-07-05 �̱��� -->
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
			  <h2 id="board_title">���ȸ���Ƿھ�� </h2>
			  <table>
			    <tr id="name">
			      <td class="col1">���̵�</td>
			      <td class="col2"><input type="text" name="id"></td>
			    </tr>
			    <tr id="name">
			      <td class="col1">��й�ȣ</td>
			      <td class="col2"><input type="password" name="pw"></td>
			    </tr>
			    <tr id="subject">
			      <td class="col1">ȸ���</td>
			      <td class="col2"><input type="text" name="companyName"></td>
			    </tr>
			    <tr id="content">
			      <td class="col1">����ڵ�Ϲ�ȣ</td>
			      <td class="col2"><input type="text" name="companyNumber"></td>
			    </tr>
			    <tr id="content">
			      <td class="col1">�Ƿڽ�������</td>
			      <td class="col2"><input type="date" name="beginPeriod"></td>
			    </tr>
			    <tr id="content">
			      <td class="col1">�Ƿ���������</td>
			      <td class="col2"><input type="date" name="endPeriod"></td>
			    </tr>
			     <tr id="content">
			      <td class="col1">��ǰ����</td>
			      <td class="col2"><input type="text" name="goods"></td>
			    </tr>
			     <tr id="content">
			      <td class="col1">�����絵���ð�</td>
			      <td class="col2"><input type="text" name="arrivingTime">��</td>
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
