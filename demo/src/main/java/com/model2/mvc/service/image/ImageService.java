package com.model2.mvc.service.image;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.domain.ImagesVO;
import com.model2.mvc.domain.ProductVO;

//DAO에게 내릴 명렬들을 모아 놓은 Service Logic 인터페이스
public interface ImageService {

	public void addImage(ImagesVO image) throws Exception;

	public List<ImagesVO> getImagesList(ImagesVO image) throws Exception;
}