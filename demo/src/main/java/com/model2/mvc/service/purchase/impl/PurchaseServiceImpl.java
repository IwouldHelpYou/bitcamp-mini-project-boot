package com.model2.mvc.service.purchase.impl;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model2.mvc.domain.PurchaseVO;
import com.model2.mvc.service.product.ProductDAO;
import com.model2.mvc.service.purchase.PurchaseDAO;
import com.model2.mvc.service.purchase.PurchaseService;

@Repository("PurchaseService")

@Transactional()
public class PurchaseServiceImpl implements PurchaseService {

	///Field
	@Autowired
	@Qualifier("purchaseDAO")
	private PurchaseDAO purchaseDAO;

	public void setProductDAO(PurchaseDAO purchaseDAO) {
		this.purchaseDAO = purchaseDAO;
	}
	
	public PurchaseServiceImpl(){
		//******************************************* DAO 를 만들어쓰지않고 주입받을거니까...?메모메모
		//productDAO = new ProductDAO(); 
		
		System.out.println(this.getClass());
	}

	@Override
	public void purchaseProduct(PurchaseVO purchase) throws Exception {
		// TODO Auto-generated method stub
		purchaseDAO.addPurchase(purchase);
	}

	@Override
	public List<PurchaseVO> getPurchaseList(String userId) throws Exception {
		return purchaseDAO.getPurchaseList(userId);
		
	}

	@Override
	public PurchaseVO findPurchase(PurchaseVO purchase) throws Exception {
		return purchaseDAO.findPurchase(purchase);
	}

	@Override
	public void updatePurchase(PurchaseVO purchase) throws Exception {
		// TODO Auto-generated method stub
		purchaseDAO.updatePurchase(purchase);
	}

}