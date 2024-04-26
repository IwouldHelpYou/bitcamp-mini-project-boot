
<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title>

<script type="text/javascript" src="../javascript/calendar.js">
</script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">

var userId = '${user.userId}';
var proTranCode = '${product.proTranCode}';
var prodNo = '${product.prodNo}';

function fncAddPurchase() {
	console.log('post ����')

    $("input[name='buyer.userId']").val(userId);
	$("input[name='purchaseProd.proTranCode']").val(proTranCode);
	$("input[name='purchaseProd.prodNo']").val(prodNo);
	
    //$('input[name=buyer.userId]').val(userId);
    //$('input[name=purchaseProd.proTranCode]').val(proTranCode);
    
    
	//form �����Ϳ��� ������ ������ Ȯ�ο�
	var formData = $('form').serializeArray();
	for (var i = 0; i < formData.length; i++) {
	    console.log("�����µ�����", formData[i].name, formData[i].value);
	}
    
	console.log("form", $('form'));
	$('form').submit();
	//document.addPurchase.submit();
	
    };

</script>
</head>

<body>

<jsp:include page="/layout/background.jsp" />
<jsp:include page="/layout/toolbar.jsp" />

<!-- buyer �� tranCode�� null ��  
User buyer�� userId / ProductVO purchaseProd �� ProdNo�� �����;���
-->


<div style="width: 70%; margin: 100px auto;">

<form name="addPurchase" method="post" action="/purchase/execPurchase">

	<div class="container">
	
	<input type="hidden" name="buyer.userId" value="" /> 
	<input type="hidden" name="purchaseProd.prodNo" value="" />
	<input type="hidden" name="purchaseProd.proTranCode" value="" />
	
	<!-- ��ǰ ���Ž�û -->
	<div class="page-header">
       <h3 class=" text-info">��ǰ������ȸ</h3>
       <h5 class="text-muted">��ǰ ������ <strong class="text-danger">������Ʈ</strong>�� �ּ���.</h5>
    </div>
	
	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
		<div class="col-xs-8 col-md-4">${product.getProdNo()}</div>
	</div>	

	<hr/>
	
	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
		<div class="col-xs-8 col-md-4">${product.getProdName()}</div>
	</div>

	<hr/>
	
	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>��ǰ������</strong></div>
		<div class="col-xs-8 col-md-4">${product.getProdDetail()}</div>
	</div>

	<hr/>
	
	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
		<div class="col-xs-8 col-md-4">${product.getRegDate()}</div>
	</div>

	<hr/>
	
	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
		<div class="col-xs-8 col-md-4">${product.getPrice()}</div>
	</div>	

	<hr/>
	
	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>�������</strong></div>
		<div class="col-xs-8 col-md-4">${product.getRegDate()}</div>
	</div>	
		
	<hr/>

	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>�����ھ��̵�</strong></div>
		<div class="col-xs-8 col-md-4">${user.userId}</div>
	</div>	
		
	<hr/>

    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>���Ź��</strong></div>
        <div class="col-xs-8 col-md-4">
            <select name="paymentOption" class="form-control" style="width: 100px;">
                <option value="1" selected="selected">���ݱ���</option>
                <option value="2">�ſ뱸��</option>
            </select>
        </div>
    </div>
  
    <hr/>

    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>�������̸�</strong></div>
        <div class="col-xs-8 col-md-4">
            <input type="text" name="receiverName" class="form-control" style="width: 100px;" maxLength="20" value="SCOTT" />
        </div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>�����ڿ���ó</strong></div>
        <div class="col-xs-8 col-md-4">
            <input type="text" name="receiverPhone" class="form-control" style="width: 100px;" maxLength="20" value="null" />
        </div>
    </div>
    
    <hr/>
 
     <div class="row">
        <div class="col-xs-4 col-md-2"><strong>�������ּ�</strong></div>
        <div class="col-xs-8 col-md-4">
            <input type="text" name="divyAddr" class="form-control" style="width: 100px;" maxLength="20" value="null" />
        </div>
    </div>

    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>���ſ�û����</strong></div>
        <div class="col-xs-8 col-md-4">
            <input type="text" name="divyRequest" class="form-control" style="width: 100px;" maxLength="20" />
        </div>
    </div>    

    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>����������</strong></div>
		<div class="col-xs-8 col-md-4" style="display: flex; align-items: center;">
		    <input type="text" readonly="readonly" name="divyDate" class="form-control" style="width: 100px;" maxLength="20"/>
		    <img src="../images/ct_icon_date.gif" width="15" height="15" onclick="show_calendar('document.addPurchase.divyDate', document.addPurchase.divyDate.value)" style="margin-left: 5px;" />
		</div>
    </div>    
	
	<div class="container text-right">
	    <div class="row">

	            <button type="button" class="btn btn-primary" onclick="fncAddPurchase();">����</button>

	            <button type="button" class="btn btn-secondary" onclick="history.go(-1);">���</button>

	    </div>
	</div>

</form>

</div>

</body>
</html>