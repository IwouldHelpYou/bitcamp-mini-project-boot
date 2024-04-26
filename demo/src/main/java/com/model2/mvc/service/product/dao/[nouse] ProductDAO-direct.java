package com.model2.mvc.service.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.model2.mvc.common.Search;
import com.model2.mvc.common.util.DBUtil;
import com.model2.mvc.service.product.vo.ProductVO;

public class ProductDAO {
	
	public ProductDAO(){
		
	}
	
	public ProductVO findProduct(String ProdNo) throws Exception{
		
		Connection con = DBUtil.getConnection();
		
		String sql = "SELECT * FROM PRODUCT where PROD_NO=?";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, ProdNo);

		ResultSet rs = stmt.executeQuery();

		ProductVO productVO = null;
		while (rs.next()) {
		    productVO = new ProductVO();
		    productVO.setProdNo(rs.getInt("PROD_NO"));
		    productVO.setProdName(rs.getString("PROD_NAME"));
		    productVO.setProdDetail(rs.getString("PROD_DETAIL"));
		    productVO.setManuDate(rs.getString("MANUFACTURE_DAY"));
		    productVO.setPrice(rs.getInt("PRICE"));
		    productVO.setRegDate(rs.getDate("REG_DATE"));
		}
		
		con.close();
		System.out.println("/ProductDAO findProduct �Ϸ�");
		System.out.println("findProduct DB ��ȸ��� " + productVO.getProdName());
		
