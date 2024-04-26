<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>ȸ��������ȸ</title>

	<!-- jQuery CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<script type="text/javascript">
		
		//==> �߰��Ⱥκ� : "����" "Ȯ��"  Event ���� �� ó��
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( ".button-container button:contains('Ȯ��')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('Ȯ��')" ).html() );
				history.go(-1);
			});
		 	 
			 $(".button-container button:contains('ȸ����������')").on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('����')" ).html() );
					self.location = "/user/updateUser?userId=${user.userId}"
				});
		});
		
		function ajaxTest(){
			console.log("�׽�Ʈ����");

			var userId = "${user.userId}"
			console.log(userId,'�̰�');
			
			$.ajax({
				url : "/user/json/getUser/"+userId,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {

					//Debug...
					//alert(status);
					//Debug...
					//alert("JSONData : \n"+JSONData);
					console.log("�������ϳ�");
					console.log(JSONData,status)
					var displayValue = "<h3>"
												+"���̵� : "+JSONData.userId+"<br/>"
												+"��  �� : "+JSONData.userName+"<br/>"
												+"�̸��� : "+JSONData.email+"<br/>"
												+"ROLE : "+JSONData.role+"<br/>"
												+"����� : "+JSONData.regDateString+"<br/>"
												+"</h3>";
					//Debug...									
					console.log(displayValue);
					//$("button").remove();
					//$("body").html(displayValue);
				}//success
			})//ajax
		};//ajaxTest

		
	</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/background.jsp" />
<jsp:include page="/layout/toolbar.jsp" />

<div style="width: 70%; margin: 100px auto;">

	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">ȸ��������ȸ</h3>
	       <h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� ��</strong></div>
			<div class="col-xs-8 col-md-4">${user.userName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${user.addr}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�޴���ȭ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${ !empty user.phone ? user.phone : ''}	</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${user.email}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${user.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="button-container container text-right " >

	  			<button type="button" class="btn btn-primary">ȸ����������</button>

	  			<button type="button" class="btn btn-primary">Ȯ��</button>

		</div>
		
		<br/>
		
 	</div>
</div>

</body>

</html>