
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
	console.log('post 전송')

    $("input[name='buyer.userId']").val(userId);
	$("input[name='purchaseProd.proTranCode']").val(proTranCode);
	$("input[name='purchaseProd.prodNo']").val(prodNo);
	
    //$('input[name=buyer.userId]').val(userId);
    //$('input[name=purchaseProd.proTranCode]').val(proTranCode);
    
    
	//form 데이터에서 나가는 데이터 확인용
	var formData = $('form').serializeArray();
	for (var i = 0; i < formData.length; i++) {
	    console.log("나가는데이터", formData[i].name, formData[i].value);
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

<!-- buyer 와 tranCode가 null 임  
User buyer의 userId / ProductVO purchaseProd 의 ProdNo를 가져와야함
-->


<div style="width: 70%; margin: 100px auto;">

<form name="addPurchase" method="post" action="/purchase/execPurchase">

	<div class="container">
	
	<input type="hidden" name="buyer.userId" value="" /> 
	<input type="hidden" name="purchaseProd.prodNo" value="" />
	<input type="hidden" name="purchaseProd.proTranCode" value="" />
	
	<!-- 상품 구매신청 -->
	<div class="page-header">
       <h3 class=" text-info">상품정보조회</h3>
       <h5 class="text-muted">상품 정보를 <strong class="text-danger">업데이트</strong>해 주세요.</h5>
    </div>
	
	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
		<div class="col-xs-8 col-md-4">${product.getProdNo()}</div>
	</div>	

	<hr/>
	
	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
		<div class="col-xs-8 col-md-4">${product.getProdName()}</div>
	</div>

	<hr/>
	
	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>상품상세정보</strong></div>
		<div class="col-xs-8 col-md-4">${product.getProdDetail()}</div>
	</div>

	<hr/>
	
	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
		<div class="col-xs-8 col-md-4">${product.getRegDate()}</div>
	</div>

	<hr/>
	
	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>가격</strong></div>
		<div class="col-xs-8 col-md-4">${product.getPrice()}</div>
	</div>	

	<hr/>
	
	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>등록일자</strong></div>
		<div class="col-xs-8 col-md-4">${product.getRegDate()}</div>
	</div>	
		
	<hr/>

	<div class="row">
  		<div class="col-xs-4 col-md-2"><strong>구매자아이디</strong></div>
		<div class="col-xs-8 col-md-4">${user.userId}</div>
	</div>	
		
	<hr/>

    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>구매방법</strong></div>
        <div class="col-xs-8 col-md-4">
            <select name="paymentOption" class="form-control" style="width: 100px;">
                <option value="1" selected="selected">현금구매</option>
                <option value="2">신용구매</option>
            </select>
        </div>
    </div>
  
    <hr/>

    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>구매자이름</strong></div>
        <div class="col-xs-8 col-md-4">
            <input type="text" name="receiverName" class="form-control" style="width: 100px;" maxLength="20" value="SCOTT" />
        </div>
    </div>
    
    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>구매자연락처</strong></div>
        <div class="col-xs-8 col-md-4">
            <input type="text" name="receiverPhone" class="form-control" style="width: 100px;" maxLength="20" value="null" />
        </div>
    </div>
    
    <hr/>
 
     <div class="row">
        <div class="col-xs-4 col-md-2"><strong>구매자주소</strong></div>
        <div class="col-xs-8 col-md-4">
            <input type="text" name="divyAddr" class="form-control" style="width: 100px;" maxLength="20" value="null" />
        </div>
    </div>

    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>구매요청사항</strong></div>
        <div class="col-xs-8 col-md-4">
            <input type="text" name="divyRequest" class="form-control" style="width: 100px;" maxLength="20" />
        </div>
    </div>    

    <hr/>
    
    <div class="row">
        <div class="col-xs-4 col-md-2"><strong>배송희망일자</strong></div>
		<div class="col-xs-8 col-md-4" style="display: flex; align-items: center;">
		    <input type="text" readonly="readonly" name="divyDate" class="form-control" style="width: 100px;" maxLength="20"/>
		    <img src="../images/ct_icon_date.gif" width="15" height="15" onclick="show_calendar('document.addPurchase.divyDate', document.addPurchase.divyDate.value)" style="margin-left: 5px;" />
		</div>
    </div>    
	
	<div class="container text-right">
	    <div class="row">

	            <button type="button" class="btn btn-primary" onclick="fncAddPurchase();">구매</button>

	            <button type="button" class="btn btn-secondary" onclick="history.go(-1);">취소</button>

	    </div>
	</div>

</form>

</div>

</body>
</html>