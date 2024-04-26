package com.model2.mvc.service.purchase;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.model2.mvc.common.Search;
import com.model2.mvc.domain.ProductVO;
import com.model2.mvc.domain.PurchaseVO;

//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition

@Mapper
public interface PurchaseDAO {
	
	// INSERT
	public int addPurchase(PurchaseVO purchase) throws Exception;

	public List<PurchaseVO> getPurchaseList(String userId) throws Exception;
	
	public PurchaseVO findPurchase(PurchaseVO purchase) throws Exception;
	
	public void updatePurchase(PurchaseVO purchase) throws Exception;
}