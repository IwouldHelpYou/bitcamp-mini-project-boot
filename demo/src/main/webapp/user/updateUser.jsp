<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>ȸ�� ���� ����</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		
		//=====����Code �ּ� ó�� ��  jQuery ���� ======//
		function fncUpdateUser() {
			// Form ��ȿ�� ����
			//var name=document.detailForm.userName.value;
			var name=$("input[name='userName']").val();
			
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
				
			//if(document.detailForm.phone2.value != "" && document.detailForm.phone2.value != "") {
			//	document.detailForm.phone.value = document.detailForm.phone1.value + "-" + document.detailForm.phone2.value + "-" + document.detailForm.phone3.value;
			//} else {
			//	document.detailForm.phone.value = "";
			//}
			
			var value = "";	
			if( $("input[name='phone2']").val() != ""  &&  $("input[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}
			
			//Debug...
			//alert("phone : "+value);
			$("input:hidden[name='phone']").val( value );
				
			//	document.detailForm.action='/user/updateUser';
			//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}//===========================================//
		//==> �߰��Ⱥκ� : "����"  Event ����
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $("#button-group").find("button").on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('����')" ).html() );
				fncUpdateUser();
			});
		});	
		
	
		 /*============= jQuery ���� �ּ�ó�� =============
		function check_email(frm) {
				var email=document.detailForm.email.value;
			    if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)){
			    	alert("�̸��� ������ �ƴմϴ�.");
					return false;
			    }
			    return true;
		}========================================	*/
		//==> �߰��Ⱥκ� : "�̸���" ��ȿ��Check  Event ó�� �� ����
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
					
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});	
		
		
	 	/*============= jQuery ���� �ּ�ó�� =============
		function resetData() {
			document.detailForm.reset();
		}========================================	*/
		//==> �߰��Ⱥκ� : "���"  Event ���� �� ó��
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $("#button-group").find("a").on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('���')" ).html() );
				history.go(-1);
			});
		});
		

	</script>		
	
</head>

<body bgcolor="#ffffff" text="#000000">

<jsp:include page="/layout/background.jsp" />
<jsp:include page="/layout/toolbar.jsp" />

<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
<form name="detailForm"  method="post" >
////////////////////////////////////////////////////////////////////////////////////////////////// -->
<div style="width: 70%; margin: 100px auto;">

	<div class="container">
	
		<div class="page-header ">
	       <h3 class=" text-info">ȸ����������</h3>
	       <h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-2 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="�ߺ�Ȯ���ϼ���"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">���̵�� �����Ұ�</strong>
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-sm-2 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="�����й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-2 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="�����й�ȣ Ȯ��">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-2 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="����ȸ���̸�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-2 control-label">�ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="addr" name="addr"  value="${user.addr}" placeholder="�����ּ�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-2 control-label">�޴���ȭ��ȣ</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="phone1" id="phone1">
				  	<option value="010" ${ ! empty user.phone1 && user.phone1 == "010" ? "selected" : ""  } >010</option>
					<option value="011" ${ ! empty user.phone1 && user.phone1 == "011" ? "selected" : ""  } >011</option>
					<option value="016" ${ ! empty user.phone1 && user.phone1 == "016" ? "selected" : ""  } >016</option>
					<option value="018" ${ ! empty user.phone1 && user.phone1 == "018" ? "selected" : ""  } >018</option>
					<option value="019" ${ ! empty user.phone1 && user.phone1 == "019" ? "selected" : ""  } >019</option>
				</select>
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone2" name="phone2" value="${ ! empty user.phone2 ? user.phone2 : ''}"  placeholder="�����ȣ">
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone3" name="phone3" value="${ ! empty user.phone3 ? user.phone3 : ''}"   placeholder="�����ȣ">
		    </div>
		    <input type="hidden" name="phone"  />
		  </div>
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-2 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" value="${user.email}" placeholder="�����̸���">
		    </div>
		  </div>
		  
		  <div class="form-group" id="button-group">
		    <div class="col-sm-offset-2 col-sm-2 text-center" style="display:flex; flex-direction:row; gap:100px;">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
</div>

</body>

</html>