<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%-- EL/jSTl ��ȯ
<%@ page import="com.model2.mvc.service.product.vo.*" %>
    
<% 
	ProductVO vo = (ProductVO)request.getAttribute("productVO");
%>
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/layout/background.jsp" />

/paymentView.jsp

���� �������� �� �߰� ...
form ����post ��û���� ������

--> /purchase/payment ���� �����

<br></br>${productVO.getProdName()}
	</br>${productVO.getProTranCode()}
</body>
</html>