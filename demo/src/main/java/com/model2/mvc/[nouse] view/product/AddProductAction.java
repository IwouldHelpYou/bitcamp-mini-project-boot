// ��ǰ�� ���
// addProduct.do �� ������ AddProductAction ���� �����ؼ� ����
// productService �� �ҷ��� ProductDAO�� insertProduct DBMS �� �����Ѵ�

package com.model2.mvc.view.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.ProductVO;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;


public class AddProductAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// DBMS�� ��ǰ ����ϵ��� �ϴ� �ڵ�
		System.out.println("/addProduct.do");
		
		ProductVO productVO=new ProductVO();
		
		productVO.setProdName(request.getParameter("prodName"));
		productVO.setProdDetail(request.getParameter("prodDetail"));
		productVO.setManuDate(request.getParameter("manuDate"));
		productVO.setPrice(Integer.parseInt(request.getParameter("price")));
		
		System.out.println(productVO);
		
		ProductService service=new ProductServiceImpl();
		service.addProduct(productVO);
		
		request.setAttribute("productVO", productVO); //����Ȯ�������� ������
		
		return "forward:/product/addProductConfirm.jsp"; //����
	}
	
	
}