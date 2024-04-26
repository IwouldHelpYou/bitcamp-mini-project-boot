<!-- �������� �����̷���ȸ ������ �� �� ���� ������ -->

<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>���� �����ȸ</title>

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetUserList() {
		document.detailForm.submit();
	}
</script>

<style>
	/* �Ǹ����� ��ǰ */
	.delivering {
	    
	    background-color: white;
	    animation: blink 2s infinite;
	}
   	
    .delivering:hover {
		animation: none;
    }
    
   	@keyframes blink {
		0% { opacity: 1; }
		50% { opacity: 0.1; }
		100% { opacity: 1; }
	}
</style>

</head>

<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/background.jsp" />
<jsp:include page="/layout/toolbar.jsp" />

<div style="width: 70%; margin: 100px auto;">

<form name="detailForm" action="/listUser.do" method="post">

<tr>
	<td colspan="11">��ü ${result.size()} �Ǽ�, ���� 1 ������</td>
</tr>
<table class="table ">

       <thead>
         <tr>
           <th align="center">No</th>
           <th align="left" >ȸ��ID</th>
           <th align="left">��ǰ��</th>
           <th align="left">�ֹ��ڸ�</th>
           <th align="left">�ֹ�����ȭ��ȣ</th>
           <th align="left">�����Ȳ</th>
           <th align="left">��������</th>
         </tr>
       </thead>
     
	   <tbody>
     	<c:set var="i" value="0"/>
		<c:forEach var="item" items="${result}">
		<c:set var="i" value="${ i+1 }"/>
		<tr class="ct_list_pop ${item.purchaseProd.proTranCode eq '�����' ? 'delivering' : ''}">
			<td align="left">${ i }</td>
			<td align="left">${user.userId}</td>
			<td align="left">${item.purchaseProd.prodName}</td>
			<td align="left">${item.receiverName}</td>
			<td align="left">${item.receiverPhone}</td>
			<td align="left">${item.purchaseProd.proTranCode}</td>
			<td align="left">��������(������)</td>	
		</tr>			
		</c:forEach>	
	   </tbody>	  
</table>


</form>

</div>
