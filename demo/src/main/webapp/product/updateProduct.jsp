<!-- ��ǰ���� ���� Ŭ���ϸ� �����ϴ� ������ -->
<!--  updateProductViewAction ���� �դ���� -->

<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>��ǰ��������</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="/css/my.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	
	$(function(){

	    console.log($("#button-group"));
	    $("#button-group").find("button").on("click" , function() {
	        console.log("�����Ϸ���");
	        fncUpdateProduct();
	    });
	    
	    function fncUpdateProduct() {
	        var name = $('form input[name="prodName"]').val();
	        
	        if(name == null || name.length < 1){
	            alert("null ó�� ���� ���� �ȵ�!");
	            return;
	        }
	        
	        $('form[name="detailForm"]').attr("method" , "POST").attr("action" , "/product/updateProduct").submit();
	    }
	    
	    function check_email(frm) {
	        alert; // �� �κ��� � �ǵ��� �ۼ��Ǿ����� Ȯ���� �ʿ��մϴ�.
	        
	        var email = $('form input[name="email"]').val();
	        
	        if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)){
	            alert("�̸��� ������ �ƴմϴ�.");
	            return false;
	        }
	        return true;
	    }
	    
	    function resetData() {
	        $('form[name="detailForm"]')[0].reset();
	    }
	});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">	

<jsp:include page="/layout/toolbar.jsp" />
<jsp:include page="/layout/background.jsp" />

<div style="width: 70%; margin: 100px auto;">

<form name="detailForm" method="post">

<input type="hidden" name="prodNo" value="${ProductVO.getProdNo()}">

<!-- ��� ��� -->

	<div class="container">
	
		<!-- ��� ��� -->
		<div class="page-header">
	       <h3 class=" text-info">��ǰ������ȸ</h3>
	       <h5 class="text-muted">��ǰ ������ <strong class="text-danger">������Ʈ</strong>�� �ּ���.</h5>
	    </div>
		
		<!-- ��ǰ��ȣ -->
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" name="prodNo" value="${ProductVO.getProdNo()}" readonly></div>
		</div>				
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" name="prodName" value="${ProductVO.getProdName()}"></div>
		</div>

		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ�̹���</strong></div>
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
			<div class="col-xs-8 col-md-4"><input type="text" name="prodDetail" value="${ProductVO.getProdDetail()}"></div>
		</div>

		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" name="manuDate" value="${ProductVO.getRegDate()}"></div>
		</div>

		<hr/>
			
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" name="price" value="${ProductVO.getPrice()}"></div>
		</div>	

		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" name="regDate" value="${ProductVO.getRegDate()}"></div>
		</div>	

		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ����</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" name="proTranCode" value="${ProductVO.getProTranCode()}"></div>
		</div>	

	</div>

	<div class="container text-right" id="button-group">
        <button type="button" class="btn btn-primary">
            ����
        </button>
        <button type="button" class="btn btn-secondary" onclick="javascript:history.go(-1)">
            ����
        </button>
	</div>

</form>

</div>

</body>
</html>
