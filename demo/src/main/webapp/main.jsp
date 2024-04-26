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


    <!-- ����Ʈ��, ��ư fade in -->
    <style>
 
        /* �ʱ� ����: ��Ұ� �����ϰ� ������ ���� */
	    .container .jumbotron {
	    	margin-top: 100px;
	        opacity: 0;
	        visibility: hidden;
	        transition: opacity 1.5s ease-in-out;
	    }
	
	    /* 2�� �Ŀ� ��Ұ� ������ ��Ÿ�� */
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
		
	    /* 2�� �Ŀ� ��Ұ� ������ ��Ÿ���� �ִϸ��̼� */
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
       // ������ �ε� �� 2�� �ڿ� jumbotron ��ҿ� show Ŭ������ �߰��Ͽ� ������ ��Ÿ������ ��
       $(document).ready(function() {
           setTimeout(function() {
               $(".jumbotron").addClass("show");
               console.log("jumbotron")
           }, 500); // 2�� �Ŀ� �����
           
           setTimeout(function() {
               $(".button").addClass("show");
               console.log("button")
           }, 2500); // 2�� �Ŀ� �����
           
           // ��ư Ŭ�� �� ������ �̵�
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
      
      <button class="btn btn-primary button text-center">�ǸŻ�ǰ �ѷ�����</button>
    </div>
    
</form>

</body>

</html>
