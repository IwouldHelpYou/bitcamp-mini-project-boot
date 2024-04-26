<!--  listProduct ���� /getProduct.do?userId ������ getProductAction.java ���� ��-->
<!-- ��ǰ Ŭ������ �� ������ ���� ������ -->

<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- EL / JSTL �������� �ּ� ó�� 

	<%@ page import="com.model2.mvc.service.product.vo.*" %>
	<%@ page import="com.model2.mvc.service.domain.*" %>
	<%
		ProductVO vo=(ProductVO)request.getAttribute("vo"); //��ȸ��
		System.out.println("/readProduct.jsp");
	
		// ���� 
		User currentSession = (User)session.getAttribute("user");
		if(currentSession != null){
			System.out.println("session -> "+currentSession.toString());
		}
	%>

--%>

<html>
<head>
	<title>��������ȸ</title>

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<link rel="stylesheet" href="/css/my.css" type="text/css">
	
	<html>
	

<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title>
</head>

<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/toolbar.jsp" />
<jsp:include page="/layout/background.jsp" />

<div style="width: 70%; margin: 100px auto;">

<form name="detailForm" method="post">
	
	<div class="container">
	
		<!-- ��� ��� -->
		<div class="page-header">
	       <h3 class=" text-info">��ǰ������ȸ</h3>
	       <h5 class="text-muted">��ǰ ������ <strong class="text-danger">������Ʈ</strong>�� �ּ���.</h5>
	    </div>
		
		<!-- ��ǰ��ȣ -->
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${vo.getProdNo()}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${vo.getProdName()}</div>
		</div>

		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ�̹���</strong></div>
			<!-- 
				<img width="30%" height="30%" src="/images/fileInputStorage/${images[0].getImage()}"/>
				<img width="30%" height="30%" src="/images/fileInputStorage/${images[1].getImage()}"/>
				<img width="30%" height="30%" src="/images/fileInputStorage/${images[2].getImage()}"/>
				<img width="30%" height="30%" src="/images/fileInputStorage/${images[3].getImage()}"/>
			-->
			<br/>
			&nbsp;
			<c:forEach var="imagehana" items="${images}" varStatus="loop">
				<!-- el ���� getImage ���ϰ� �ٷ� image ���� -->
		       	<img width="30%" height="30%" src="/images/fileInputStorage/${imagehana.image}"/>
		    </c:forEach>
		</div>

		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${vo.getProdDetail()}</div>
		</div>

		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${vo.getRegDate()}</div>
		</div>

		<hr/>
			
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${vo.getPrice()}</div>
		</div>	

		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${vo.getRegDate()}</div>
		</div>	

		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ����</strong></div>
			<div class="col-xs-8 col-md-4">${vo.getProTranCode()}</div>
		</div>	

	</div>
		
	<div class="container text-right">
	    <div class="row">
				<!-- ���� ��ư -->
	            <c:if test="${sessionScope != null && sessionScope.user.userId.contains('user')}">								
	                <button type="button" class="btn btn-primary" style="margin-right: 10px;" onclick="location.href='/purchase/execPurchase?prodNo=${vo.getProdNo()}'">����</button>
	            </c:if>
	            
	            <!-- ���� ��ư -->
	            <c:if test="${sessionScope != null && sessionScope.user.userId.equals('admin')}">								
	                <button type="button" class="btn btn-primary" style="margin-right: 10px;" onclick="location.href='/product/updateProduct?prodNo=${vo.getProdNo()}'">����</button>
	            </c:if>

	            <!-- ���� ��ư -->
	            <c:if test="${sessionScope == null || !sessionScope.User.userId().equals('admin')}">
	                <button type="button" class="btn btn-secondary" onclick="javascript:history.go(-1)">����</button>
	            </c:if>

	    </div>
	</div>

</form>

</div>

</body>
</html>