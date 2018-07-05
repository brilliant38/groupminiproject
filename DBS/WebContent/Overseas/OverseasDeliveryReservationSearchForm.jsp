<!-- 2018-07-05 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>해외배송예약검색</title>
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
		<h3>해외배송예약검색</h3>
		<form action="./OverseasDeliveryReservationList.jsp" method="post">
			<div>
				<input type = "text" name="code" placeholder="검색어 입력">
				<button type = "submit">검색</button>
			</div>
		</form>
	
	</body>
</html>