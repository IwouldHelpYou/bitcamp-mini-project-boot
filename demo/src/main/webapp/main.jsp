<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>


    <!-- 점보트론, 버튼 fade in -->
    <style>
 
        /* 초기 상태: 요소가 투명하게 숨겨져 있음 */
	    .container .jumbotron {
	    	margin-top: 100px;
	        opacity: 0;
	        visibility: hidden;
	        transition: opacity 1.5s ease-in-out;
	    }
	
	    /* 2초 후에 요소가 서서히 나타남 */
	    .container .jumbotron.show {
	        opacity: 1;
	        visibility: visible;
	    }
		
		.container .button {
			opacity: 0;
			visibility: hidden;
			transition: opacity 1s ease-in-out;
			animation: blink 2s infinite;
		}
		
		.container .button.show {
			opacity: 1;
			visibility: visible;
		}
		
	    /* 2초 후에 요소가 서서히 나타나는 애니메이션 */
	    @keyframes fadeIn {
	        0% {
	            opacity: 0;
	            visibility: hidden;
	        }
	        100% {
	            opacity: 1;
	            visibility: visible;
	        }
	   	}
	   	
   		@keyframes blink {
		0% { opacity: 1; }
		50% { opacity: 0.5; }
		100% { opacity: 1; }
		}
    </style>
    <script>
       // 페이지 로딩 후 2초 뒤에 jumbotron 요소에 show 클래스를 추가하여 서서히 나타나도록 함
       $(document).ready(function() {
           setTimeout(function() {
               $(".jumbotron").addClass("show");
               console.log("jumbotron")
           }, 500); // 2초 후에 실행됨
           
           setTimeout(function() {
               $(".button").addClass("show");
               console.log("button")
           }, 2500); // 2초 후에 실행됨
           
           // 버튼 클릭 시 페이지 이동
           $(".button").on("click", function() {
               window.location.href = "/product/listProduct?menu=search";
           });
       });
    </script>	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<jsp:include page="/layout/background.jsp" />

   	<div class="container" style="display:flex; flex-direction:column; justify-content:center;">
      <div class="jumbotron">
         <h1 class="text-center">Spring MVC Shop </h1>
      </div>
      
      <button class="btn btn-primary button text-center">판매상품 둘러보기</button>
    </div>
    
</form>

</body>

</html>
