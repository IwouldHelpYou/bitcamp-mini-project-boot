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
    <title>��ǰ ��� �Ϸ�</title>
    <style>
        body {
            background-color: lavender;
            font-family: Arial, sans-serif;
        }
        .message-container {
            margin-top: 200px;
        }
        .message {
            font-size: 36px;
            color: lightyellow;
        }
        .product-info {
            font-size: 24px;
            color: darkblue;
            margin-top: 20px;
        }
    </style>
    
   	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
    
</head>
<body>

<jsp:include page="/layout/toolbar.jsp" />
<jsp:include page="/layout/background.jsp" />

<div style="width: 70%; margin: 100px auto;">
	<div class="message-container">
	    <div class="message" style="display:flex; align-itmes:center; justify-content:center;">
	        ��ǰ ����� �Ϸ�Ǿ����ϴ�!
	    </div>
	    <!-- 
	    <div class="product-info">
	        ��ǰ��: ${productVO.getProdName()} <br>
	        ��ǰ����: ${productVO.getProTranCode()}
	    </div>
	     -->
	</div>
</div>

</body>
</html>	