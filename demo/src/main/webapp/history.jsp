<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
	<head>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	<title>��� ��ǰ ����</title>
	
	</head>

	<body>
	
	<jsp:include page="/layout/toolbar.jsp" />
	
		����� ��� ��ǰ�� �˰� �ִ�!!
	<br>
	<br>
	<%
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		String history = null;
		Cookie[] cookies = request.getCookies();
		if (cookies!=null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().equals("history")) {
					history = cookie.getValue();
				}
			}
			if (history != null) {
				String[] h = history.split(",");
				for (int i = 0; i < h.length; i++) {
					if (!h[i].equals("null")) {
	%>
	<a href="/getProduct.do?prodNo=<%=h[i]%>&menu=search"	target="rightFrame"><%=h[i]%></a>
	<br>
	<%
					}
				}
			}
		}
	%>
	
	</body>
</html>