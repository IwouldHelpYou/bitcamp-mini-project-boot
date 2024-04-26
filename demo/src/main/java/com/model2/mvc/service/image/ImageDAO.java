package com.model2.mvc.service.image;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.model2.mvc.common.Search;
import com.model2.mvc.domain.ImagesVO;
import com.model2.mvc.domain.ProductVO;

//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition

@Mapper
public interface ImageDAO {
	
	// INSERT
	public int addImage(ImagesVO image) throws Exception ;

	public List<ImagesVO> getImageList(ImagesVO image) throws Exception ;
	

}