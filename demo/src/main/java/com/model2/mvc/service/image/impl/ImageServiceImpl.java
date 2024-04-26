package com.model2.mvc.service.image.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.model2.mvc.common.Search;
import com.model2.mvc.domain.ImagesVO;
import com.model2.mvc.domain.ProductVO;
import com.model2.mvc.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserDao;
import com.model2.mvc.service.image.ImageDAO;
import com.model2.mvc.service.image.ImageService;
import com.model2.mvc.service.product.ProductDAO;

@Service("imageService")

@Transactional()
public class ImageServiceImpl implements ImageService {
	
	@Autowired
	@Qualifier("imageDAO")
	private ImageDAO imageDAO;
	
	public void setProductDAO(ImageDAO imageDAO) {
		this.imageDAO = imageDAO;
	}
	
	public ImageServiceImpl(){
		//******************************************* DAO 를 만들어쓰지않고 주입받을거니까...?메모메모
		//productDAO = new ProductDAO(); 
		
		System.out.println(this.getClass());
	}
	
	@Override
	public void addImage(ImagesVO image) throws Exception {
		System.out.println("[디버깅]imageServiceImpl 에서 image"+image);
		imageDAO.addImage(image);
	}
	
	public List<ImagesVO> getImagesList(ImagesVO image) throws Exception{
		return imageDAO.getImageList(image);
	}; 


}