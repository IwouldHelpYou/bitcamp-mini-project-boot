#1. 
�˻����� �ְ� ������ Ŭ���� �˻����� ���� (01���� ��)

#2. 
������ ������ ���� ��������°� ���� ����� �����ȵ�
Page.java ����� DAO���� resultPage ���� ����� �� �ؾ��ϴµ� JSó������

// beginUnitPage, endUnitPage, maxPage(totalPage)�� �����ϴ� Page.java �� ��������
   ProductAction ���� Page �� ����� ����

   ServletContext ���� �޾ƿ��� pageSize ó��, 
   ServletContext ���� searchVO���� �޴� pageUnit�� �������� �޾ƿͼ� Page�� ����
   (ListProudctAction���� web.xml �޾ƿ� ó��)
   
// (SearchVO)�� Page ����µ��� �̿��� (Search.java �� ����)
	Search ������ PageSize, Currentpage, SearchCondition, SearchKeyword ������
	
// null,Date ���� str ó���ϴ� CommonUtil.java �߰�

#3. 
ROWNUM �Ἥ currentPage �����͸� �޾ƿ��°͵� �����ȵ�
// DAO���� makeCurrentPageSql, getTotalCount ���� �������� getProductList ���ƾ���ߵ�
// DAO ���� page�� ���� getTotalCount �� ����
UI, ��ٱ���-�����Ǹ�(?) ��� �������ϰ� ������