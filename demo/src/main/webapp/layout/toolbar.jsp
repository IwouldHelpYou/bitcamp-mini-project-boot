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

<!-- 최상단 컨테이너 스타일링 -->
<style>

    .top-container {
        display: flex;
        justify-content: flex-end; /* 우측 정렬 */
        align-items: center; /* 세로 중앙 정렬 */
        height: 50px; /* 높이 조정 */
        /*background-color: #f0f0f0;  배경색 지정 */
        padding: 0 20px;
        padding-Bottom: 10px;
        box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    }
	
    /* 로그인 링크 */
    .login-link {
        margin-right: 375px; /* 우측 여백 */
        color: #333; /* 글자색 */
    }

    /* 사용자 이름 */
    .username {
    	margin-right: 375px;
        font-weight: bold; /* 글자 굵게 */
    }
	
</style>

<!-- 배너 스타일링 -->
<style>
	.toAll{
		position:static;
		top:0px;	
	}
	
	.container{
		padding: 0 20px;
	}
	/* 네비게이션 바 색상 */
	.navbar{
		background-color:lightyellow !important;
	}
	
	/* 네비게이션 바 글자색상 */
	.navbar > li > a{
		color: black !important;
	}

	
</style>

<div class="top-container">
	<c:if test="${empty user}">
		<h3 class="login-link"><a href="/user/loginView" >로그인/회원가입</a></h3>
	</c:if>
	
	<c:if test="${not empty user}">
		<h3 class="username">${user.userId}님 로그인</h3>
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
		         
		         	<!-- Tool Bar 를 다양하게 사용하면.... -->
		             <ul class="nav navbar-nav">
		             
		              <!--  회원관리 DrowDown -->
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >회원관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                     	 <li class="divider"></li>
		                         <li><a href="/user/getUser?userId=${sessionScope.user.userId}">개인정보조회</a></li>
		                         
		                         <c:if test="${sessionScope.user.role == 'admin'}">
		                         	<li><a href="#">회원정보조회</a></li>
		                         </c:if>
		                         <li class="divider"></li>
		                         
		                         <!-- <li><a href="#">etc...</a></li>  -->
		                     </ul>
		                 </li>
		                 
		              <!-- 구매관리 DrowDown -->
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >상품구매</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                     	 <li class="divider"></li>
		                         <li><a href="/product/listProduct?menu=search">상 품 검 색</a></li>
		                         
		                         <c:if test="${sessionScope.user.role == 'user'}">
		                           <li><a href="/purchase/listPurchase">구매이력조회</a></li>
		                         </c:if>
		                         
		                         <li><a href="/history.jsp">최근본상품(공사중)</a></li>
		                         <li class="divider"></li>
		                         <!-- <li><a href="#">etc..</a></li> -->
		                     </ul>
	                 </li>
	                 
	         	     <!-- 판매상품관리 DrowDown  -->
		             <c:if test="${sessionScope.user.role == 'admin'}">
			            <li class="dropdown">
			            	   
			                   <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
			                       <span >관리자메뉴</span>
			                       <span class="caret"></span>
			                   </a>
			                   <ul class="dropdown-menu">
			                   	   <li class="divider"></li>
			                       <li><a href="/product/addProduct">판매상품등록</a></li>
			                       <li><a href="/product/listProduct?menu=manage">판매상품관리</a></li>
			                       <li class="divider"></li>
			                       <!-- <li><a href="#">etc..</a></li>  -->
			                   </ul>
			            </li>
		             </c:if>
		             
		             </ul>
		             
		             <!-- 로그아웃 -->
				    <ul class="nav navbar-nav navbar-right">
				        <li>
				            <c:if test="${not empty user}">
				                <a href="/user/logout">로그아웃</a>
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
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	</script>  