<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- bootStrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" ></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- �ֻ�� �����̳� ��Ÿ�ϸ� -->
<style>

    .top-container {
        display: flex;
        justify-content: flex-end; /* ���� ���� */
        align-items: center; /* ���� �߾� ���� */
        height: 50px; /* ���� ���� */
        /*background-color: #f0f0f0;  ���� ���� */
        padding: 0 20px;
        padding-Bottom: 10px;
        box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1); /* �׸��� ȿ�� */
    }
	
    /* �α��� ��ũ */
    .login-link {
        margin-right: 375px; /* ���� ���� */
        color: #333; /* ���ڻ� */
    }

    /* ����� �̸� */
    .username {
    	margin-right: 375px;
        font-weight: bold; /* ���� ���� */
    }
	
</style>

<!-- ��� ��Ÿ�ϸ� -->
<style>
	.toAll{
		position:static;
		top:0px;	
	}
	
	.container{
		padding: 0 20px;
	}
	/* �׺���̼� �� ���� */
	.navbar{
		background-color:lightyellow !important;
	}
	
	/* �׺���̼� �� ���ڻ��� */
	.navbar > li > a{
		color: black !important;
	}

	
</style>

<div class="top-container">
	<c:if test="${empty user}">
		<h3 class="login-link"><a href="/user/loginView" >�α���/ȸ������</a></h3>
	</c:if>
	
	<c:if test="${not empty user}">
		<h3 class="username">${user.userId}�� �α���</h3>
	</c:if>
</div>
	
<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar navbar-inverse navbar-fixed-top toAll">
	
      	<div class="container">
			<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
			
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
		    <!--  dropdown hover Start -->
			<div class="collapse navbar-collapse" id="target" 
		       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
		         
		         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
		             <ul class="nav navbar-nav">
		             
		              <!--  ȸ������ DrowDown -->
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >ȸ������</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                     	 <li class="divider"></li>
		                         <li><a href="/user/getUser?userId=${sessionScope.user.userId}">����������ȸ</a></li>
		                         
		                         <c:if test="${sessionScope.user.role == 'admin'}">
		                         	<li><a href="#">ȸ��������ȸ</a></li>
		                         </c:if>
		                         <li class="divider"></li>
		                         
		                         <!-- <li><a href="#">etc...</a></li>  -->
		                     </ul>
		                 </li>
		                 
		              <!-- ���Ű��� DrowDown -->
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >��ǰ����</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                     	 <li class="divider"></li>
		                         <li><a href="/product/listProduct?menu=search">�� ǰ �� ��</a></li>
		                         
		                         <c:if test="${sessionScope.user.role == 'user'}">
		                           <li><a href="/purchase/listPurchase">�����̷���ȸ</a></li>
		                         </c:if>
		                         
		                         <li><a href="/history.jsp">�ֱٺ���ǰ(������)</a></li>
		                         <li class="divider"></li>
		                         <!-- <li><a href="#">etc..</a></li> -->
		                     </ul>
	                 </li>
	                 
	         	     <!-- �ǸŻ�ǰ���� DrowDown  -->
		             <c:if test="${sessionScope.user.role == 'admin'}">
			            <li class="dropdown">
			            	   
			                   <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
			                       <span >�����ڸ޴�</span>
			                       <span class="caret"></span>
			                   </a>
			                   <ul class="dropdown-menu">
			                   	   <li class="divider"></li>
			                       <li><a href="/product/addProduct">�ǸŻ�ǰ���</a></li>
			                       <li><a href="/product/listProduct?menu=manage">�ǸŻ�ǰ����</a></li>
			                       <li class="divider"></li>
			                       <!-- <li><a href="#">etc..</a></li>  -->
			                   </ul>
			            </li>
		             </c:if>
		             
		             </ul>
		             
		             <!-- �α׾ƿ� -->
				    <ul class="nav navbar-nav navbar-right">
				        <li>
				            <c:if test="${not empty user}">
				                <a href="/user/logout">�α׾ƿ�</a>
				            </c:if>
				        </li>
				    </ul>
					 
	                 <!-- <li><a href="/logout">etc...</a></li> -->                	             
			</div>
			<!-- dropdown hover END -->	       
	    </div>
</div>

		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�α׾ƿ�')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  ����������ȸȸ Event  ó�� =============	
	 	$( "a:contains('����������ȸ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	</script>  