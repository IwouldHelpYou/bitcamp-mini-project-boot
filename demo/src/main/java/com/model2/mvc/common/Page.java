package com.model2.mvc.common;


public class Page {
	
	///Field
	private int currentPage;		// ���������� 			  (����Ʃ��)
	private int totalCount;			// �� �Խù� ��
	private int pageUnit;			// �ϴ� ������ ��ȣ ȭ�鿡 �������� ����
	private int pageSize;			// �� �������� �������� �Խù���
	private int maxPage;			// ��ü �������� 		  (������)
	private int beginUnitPage;	//ȭ�鿡 �������� ������ ��ȣ�� �ּҼ� (������)
	private int endUnitPage;	//ȭ�鿡 �������� ������ ��ȣ�� �ִ�� (������)
	
	///Constructor
	public Page() {
	}
	public Page( int currentPage, int totalCount, int pageUnit, int pageSize ) {
		this.totalCount = totalCount;
		this.pageUnit = pageUnit;
		this.pageSize = pageSize;
		
		this.maxPage = (pageSize == 0) ? totalCount :  (totalCount-1)/pageSize +1;
		// pageSize 1�̸� maxPage12 = totalCount12 �Ǿ���� (ok)
		// pageSize 2�̸� maxpage6  = totalCount12 �Ǿ���� (ok)
		// pageSize 3�̸� maxPage9  = totalCount27 �Ǿ���� (ok)
		// ���� pageSize 0 �̸� �׳� maxPage �� 12�� ó����. (���������������� ������ �ٺ����ַ��ϳ�?)
		
		this.currentPage = ( currentPage > maxPage) ? maxPage : currentPage;
		// currentPage �� �������� �Ѿ�� �׳� maxPage �� ������ ��
		
		this.beginUnitPage = ( (currentPage-1) / pageUnit ) * pageUnit +1 ;
		// ���� 6�������� ������ 5���� �����ش��ϸ� (5/5)*5+1 = 6 �� ����������
		// ���� 11�������� �� ȭ�鿡 5���� �����شٸ� (10/5)*5+1= 11 �� ����������
		// �� �������������� 6~10 �� ����������� 6�� ���������� ���ϼ�
		
		if( maxPage <= pageUnit ){
			this.endUnitPage = maxPage;
		}else{
			this.endUnitPage = beginUnitPage + (pageUnit -1);
			if( maxPage <= endUnitPage){
				this.endUnitPage = maxPage;
			}
		}
		// ���������� 5���� �����ִµ� ��ü������9�� �̺��� ������ ���������� ��ü������
		// ����                ��ü������9�� �̺��� ũ��  ���������� + 4�� ��������
		// ��                 ��ü������9�� ���������������� ������ ���������� ��ü������
	}
	
	///Mehtod
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getBeginUnitPage() {
		return beginUnitPage;
	}
	public void setBeginUnitPage(int beginUnitPage) {
		this.beginUnitPage = beginUnitPage;
	}
	public int getEndUnitPage() {
		return endUnitPage;
	}
	public void setEndUnitPage(int endUnitPage) {
		this.endUnitPage = endUnitPage;
	}
	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", totalCount="
				+ totalCount + ", pageUnit=" + pageUnit + ", pageSize="
				+ pageSize + ", maxPage=" + maxPage + ", beginUnitPage="
				+ beginUnitPage + ", endUnitPage=" + endUnitPage + "]";
	}
}