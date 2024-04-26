<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<head>
<title>��ǰ���</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js"></script>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<!-- ���� �̸����� �ڵ�-->
<script type="text/javascript">

$(function() {
	
	console.log("����8")
	/////////////////
	////���� �׽�Ʈ��////
	////////////////
	var file = $("#fileUpload")
	console.log(file)
	console.log(file.get(0)); // input �±�
	
	var multiplefile = $("#fileUploadMultiple")
	console.log(multiplefile)
	console.log(multiplefile.get(0)) // Multiple input �±�
	
	
	//eventlistner ��� 
	file.get(0).onchange = () => {

		const selectedFile = file.get(0).files[0];
		console.log("selectedFile", selectedFile);
		
		//���� �̸�����
		const fileReader = new FileReader();
		fileReader.readAsDataURL(selectedFile);
		fileReader.onload = function () {
			
			console.log("fileReader", fileReader)
			
			var imgElement = $("<img>");
			imgElement.attr("src", fileReader.result);
			imgElement.css({
			    "width": "200px",
			    "height": "200px"
			});
			imgElement.addClass("uploadedImg")
			//js�и�
			
	        //imgElement.click(() => {
	        //    alert("���õ�");
	        //});			
			
			$("#imgDisplaySpot").append(imgElement);
			
		  };
	}
	
	multiplefile.get(0).onchange = () => {
		//const selectedFileMultiple = multiplefile.get(0).files[0];
		const selectedFileMultiple = [...multiplefile.get(0).files];
		console.log("selectedFileMultiple!", selectedFileMultiple);
		
		//���� �̸�����
		selectedFileMultiple.forEach( (selectedFile) => {
			var fileReader = new FileReader();
			console.log("each selectedFile", selectedFile);
			
			fileReader.readAsDataURL(selectedFile);
			fileReader.onload = function () {
				
				console.log("fileReader", fileReader)
				
				var imgElement = $("<img>");
				imgElement.attr("src", fileReader.result);
				imgElement.css({
				    "width": "200px",
				    "height": "200px"
				});
				imgElement.addClass("uploadedImg")
		        //js�и�
		        
				//imgElement.click(() => {
		        //    alert("���õ�");
		        //});
				
				$("#imgDisplaySpot").append(imgElement);
				
			  };
		})
	}
	
	
	// base64 : img(���̳ʸ� data) binary �� String ���� �ٲ۰� 
	
	// ���� 
	// spring 'multipart' => form data �� ������ �ް� multipart (�����̸�, �̹���������) �ִµ� �̸� outputstream ���� Ȯ���ϰ�...?
	// "������ ������ ������ java ��ü�� ���ε����ش�"
	// (@modelAttribute Multipart �����̸�)

	//String a = 1;
	//Multipart file = "����.jpg"; // �̹��� �̸�, �̹��� ������
	
	// 1. input �±׸� file �� ���� ( input �±�. files  �ϸ� �ö�� ���� �ö�°� ��)
	// 2. fileReader ���� URL �а� onload ����(?) �̹��� �ּҿ� ���� file �ּҸ� ����
	// 3. ���ε� (��, multi �϶��� fileReader �� ���� ���� �����ؾߵ�
	// �ȱ׷� Failed to execute 'readAsDataURL' on 'FileReader': parameter 1 is not of type 'Blob'. ������ )
	

})

</script>

<!-- ��ǥ���� ���� -->
<script type="text/javascript">

$(function() {
	
    console.log("��ǥ���� ���� �ϴ���");
    
   
    // �̹��� Ŭ�� �̺�Ʈ �ڵ鷯 �Լ� ����
    function ThumbnailImageSelectHandler() {
    	
    	var result = confirm("��ǥ�������� �����ϰڽ��ϱ�?");
    	
    	if (result) {
    	    console.log("��ǥ�������� �����Ǿ����ϴ�.");
    	} else {
    	    console.log("��ǥ���������� ��ҵǾ����ϴ�.");
    	}
    	
    	//�ش����� ���������� ��ŷ�ؼ� ������ �Ѱܾ���
    	
    }
    
    // �̹��� Ŭ�� �̺�Ʈ �ڵ鷯 ���
    $("#imgDisplaySpot").on("click", '.uploadedImg', ThumbnailImageSelectHandler);

    $("#imgDisplaySpot").hover(
    		  function() {
    		    // ȣ�� ���� �� �̹����� Ȯ���Ͽ� ���̵��� ����
    		    $(this).css("transform", "scale(1.1)");
    		    $(this).css("border", "2px solid limegreen");
    		  },
    		  function() {
    		    // ȣ�� ���� �� �ٽ� ���� ũ��� ���ư����� ����
    		    $(this).css("transform", "scale(1)");
    		    $(this).css("border", "");
    		  }
    		);
	
})

</script>

<!-- form ���� -->
<script type="text/javascript">

