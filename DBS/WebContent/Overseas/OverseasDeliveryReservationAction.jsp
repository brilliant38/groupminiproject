<!-- 2018-07-04 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�ؿܹ�ۿ���</title>
	</head>
	<body>
		<form action="./DomesticDeliveryReservationAction.jsp" method="post">
			<table border="1">
				<tr>
					<th>�����»���̸�</th>
					<td><input type="text" name="sendName"></td>
				</tr>
				<tr>
					<th>�����»���ּ�</th>
					<td><input type="text" name="sendAddress"></td>
				</tr>
				<tr>
					<th>�����»������ó</th>
					<td><select name = "sendPhone1">
							<option>����</option>
							<option>010</option>
							<option>016</option>
							<option>017</option>
						</select>
						<input type="text" name="sendPhone2">
					</td>
				</tr>
				<tr>
					<th>�޴»���̸�</th>
					<td><input type="text" name="receiveName"><input type="hidden" name="localoverseas" value="����"></td>
				</tr>
				<tr>
					<th>�޴»���ּ�</th>
					<td><input type="text" name="receiveAddress"></td>
				</tr>
				<tr>
					<th>�޴»������ó</th>
					<td><select name = "receivePhone1">
							<option>����</option>
							<option>010</option>
							<option>016</option>
							<option>017</option>
						</select>
						<input type="text" name="receivePhone2">
					</td>
				</tr>
				<tr>
					<th>�޴»���̸���</th>
					<td><input type="text" name="receiveEmail1"> @ <input type="text" name="receiveEmail2"></td>
				</tr>
				<tr>
					<th>��ǰ�߷�</th>
					<td><input type="text" name="goodsWeight">kg</td>
				</tr>
				<tr>
					<th>��ǰ����</th>
					<td>
						<select name="goodsType">
							<option>ǰ����</option>
							<option>1.�Ƿ�</option>
							<option>2.����</option>
							<option>3.������ǰ��</option>
							<option>4.���Ϸ�</option>
							<option>5.���</option>
							<option>6.�Ѿ��</option>
							<option>7.��ǰ��</option>
							<option>8.��ȭ</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>��ǰ����</th>
					<td><input type="text" name="goodsNumber">��</td>
				</tr>
				<tr>
					<th>��ǰ����</th>
					<td><input type="text" name="goodsText"></td>
				</tr>
				<tr>
					<th>�������</th>
					<td><input type="radio" name="payment" value="����">����<input type="radio" name="payment" value="�ĺ�">�ĺ�</td>
				</tr>
				<tr>	
					<td colspan="2"><input type="submit" value="����"></td>
				</tr>
			</table>
		</form>
	</body>
</html>