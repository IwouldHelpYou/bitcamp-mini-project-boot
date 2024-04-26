<!-- �������� ��ǰ �˻� (ListProductAction ����) ������ �� �� ���� ������ -->

<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--/////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////

<%	
	System.out.println("/listProduct.jsp ���� �޾ƿ� ��"
	+ request.getAttribute("list") //���� product List �� �� (total�� ���� page�����ִϱ� map ����) 
	); // �˻� ���ǵ�
	
	
	Page resultPage = (Page)request.getAttribute("resultPage");

	List<ProductVO> list= (List<ProductVO>)request.getAttribute("list");
	//���� HashMap<String,Object> map=(HashMap<String,Object>)request.getAttribute("map");
	//��ǰ��� (���� list ���ٰ� total, list ���������� list �� ������)
	
	//����������
	Search search=(Search)request.getAttribute("search");
	
	String searchKeyword = search.getSearchKeyword(); //�˻���
    String searchCondition = search.getSearchCondition(); //�˻�����

 	/* page ��ü ����� ����� �ڵ�
    int total=0; // ��ȸ�� ��ǰ ����
	ArrayList<ProductVO> list=null;
	if(map != null){
		total=((Integer)map.get("count")).intValue();
		list=(ArrayList<ProductVO>)map.get("list");
	}
	// map : ��ü ���� count �� ��ü ��� list �� ����
	// total : ��ü ������ ������ 
	// list : ���� ������ (DAO���� pageUnit ��ŭ ��Ƴ���)

	int currentPage = search.getPage(); // page : ���� ��ġ�� ������
	int totalPage=0;
	if(total > 0) { // ��ȸ�� ��ǰ�� ������
		totalPage= total / search.getPageUnit() ; // ��ü ������ = ��ü ������ / ��� ��������
		if(total%search.getPageUnit() >0) // pageUnit : ��� �����
			System.out.println("totalPage " +  totalPage);
			totalPage += 1;
	}
	*/
