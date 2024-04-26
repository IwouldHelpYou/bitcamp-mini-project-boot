package com.model2.mvc.service.image;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.domain.ImagesVO;
import com.model2.mvc.domain.ProductVO;

//DAO���� ���� ��ĵ��� ��� ���� Service Logic �������̽�
public interface ImageService {

	public void addImage(ImagesVO image) throws Exception;

	public List<ImagesVO> getImagesList(ImagesVO image) throws Exception;
}