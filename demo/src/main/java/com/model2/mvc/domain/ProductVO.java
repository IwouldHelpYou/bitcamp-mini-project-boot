package com.model2.mvc.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;


public class ProductVO {
	
	//private List<String> imageFiles;
	private String imageFile;
	private String manuDate;
	private int price;
	private String prodDetail;
	private String prodName;
	private int prodNo;
	private Date regDate;
	private String proTranCode; 

	public ProductVO(){
	}

	
//	public List<String> getImageFiles() {
//		return imageFiles;
//	}
	
//	//���� ���� ���������� ArrayList�� ��Ƽ� imageFiles�� �߰���Ű�� ���������
//  public void addImageFile(String filename) {
//      if (this.imageFiles == null) {
//          this.imageFiles = new ArrayList<>();
//      }
//      this.imageFiles.add(filename);
//  }
	
//  //���� ������ List ���·� �������� �׳� �״�� ����
//	public void setImageFiles(List<String> filenames) {
//		this.imageFiles = filenames;
//	}	
	
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}

	public String getProTranCode() {
		return proTranCode;
	}
	public void setProTranCode(String proTranCode) {
		this.proTranCode = proTranCode;
	}
	public String getManuDate() {
		return manuDate;
	}
	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProdDetail() {
		return prodDetail;
	}
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	

	@Override
	public String toString() {
		return "ProductVO [imageFile=" + imageFile + ", manuDate=" + manuDate + ", price="
				+ price + ", prodDetail=" + prodDetail + ", prodName=" + prodName + ", prodNo=" + prodNo + ", regDate="
				+ regDate + ", proTranCode=" + proTranCode + "]";
	}
}