%>
--%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>��ǰ �����ȸT</title>
	
	<link rel="stylesheet" href="/css/my.css" type="text/css">
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	<!-- ajax �� �������̵� -->
	<script type="text/javascript">
		
		// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
		function fncGetProductList(currentPage) {
			console.log("��û��")
			$('#menu').val(`${param.menu}`);
			$('#currentPage').val(currentPage);
			$('form[name="detailForm"]').submit();
			
		//	document.getElementById("currentPage").value = currentPage;
		// 	document.detailForm.submit();	
		}
		
		$(function() {
			//var prodNo = $(".ct_list_pop td")[0].innerText;
			console.log("ajax ���۽��� Ȯ����");
			
		 	$( "#searchButton" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
				console.log("�˻� ��û��")
				fncGetProductList(1);
			});
						 
			$(".ct_list_pop").on("click", function(){
				
				var clickedTr = $(this);
				console.log("clicked",clickedTr);
				var prodNo = clickedTr.find("td:first").text();
				console.log("prodNo",prodNo);
				
				$.ajax( 
						{
							url : "/product/json/getProduct?prodNo="+prodNo ,
							method : "GET" ,
							dataType : "json" , //�������� �޾ƿ� ������ Ÿ��
							headers : {
								"Accept" : "application/json", //�������� ���ϴ� ������ Ÿ��
								"Content-Type" : "application/json" //req,res �ٵ��� ������ Ÿ��?
							},
							//data:JSON.stringify({"userId":userId}) <- ���� POST ��û�̸� data ��
							success : function(JSONData , status) {
								console.log(JSONData,status)
								//Debug...
								//alert(status);
								//Debug...
								//alert("JSONData : \n"+JSONData);
								
								var displayValue = "<tr class='ajax' >"
															+"<td colspan='5'>" 
															//+"�����̸� : "+JSONData.fileName+"<br/>"
															//+"�̹��� : "+JSONData.imageFile+"<br/>"
															//+"�������� : "+JSONData.manuDate+"<br/>"
															//+"���� : "+JSONData.price+"<br/>"
															//+"��ǰ��  : "+JSONData.prodName+"<br/>"
															//+"��ۻ��� : "+JSONData.proTranCode+"<br/>"
															+"������ : "+JSONData.prodDetail+"<br/>"
															//+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
															//+"�����  : "+JSONData.regDate+"<br/>"
															+"</td>" 
													+"</tr>";
								//Debug...									
								console.log(displayValue); 
								
								//clickedTr.find("h3").empty();
								console.log("clickedTr",clickedTr);
								if (clickedTr.next(".ajax").length > 0) {
									console.log("����")
								    // �̹� ��ϵ� ��Ұ� ������ �ش� ��Ҹ� ����
								    clickedTr.next(".ajax").remove();
								} else {
									console.log("���")
								    // ��ϵ� ��Ұ� ������ "gg"�� �߰�
								    clickedTr.after(displayValue).addClass("selected");
								}
								
							}
						})
			})
		})
		
		</script>
	
	<!-- ȣ������ -->		
	<style>
	 label {
	   display: inline-block;
	   width: 5em;
	 }
	
		/* �Ǹ����� ��ǰ */
	.selling {
	    background-color: transparent; /* �ʱ� ���¸� �����ϰ� ���� */
	    background-color: white;
	    animation: blink 2s infinite;
	}
   	
    .selling:hover {
		animation: none;
    }
    
	.ct_list_pop {
		transition: background-color 0.3s ease;
	}
	
	.ct_list_pop:hover { /* tr ȣ�������� */
	    /* ���콺�� �÷��� ���� ��Ÿ�� */
	    background-color: lightyellow;
	    box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); /* �׸��� ȿ�� �߰� */
     	animation: none;
	}

	.selected {
		animation: blink 1s infinite; /* ���õ� ��Ҹ� �����ϰ� ��¦�̵��� �ִϸ��̼� ���� */	
	}
	
	/* ajax���� ������ p�±� */
	.ajax { 
		border: 1px solid #ccc;
		padding: 10px;
		margin-top: 10px;
		width: 100%;
		
	}
	
	/* ajax���� ������ p�±� ȣ���� */
	.ajax:hover { 
		background-color: #f0f0f0; /* ȣ�� �� ���� ���� */
		transform: scale(1.05); /* ȣ�� �� Ȯ�� ȿ�� */
		cursor: pointer; /* Ŭ�� ������ ��ҷ� Ŀ�� ���� */
	}

	@keyframes blink {
		0% { opacity: 1; }
		50% { opacity: 0.1; }
		100% { opacity: 1; }
	}
	</style>
	<script>
		$(document).ready(function() {
		    // ct_list_pop ��ҿ� ȣ�� �̺�Ʈ �߰�
		    $('.ct_list_pop').hover(function() {
		        // �ٸ� ct_list_pop ����� animation �ߴ�
		        $('.ct_list_pop').css('animation', 'none');
		    }, function() {
		        // ȣ���� ���� �� �ٽ� animation ����
		        $('.ct_list_pop selling').css('animation', 'blink 2s infinite');
		    });
	
		    // selected ��ҿ� ȣ�� �̺�Ʈ �߰�
		    $('.selected').hover(function() {
		        // �ٸ� ct_list_pop ����� animation �ߴ�
		        $('.ct_list_pop').css('animation', 'none');
		    }, function() {
		        // ȣ���� ���� �� �ٽ� animation ����
		        $('.ct_list_pop').css('animation', 'blink 2s infinite');
		    });
		});
	</script>
	 
	<!-- ���� -->
	<script type="text/javascript">
		$(document).ready(function(){
			console.log("���� ���۽��� Ȯ����");
		    $('.ct_list_pop').tooltip();     
		});
	</script>
	
 

	<!-- auto complete trying-->
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<style> /*auto complete css ���� ���� */</style>
	<script type="text/javascript">

		$(document).ready(function(){
			console.log("autocomplete ���۽��� Ȯ����");
			$('#searchKeyword').autocomplete({
				
			    source: function(req,res){
			    	// req : ����ڰ� �Է��� ����
			    	// res : �ڵ� �ϼ� ��ɿ� ǥ�õ� �׸���� ��ȯ
			    	
			    	$.ajax({
			    		url: "/product/json/getProductList",
			    		type: "POST",
			    		dataType: "json",
			    		data: { value: req.term }, 
			    		// term�� jQuery UI�� �ڵ� �ϼ�(autocomplete) �������� ���Ǵ� Ư���� �Ӽ��Դϴ�. 
			    		// �� �Ӽ��� ����ڰ� �Է��� ���� ��Ÿ����, �ڵ� �ϼ� ������ �۵��ϴ� ���ȿ��� �����մϴ�. 
			    		// ����ڰ� �Է� �ʵ忡 �ؽ�Ʈ�� �Է��� ������ term �Ӽ��� ������Ʈ�Ǿ� �ش� �Է��� ��Ÿ���ϴ�.
			    		
			    		// value�� jQuery UI�� �ڵ� �ϼ�(autocomplete) �������� ���Ǵ� �ɼ� �� �ϳ��Դϴ�. 
			    		// �� �ɼ��� ����ڰ� ������ �׸��� ���� ��Ÿ����, �Ϲ������� �����ͺ��̽��� �ٸ� �ҽ����� ������ �׸��� Ư�� �Ӽ��� ��Ÿ���ϴ�.
			    		
			    		/*
						headers : {
							"Accept" : "application/json", //�������� ���ϴ� ������ Ÿ��
							"Content-Type" : "application/json" //req,res �ٵ��� ������ Ÿ��?
						},
						*/
				       success: function (JSONData , status) {
				    	   
				    		console.log(JSONData , status); 
			                res(JSONData)
			                
			    		}
			   	 	})
			    },
			    focus: function (event, ui) {
			      return false;
			    },
			    select: function (event, ui) {},
			    minLength: 1, // �ּ� �Է� ���̸� 1�� �����Ͽ� �� ���ھ� �Էµ� ������ �ڵ� �ϼ� ����
			    delay: 100,
			    autoFocus: true

			  });
		});
	
	</script>
	
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />
<jsp:include page="/layout/background.jsp" />


