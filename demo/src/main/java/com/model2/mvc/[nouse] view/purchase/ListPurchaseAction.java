// ���� '��ǰ����' ������ ��ǰ �����ȸ������

// listProduct.do �� ������ ListProductAction ���� �����ؼ� ����
// productService �� �ҷ��� ProductDAO�� getProductList DBMS �� �����Ѵ�

package com.model2.mvc.view.purchase;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

public class ListPurchaseAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("/ListPurchaseAction.java");
		System.out.println("��ǰ������ ������ �� �̰� ����Ǿ����");

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
		
		// Business logic ����
		// (pageSize ������ŭ�� ��ǰ�����͸� map ��ü�� �޾ƿ�)
		search.setPageSize(pageSize);
		ProductService service = new ProductServiceImpl();
		HashMap<String,Object> map = service.getProductList(search);
		
		System.out.println(currentPage + " / "+ map.get("list") + " / " + pageUnit + " / " + pageSize);
		
		Page resultPage = new Page( currentPage, ((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
		System.out.println("��ǰ ��� ���� (map.get(\"list\").size()) " + map.get("list"));
		System.out.println("������ ���� " + resultPage.toString());
		
		// Model �� View ����
		request.setAttribute("list", map.get("list")); //���� product List �� �� (total�� ���� page�����ִϱ� map ����) 
		request.setAttribute("resultPage", resultPage);
		request.setAttribute("search", search); // �˻� ���ǵ�
		
		return "forward:/purchase/listPurchase.jsp";
	}
	
	
}