		return productVO;
	}

	public HashMap<String, Object> getProductList(Search search) throws Exception {
		
		System.out.println("getProductList ����!");
		System.out.println("�˻����� serachVO => "+ search.toString());
		
		Connection con = DBUtil.getConnection();
		
		String sql = "select * from product ";
		if (search.getSearchCondition() != null) {
			if (search.getSearchCondition().equals("0")) {
				sql += " where PROD_NO='" + search.getSearchKeyword()
						+ "'";
			} else if (search.getSearchCondition().equals("1")) {
				sql += " where PROD_NAME LIKE '%" + search.getSearchKeyword()
						+ "%'";
			}
		}
	
		sql += " order by PROD_NO DESC";
		
		System.out.println("ProductDAO :: Original SQL :: " + sql);
		
		//==> TotalCount GET
		int totalCount = this.getTotalCount(sql);
		System.out.println("ProductDAO :: totalCount  :: " + totalCount);
		
		//==> CurrentPage �Խù��� �޵��� Query �ٽñ���
		sql = makeCurrentPageSql(sql, search);
		PreparedStatement stmt = con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		
		/////////////////////DB ��ȸ�� �ѹ��� ��ü�� �ϰ� ���� ///////////////
		// PreparedStatement stmt = 
		//	con.prepareStatement(	sql,
		//												ResultSet.TYPE_SCROLL_INSENSITIVE,
		//												ResultSet.CONCUR_UPDATABLE);
		// TYPE_SCROLL_INSESITIVE : Ŀ�� ���Ʒ��� �̵�
		// CONCUR_UPDATBLE : 
		//
		// rs.last(); // Ŀ�� �� ������ �����ڴ�
		// int total = rs.getRow(); // ���� �� ��ȣ ����
		// System.out.println("�ο��� ��:" + total);
		//
		// rs.absolute(search.getCurrentPage() * search.getPageSize() - search.getPageSize()+1); // �ش��ϴ� ������ Ŀ���̵�
		//
		//	if (totalCount > 0) {
		//		for (int i = 0; i < search.getPageSize(); i++) {
		//			
		//			ProductVO vo = new ProductVO();
		//			vo.setProdNo(rs.getInt("PROD_NO"));
		//			vo.setProdName(rs.getString("PROD_NAME"));
		//			vo.setProdDetail(rs.getString("PROD_DETAIL"));
		//			vo.setManuDate(rs.getString("MANUFACTURE_DAY"));        
		//			vo.setPrice(rs.getInt("PRICE"));
		//			vo.setRegDate(rs.getDate("REG_DATE"));
		//			 
		//			list.add(vo);
		//			if (!rs.next())
		//				break;
		//		}
		//	}
		////////////////////////////////////////////////////////////

		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("totalCount", new Integer(totalCount));

		System.out.println("searchVO.getCurrentPage():" + search.getCurrentPage());
		System.out.println("searchVO.getPageSize():" + search.getPageSize());
		
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		
		while(rs.next()) {
			ProductVO product = new ProductVO();
			product.setProdNo(rs.getInt("PROD_NO"));
			product.setProdName(rs.getString("PROD_NAME"));
			product.setProdDetail(rs.getString("PROD_DETAIL"));
			product.setManuDate(rs.getString("MANUFACTURE_DAY"));        
			product.setPrice(rs.getInt("PRICE"));
			product.setRegDate(rs.getDate("REG_DATE"));
			product.setProTranCode(rs.getString("PROD_TRANCODE"));
			list.add(product);
			System.out.println("PRO_TRANCODE��"+rs.getString("PROD_TRANCODE"));
		}

		System.out.println("list.size() : "+ list.size());
		map.put("list", list);
		System.out.println("map().size() : "+ map.size());

		con.close();
		System.out.println("/ProductDAO getProductList �Ϸ�");
		return map;
	}

	
	public void insertProduct(ProductVO productVO) throws Exception {
		Connection con = DBUtil.getConnection();
		System.out.println("/ProductDAO => " + productVO.toString());
		
		String sql = "INSERT INTO PRODUCT VALUES (seq_product_prod_no.nextval,?,?,?,?,?,sysdate,'�Ǹ���')";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, productVO.getProdName()); //'�Ｚ����'
		stmt.setString(2, productVO.getProdDetail()); //'��Ʈ��'
		stmt.setString(3, productVO.getManuDate().replace("-", "")); //'20120212'
		stmt.setInt(4, productVO.getPrice()); //600000
		stmt.setString(5, productVO.getFileName()); //'AHlbAAAAug1vsgAA.jpg'
		
		//stmt.setString(8, productVO.getProTranCode())
		stmt.executeUpdate();
			
		System.out.println("/ProductDAO insert �Ϸ�");
		con.close();
	}
	
	public void updateProduct(ProductVO productVO) throws Exception {
		
		Connection con = DBUtil.getConnection();

		String sql = "UPDATE PRODUCT SET PROD_NAME=?, PROD_DETAIL=?, MANUFACTURE_DAY=?, PRICE=?, REG_DATE=? WHERE PROD_NO=?";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, productVO.getProdName());
		stmt.setString(2, productVO.getProdDetail());
		stmt.setString(3, productVO.getManuDate());
		stmt.setInt(4, productVO.getPrice());
		stmt.setDate(5, productVO.getRegDate());
		stmt.setInt(6, productVO.getProdNo());
		stmt.executeUpdate();
		
		System.out.println("/ProductDAO update �Ϸ�");
		con.close();
	}
	
	
	// �Խ��� Page ó���� ���� ��ü Row(totalCount)  return
	private int getTotalCount(String sql) throws Exception {
		
		sql = "SELECT COUNT(*) "+
		          "FROM ( " +sql+ ") countTable";
		
		Connection con = DBUtil.getConnection();
		PreparedStatement pStmt = con.prepareStatement(sql);
		ResultSet rs = pStmt.executeQuery();
		
		int totalCount = 0;
		if( rs.next() ){
			totalCount = rs.getInt(1);
		}
		
		pStmt.close();
		con.close();
		rs.close();
		
		return totalCount;
	}

	
	private String makeCurrentPageSql(String sql , Search search){
		sql = 	"SELECT * "+ 
				"FROM "+
				"(	  "+
				"	SELECT inner_table. * ,  ROWNUM AS row_seq " +
				" 	FROM (	"+sql+" ) inner_table "+
				"	WHERE ROWNUM <="+search.getCurrentPage()*search.getPageSize()+
				") " +
				"WHERE row_seq BETWEEN "+((search.getCurrentPage()-1)*search.getPageSize()+1) +" AND "+search.getCurrentPage()*search.getPageSize();
		
		System.out.println("UserDAO :: make SQL :: "+ sql);	
		
		return sql;
	}

}