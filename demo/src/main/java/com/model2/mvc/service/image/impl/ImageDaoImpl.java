package com.model2.mvc.service.image.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.domain.ImagesVO;
import com.model2.mvc.domain.ProductVO;
import com.model2.mvc.service.image.ImageDAO;
import com.model2.mvc.service.product.ProductDAO;

//==> 회원관리 DAO CRUD 구현
//@Repository("imageDaoImpl")
public class ImageDaoImpl implements ImageDAO{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public ImageDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method

	@Override
	public int addImage(ImagesVO image) throws Exception {
		System.out.println("[디버깅]imageDaoImpl 에서 image"+image);
		return sqlSession.insert("ImageMapper.addImage", image);
	}

	@Override
	public List<ImagesVO> getImageList(ImagesVO image) throws Exception {
		return sqlSession.selectList("ImageMapper.getImageList", image);
	}
	
}