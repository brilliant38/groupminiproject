<!-- 2018-07-05 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�ؿܹ�ۿ���˻�</title>
		<style>
			input:-ms-input-placeholder {
				color:#a8a8a8;
			}
			input:-webkit-input-placeholder {
				color:#a8a8a8;
			}
			input:-moz-input-placeholder {
				color:#a8a8a8;
			}
			div {
				height:40px;
				width:300px;
				border:1px solid #1b5ac2;
				background: #ffffff;
			}
			input {
				font-size:16px;
				width:225px;
				padding:10px;
				border:0px;
				outline:none;
				float:left;
			}
			button {
				width:50px;
				height:100%;
				border:0px;
				background:#1b5ac2;
				outline:none;
				float:right;
				color:#ffffff;
			}
		</style>
	</head>
	<body>
		<h3>�ؿܹ�ۿ���˻�</h3>
		<form action="./OverseasDeliveryReservationList.jsp" method="post">
			<div>
				<input type = "text" name="code" placeholder="�˻��� �Է�">
				<button type = "submit">�˻�</button>
			</div>
		</form>
	
	</body>
</html>