<div style="width: 70%; margin: 100px auto;">


		
	<div class="container">
		
		<!--  ������� -->
		<div class="page-header text-info">
	       <h3>��ǰ�����ȸ</h3>
	    </div>
		
		<!--  ��ǰ�˻� -->
		<div class="row"> 
		    
			    <div class="col-md-6 text-left">
			    	<p class="text-primary">
			    		��ü  ${resultPage.getTotalCount() } �Ǽ�, ���� ${resultPage.getCurrentPage()}  ������
			    	</p>
			    </div>
			    
			    <div class="col-md-6 text-right">
				    <form class="form-inline" name="detailForm" action="/product/listProduct" method="post">
				      
				      <!-- ȸ��ID -->
					  <div class="form-group">
					  
					    <select class="form-control" name="searchCondition" >
							<!-- �Ǹ��� ��ǰ����� 
								<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>ȸ��ID</option>
							 -->
							<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>

						</select>
					  </div>
					  
					  <!-- �˻��� -->
					  <div class="form-group">
					    <label class="sr-only" for="searchKeyword">�˻���</label>
					    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
					    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					  </div>
					  
					  <!-- �˻� -->
					  <button type="button" id="searchButton" class="btn btn-default">�˻�</button>
					  
					  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					  <input type="hidden" id="menu" name="menu" value=""/>
					 
				  
					</form>
		    	</div>
		    	
			</div>
		
		<!--  ��ǰ��� ���� -->
		<table class="table ">
		
	        <thead>
	          <tr>
	            <th align="center">No</th>
	            <th align="left" >��ǰ��</th>
	            <th align="left">����</th>
	            <th align="left">�����</th>
	            <th align="left">�������</th>
	          </tr>
	        </thead>
	        
			<tbody>
			
				<!-- DB ��ȸ�� list ���� �ϳ��� vo �� ��Ƽ� �������� -->
				<c:set var="i" value="0" />
				<c:forEach var="x" items="${list}">	
					<c:set var="i" value="${ i+1 }" />
					<tr class="ct_list_pop ${x.proTranCode eq '�Ǹ���' ? 'selling' : ''}" title="�����Ϸ��� ��ũ�� Ŭ���ϼ���" data-placement="left" style="font-family: 'Gowun Dodum', sans-serif !important;">
						<td style="display:none;">${x.prodNo}</td>
						<td align="center">${ i }</td>
						<td align="left">
					
							<c:if test="${x.proTranCode == '�Ǹ���'}">
								<a href="/product/getProduct?prodNo=${x.prodNo}">${x.prodName}</a>
							</c:if>
							
							<c:if test="${x.proTranCode != '�Ǹ���'}">
							    ${x.prodName}
							</c:if>
							
						</td>
						<td align="left">${x.price}</td>
						<td align="left">${x.regDate}</td>		
						<td align="left">
							
							<%-- ${list} -> ProductVO ��� --%>
							<%-- ${resultPage} -> Page [currentPage=1, totalCount=8, pageUnit=5, pageSize=3, maxPage=3, beginUnitPage=1, endUnitPage=3] --%> 
							<%-- ${search} -> Search [curruntPage=1, searchCondition=null, searchKeyword=null, pageSize=3] --%>
							<%-- ${param} -> {menu=search} --%>
							<%-- ${product} -> ProductVO--%>
							
							<c:if test="${param.menu eq 'search'}">
							    ${x.proTranCode}
							</c:if>
							<c:if test="${param.menu eq 'manage'}">
							    <c:choose>
							        <c:when test="${x.proTranCode eq '�����'}">
							            ${x.proTranCode} 
							            <a href="/purchase/updateTranCode?prodNo=${x.prodNo}&menu=${param.menu}&currentPage=${resultPage.currentPage}">����ϱ�</a>
					
							        </c:when>
							        <c:otherwise>
							            ${x.proTranCode}	
							        </c:otherwise>
							    </c:choose>
							</c:if>
						
							<!-- 
							<c:if test="${param.menu == 'manage'}">
							
								<c:if test="${product.proTranCode == '�Ǹ���'}">
									<a href="/product/getProduct?prodNo=${product.prodNo}">${product.prodName}</a>
								</c:if>
								
								<c:if test="${product.proTranCode != '�Ǹ���'}">
								    ${product.prodName}
								</c:if>
								
							</c:if>
							
							
							<c:if test="${param.menu == 'search'}">
							${param.menu} !!
								${product.proTranCode == '�Ǹ���'}
								
							</c:if>
							 -->
						</td>		
					</tr>
				</c:forEach>
			
			</tbody>	
		 </table>
		
 	</div>	
 	
	<jsp:include page="../common/pageNavigator_new_product.jsp"/>

</form>

</div>

</body>
</html>