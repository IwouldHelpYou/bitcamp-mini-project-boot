// ��ǰ �󼼺���
// getProduct.do �� ������ getProductAction ���� �����ؼ� ����
// productService �� �ҷ��� ProductDAO�� findProduct DBMS �� �����Ѵ�

package com.model2.mvc.view.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.domain.ProductVO;

// P/L�� Action �� ����� �޾� DB ��ȸ�� DAO���� ��û��

public class GetProductAction extends Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String ProdNo = request.getParameter("prodNo");
		
		ProductService service = new ProductServiceImpl();
		ProductVO vo = service.getProduct(ProdNo);
		
		System.out.println("/getProductAction.java");
		System.out.println("ProductVO�� " + vo);
		
		request.setAttribute("vo", vo);
		
		return "forward:/product/readProduct.jsp";
	}
	
	
	
}