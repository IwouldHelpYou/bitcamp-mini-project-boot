package com.model2.mvc.domain;

public class ImagesVO {

	private String image;
	private int isThumbnail;
	private ProductVO imagesProd;
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public ProductVO getImagesProd() {
		return imagesProd;
	}
	public void setImagesProd(ProductVO imagesProd) {
		this.imagesProd = imagesProd;
	}
	public int getIsThumbnail() {
		return isThumbnail;
	}
	public void setIsThumbnail(int isThumbnail) {
		this.isThumbnail = isThumbnail;
	}
	
	@Override
	public String toString() {
		return "ImagesVO [image=" + image + ", isThumbnail=" + isThumbnail + ", imagesProd=" + imagesProd + "]";
	}

}