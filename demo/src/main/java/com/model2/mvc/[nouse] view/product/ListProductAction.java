// ���� '��ǰ�˻�' ������ ��ǰ �����ȸ������
// + ��ǰ�˻����� �� �ش� ���������� �� �ٽ� ��ǰ �����ȸ������ ListProduct.jsp ��������

// listProduct.do �� ������ ListProductAction ���� �����ؼ� ����
// productService �� �ҷ��� ProductDAO�� getProductList DBMS �� �����Ѵ�

package com.model2.mvc.view.product;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.ProductVO;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

public class ListProductAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("/ListProudctAction.java");
		System.out.println("��ǰ �˻��� ������ �� �̰� ����Ǿ����");
		//menu �� ���� ������ �� �Ѿ���� 
		System.out.println("menu�� �Ѿ���µ�? " + request.getParameter("menu"));
		//currentpage�� ������ Ŭ������ �� �Ѿ��
		System.out.println("currentpage�� �Ѿ��? " + request.getParameter("currentPage"));
		Search search = new Search();
		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null)
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		search.setCurrentPage(currentPage);
		search.setSearchCondition(request.getParameter("searchCondition")); //��ǰ��ȣ0 or ��ǰ�̸�1 �˻����Ǽ���
		search.setSearchKeyword(request.getParameter("searchKeyword")); //�˻���
		
		
		int pageSize = Integer.parseInt( getServletContext().getInitParameter("pageSize"));
		int pageUnit  =  Integer.parseInt(getServletContext().getInitParameter("pageUnit"));
//		search.setPageSize(pageSize);
		//String pageSize = getServletContext().getInitParameter("pageSize"); //��� �޾ƿ���?
		//String pageUnit = search.setPageUnit(Integer.parseInt(pageUnit));
		System.out.println("pageSize,pageUnit"+pageSize+","+pageUnit);
		// Business logic ����
		// (pageSize ������ŭ�� ��ǰ�����͸� map ��ü�� �޾ƿ�)
		search.setPageSize(pageSize);
		System.out.println("search : " + search); 
		ProductService service = new ProductServiceImpl();

		//HashMap<String,Object> map 
		List<ProductVO> map = service.getProductList(search);
		
		System.out.println("map�޾ƿ°�" + map);
//		System.out.println(currentPage + " / "+ map.get("list") + " / " + pageUnit + " / " + pageSize);
//		
//		Page resultPage = new Page( currentPage, ((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
//		System.out.println("��ǰ ��� ���� (map.get(\"list\").size()) " + map.get("list"));
//		System.out.println("������ ���� " + resultPage.toString());
//		
//		// Model �� View ����
//		request.setAttribute("list", map.get("list")); //���� product List �� �� (total�� ���� page�����ִϱ� map ����) 
//		request.setAttribute("resultPage", resultPage);
		request.setAttribute("search", search); // �˻� ���ǵ�
		
		return "forward:/product/listProduct.jsp";
	}
	
	
}