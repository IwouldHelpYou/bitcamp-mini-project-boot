<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!--  폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">   

<style>
        /* 모든 요소에 Open Sans 폰트 적용 */
        body {
        	/*margin: 100px;*/
           	font-family: "Gowun Dodum", sans-serif !important;
	  		font-weight: 400 !important;
		  	font-style: normal !important;
            background-image: url("/images/sj/background2.jpeg");
            animation: slideBackground 80s linear infinite;
        }
        
        /* 키프레임 애니메이션 정의 */
        @keyframes slideBackground {
            0% {
                background-position: 0% 0%;
            }
            50% {
                background-position: 100% 0%;
            }
            100% {
                background-position: 0% 0%;
            }
        }
</style>