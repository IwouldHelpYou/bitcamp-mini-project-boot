package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.model2.mvc.common.Search;
import com.model2.mvc.domain.ProductVO;
import com.model2.mvc.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserDao;
import com.model2.mvc.service.product.ProductDAO;

@Service("ProductService")

@Transactional()
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	@Qualifier("productDAO")
	private ProductDAO productDAO;
	
	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}
	
	public ProductServiceImpl(){
		//******************************************* DAO �� �������ʰ� ���Թ����Ŵϱ�...?�޸�޸�
		//productDAO = new ProductDAO(); 
		
		System.out.println(this.getClass());
	}
	
	public ProductVO getProduct(int ProdNo) throws Exception {
		return productDAO.findProduct(ProdNo);
	}
	
	// ��
	public Map<String,Object> getProductList(Search search) throws Exception {
		System.out.println("ProductService ���� DAO�� ��û��");
		System.out.println(productDAO);
		
		System.out.println("search ���� "+search);
		List<ProductVO> list = productDAO.getProductList(search);
		int totalCount = productDAO.getTotalCount(search);
		System.out.println("ProductService ���� DAO�� ��û�Ϸ�");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		System.out.println("list����"+list.size());
		System.out.println(map);
		
		return map;
	}

	@Override
	public void addProduct(ProductVO productVO) throws Exception {
		productDAO.insertProduct(productVO);
	}

	@Override
	public void updateProduct(ProductVO productVO) throws Exception {
		productDAO.updateProduct(productVO);
		
	}

	@Override//�̿�
	public boolean checkDuplication(String userId) throws Exception {
		boolean result=true;
		/*
		ProductVO productVO = productDAO.findProduct(userId);
		if(productVO != null) {
			result=false;
		}
		*/
		return result;
	}

	@Override //autoComplete ���� �޼ҵ�
	public List<String> getProductAll(String value) throws Exception {
		return productDAO.getProductAll(value);
	}

}