function fncAddProduct(){
	alert("����")
	//Form ��ȿ�� ����
	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();
	//var img = $("input[name='imageFile']").val();
	var singleFile = $("input[name='singleFile']")[0].files[0];
	var multiFile = $("input[name='multipleFile']")[0].files;

	/*
 	var name = document.detailForm.prodName.value;
	var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value;
	var img = document.detailForm.imageFile.value;
	*/
	
	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	
	// [Dev] � input �������� 
	var inputElements = $('input');
	//var inputElements = document.detailForm.getElementsByTagName("input");
	for (var i = 0; i < inputElements.length; i++) {
	    var inputNode = inputElements[i];
	    console.log(inputNode);
	}
	
	
	//////////////////////// ���� ������ ������ ���� FETCH ��û���� ������ ////////////////////////
	// $('form').attr("action" , "/product/addProduct").submit();

	// console.log(name, detail, manuDate, price, singleFile, multiFile);
	
	// alert("�翬���ٷιٲ���")
	/////////////////////////////////////////////////////////////////////////////////
	
	
	var formData = new FormData();
	formData.set('prodName', name);
	formData.set('prodDetail', detail);
	formData.set('manuDate', manuDate);
	formData.set('price', price);
	formData.set('singleFile', singleFile);
    for (var i = 0; i < multiFile.length; i++) {
        formData.append('multipleFile', multiFile[i]); // ���� ����
    }
    
	//[dev] �޾ƿð� �ѱ�� Ȯ��
	console.log("�޾ƿð�", name,detail,manuDate,price,singleFile,multiFile)
	for (const value of formData.values()) {
		  console.log("�ѱ��",value);
		}
	
	fetch('/product/addProduct', {
		method: 'POST',		
	    headers: {
	        'Content-Type': 'multipart/form-data; charset=EUC-KR'
	    },
		body: formData
	})
	.then(response => {
		
		if(response.redirected) {
        window.location.href = response.url; // �����̷�Ʈ�� URL�� �̵�
    	}
		
		if(response.ok) {
			return response.json();
		}
		throw new Error('Network response was not ok.');
	})
	.then(data => {
		// �����κ����� ���� ó��
		console.log(data);
		alert("��ǰ�� ���������� �߰��Ǿ����ϴ�.");
	})
	.catch(error => {
		// ���� ó��
		console.error('There has been a problem with your fetch operation:', error);
		alert("��ǰ �߰��� �����߽��ϴ�.");
	});
}

function resetData(){
	$('form').reset();
}

</script>

</head>
  
<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/toolbar.jsp" />
<jsp:include page="/layout/background.jsp" />

<div style="width: 70%; margin: 100px auto;">

<!-- enctype multipart/form-data���� �ٲ� �̹��� �Ⱦ��Ŵϱ�  -->
<form name="detailForm" action="" method="post" enctype="multipart/form-data">

		<div class="container">
	    <!-- ��� ��� -->
	    <div class="page-header">
	        <h3 class="text-info">��ǰ������ȸ</h3>
	        <h5 class="text-muted">��ǰ ������ <strong class="text-danger">������Ʈ</strong>�� �ּ���.</h5>
	    </div>
	
	    <!-- ��ǰ��ȣ -->
	
	    <div class="row">
	        <div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
	        <div class="col-xs-8 col-md-4"><input type="text" name="prodName" value="${vo.getProdName()}"></div>
	    </div>
	
	    <hr/>
	
	    <div class="row">
	        <div class="col-xs-4 col-md-2"><strong>��ǰ�̹���</strong></div>
	        
	        <br/>
	        ���� 1��
	        <input id="fileUpload" name="singleFile" type="file" accept="image/*">
	        ���� ������
	        <input id="fileUploadMultiple" name="multipleFile" multiple='multiple' type="file" accept="image/*"> 
	        <br/>
	        
	        <div id="imgDisplaySpot"></div>

	        <div class="col-xs-8 col-md-4">
	            <img width="30%" height="30%" src="https://mblogthumb-phinf.pstatic.net/20160817_259/retspe_14714118890125sC2j_PNG/%C7%C7%C4%AB%C3%F2_%281%29.png?type=w800"/>
	        </div>
	    </div>
	
	    <hr/>
	
	    <div class="row">
	        <div class="col-xs-4 col-md-2"><strong>��ǰ������</strong></div>
	        <div class="col-xs-8 col-md-4"><input type="text" name="prodDetail" value="${vo.getProdDetail()}"></div>
	    </div>
	
	    <hr/>
	
	    <div class="row">
	        <div class="col-xs-4 col-md-2"><strong>��������</strong></div>
	        <div class="col-xs-8 col-md-4"><input type="text" name="manuDate" value="${vo.getRegDate()}">
	        &nbsp;<img src="../images/ct_icon_date.gif" width="15" height="15" 
											onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/></div>
	    </div>
	
	    <hr/>
	
	    <div class="row">
	        <div class="col-xs-4 col-md-2"><strong>����</strong></div>
	        <div class="col-xs-8 col-md-4"><input type="text" name="price" value="${vo.getPrice()}"></div>
	    </div>

	</div>
		
	
	<%-- �����ҹ�ư --%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
		<tr>
			<td width="53%"></td>
			<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
						<a href="javascript:fncAddProduct();">���</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
						<a href="javascript:resetData();">���</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>

</form>

</div>
</body>
</html>