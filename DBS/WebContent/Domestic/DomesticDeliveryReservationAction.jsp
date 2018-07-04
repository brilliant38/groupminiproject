<!-- 2018-07-04 ÀÌ±¤Àç -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.co.dbs.dao.CustomerDao"%>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="c" class="kr.co.dbs.dto.Customer"/>
<jsp:setProperty property="*" name="c"/>

<jsp:useBean id="m" class="kr.co.dbs.dto.Member"/>
<jsp:setProperty property="*" name="m"/>
<!DOCTYPE html>
<html>
	<%
		m.setM_name(request.getParameter("sendName"));
		m.setM_address(request.getParameter("sendAddress"));
		m.setM_phone(request.getParameter("sendPhone1") +request.getParameter("sendPhone2"));
		c.setC_localoverseas(request.getParameter("localoverseas"));
		c.setC_name(request.getParameter("receiveName"));
		c.setC_address(request.getParameter("receiveAddress"));
		c.setC_phone(request.getParameter("receivePhone1") + "-" + request.getParameter("receivePhone2"));
		c.setC_mail(request.getParameter("receiveEmail1") + "@" +request.getParameter("receiveEmail2"));
		c.setC_weight(Integer.parseInt(request.getParameter("goodsWeight")));
		c.setC_goods(request.getParameter("goodsType"));
		c.setC_goodsnumber(Integer.parseInt(request.getParameter("goodsNumber")));
		c.setC_text(request.getParameter("goodsText"));
		c.setC_payment(request.getParameter("payment"));
		
		System.out.println(c.getC_phone() + " : c.getC_phone() È®ÀÎ");
		
		CustomerDao customerDao = new CustomerDao();
		customerDao.insertDomesticReservation(c, m);
		
		response.sendRedirect("../Index.jsp");
	%>
</html>