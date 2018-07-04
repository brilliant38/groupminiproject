<!-- 2018-07-04 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>해외배송예약</title>
	</head>
	<body>
		<form action="./DomesticDeliveryReservationAction.jsp" method="post">
			<table border="1">
				<tr>
					<th>보내는사람이름</th>
					<td><input type="text" name="sendName"></td>
				</tr>
				<tr>
					<th>보내는사람주소</th>
					<td><input type="text" name="sendAddress"></td>
				</tr>
				<tr>
					<th>보내는사람연락처</th>
					<td><select name = "sendPhone1">
							<option>선택</option>
							<option>010</option>
							<option>016</option>
							<option>017</option>
						</select>
						<input type="text" name="sendPhone2">
					</td>
				</tr>
				<tr>
					<th>받는사람이름</th>
					<td><input type="text" name="receiveName"><input type="hidden" name="localoverseas" value="국내"></td>
				</tr>
				<tr>
					<th>받는사람주소</th>
					<td><input type="text" name="receiveAddress"></td>
				</tr>
				<tr>
					<th>받는사람연락처</th>
					<td><select name = "receivePhone1">
							<option>선택</option>
							<option>010</option>
							<option>016</option>
							<option>017</option>
						</select>
						<input type="text" name="receivePhone2">
					</td>
				</tr>
				<tr>
					<th>받는사람이메일</th>
					<td><input type="text" name="receiveEmail1"> @ <input type="text" name="receiveEmail2"></td>
				</tr>
				<tr>
					<th>물품중량</th>
					<td><input type="text" name="goodsWeight">kg</td>
				</tr>
				<tr>
					<th>상품종류</th>
					<td>
						<select name="goodsType">
							<option>품목선택</option>
							<option>1.의류</option>
							<option>2.서류</option>
							<option>3.가전제품류</option>
							<option>4.과일류</option>
							<option>5.곡물류</option>
							<option>6.한약류</option>
							<option>7.식품류</option>
							<option>8.잡화</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>상품갯수</th>
					<td><input type="text" name="goodsNumber">개</td>
				</tr>
				<tr>
					<th>상품설명</th>
					<td><input type="text" name="goodsText"></td>
				</tr>
				<tr>
					<th>결제방식</th>
					<td><input type="radio" name="payment" value="선불">선불<input type="radio" name="payment" value="후불">후불</td>
				</tr>
				<tr>	
					<td colspan="2"><input type="submit" value="예약"></td>
				</tr>
			</table>
		</form>
	</body>
</html>