package com.model2.mvc.view.product;
// ��ǰ ��������
// updateProduct.do �� ������ UpdateProductAction ���� �����ؼ� ����
// productService �� �ҷ��� ProductDAO�� updateProduct DBMS �� �����Ѵ�

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.*;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.domain.ProductVO;

public class UpdateProductAction extends Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// ��ǰ �󼼺��� readProduct.jsp ���� ���� ������ prodNo�� �Բ� �Ѿ��
		
		System.out.println("/updateProductAction.do");
		
		// ������ư Ŭ������ request�� �����ִ� prodNo
		String prodNo=(String)request.getParameter("prodNo"); 
		System.out.println(request.getParameter("prodName"));
		
		System.out.println("prodNO "+prodNo+" ������");
		
		// �����ϸ鼭 form ���� ���� refreshed ���� ���Ӱ� �������
		ProductVO productVO=new ProductVO();
		productVO.setProdNo(Integer.parseInt(prodNo));
		productVO.setProdName(request.getParameter("prodName"));
		productVO.setProdDetail(request.getParameter("prodDetail"));
		productVO.setManuDate(request.getParameter("manuDate"));
		productVO.setPrice(Integer.parseInt(request.getParameter("price")));
		productVO.setRegDate(Date.valueOf(request.getParameter("regDate")));
		
		System.out.println("productVO ������ "+productVO);
		System.out.println("RegDate�� " + productVO.getRegDate());
		

		
		HttpSession session=request.getSession();
		
		if(session.getAttribute("user")!= null) {
			String sessionId=((User)session.getAttribute("user")).getUserId();
			System.out.println("sessionId�� " + sessionId);
		}
		/*
		if(sessionId.equals(userId)){
			session.setAttribute("user", userVO);
		}
		////////////////////*/

		ProductService service=new ProductServiceImpl();
		service.updateProduct(productVO);
		
		return "redirect:/getProduct.do?prodNo="+prodNo;
	}
	
	
}