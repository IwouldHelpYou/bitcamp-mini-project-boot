package com.model2.mvc.service.purchase.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.domain.ProductVO;
import com.model2.mvc.domain.PurchaseVO;
import com.model2.mvc.service.purchase.PurchaseDAO;

//@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDAO{

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int addPurchase(PurchaseVO purchase) throws Exception {
		System.out.println("mapper에 쿼리날리기전 purchase 확인 => " + purchase);
		return sqlSession.insert("PurchaseMapper.addPurchase", purchase);
	}

	@Override
	public List<PurchaseVO> getPurchaseList(String userId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(sqlSession.selectList("PurchaseMapper.getPurchaseList", userId));
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", userId);
	}

	@Override
	public PurchaseVO findPurchase(PurchaseVO purchase) throws Exception {
		System.out.println(sqlSession.selectList("PurchaseMapper.getPurchase", purchase));
		return (PurchaseVO) sqlSession.selectOne("PurchaseMapper.getPurchase", purchase);
	}

	@Override
	public void updatePurchase(PurchaseVO purchase) throws Exception {
		System.out.println(sqlSession.update("PurchaseMapper.updatePurchase", purchase));
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);		
	}


}