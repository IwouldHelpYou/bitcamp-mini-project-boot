package com.model2.mvc.service.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.domain.ProductVO;

//DAO���� ���� ��ĵ��� ��� ���� Service Logic �������̽�
public interface ProductService {
	
	public ProductVO getProduct(int prodNo) throws Exception;
	
	//��� HashMap �ƴ϶� Map ���� interface ������� ���� ��
	public Map<String, Object> getProductList(Search search) throws Exception;
	
	
	public void addProduct(ProductVO productVO) throws Exception;
	
	public void updateProduct(ProductVO productVO) throws Exception;

	public boolean checkDuplication(String userId) throws Exception;

	public List<String> getProductAll(String value) throws Exception; // autocomplete����
	
}