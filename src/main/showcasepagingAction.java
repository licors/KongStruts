package main;
import admin.showcase.showVO;
import java.util.Map;

public class showcasepagingAction {
	private int currentPage;
	private int totalPage;
	private int totalCount;
	private int blockCount;
	private int blockPage;
	private int startCount;
	private int endCount;
	private int startPage;
	private int endPage;
	
	private String showboard_category;
	private StringBuffer pagingHtml;
	
	public showcasepagingAction(int currentPage, int totalCount, int blockCount, int blockPage, String showboard_category, String searchKeyword){
		this.currentPage=currentPage;
		this.totalCount=totalCount;
		this.blockCount=blockCount;
		this.blockPage=blockPage;
		
		
		//��ü ��������
		totalPage=(int)Math.ceil((double) totalCount / blockCount);
		
		//�ø�
		if(totalPage==0){
			totalPage=1;
		}
		
		//������������ ��ü������ ���� ũ��
		if(currentPage > totalPage){
			currentPage=totalPage;
		}
		
		//������������ ó���� ������ �� ��ȣ ��������
		startCount = (currentPage -1)*blockCount;
		endCount = startCount + blockCount -1;
		
		
		//������������ ������ ������ �� ���ϱ�
		startPage = (int)((currentPage -1)/blockPage)*blockPage+1;
		endPage = startPage+blockPage - 1;
		
		//������ �������� ��ü ������ ������ ũ�� ��ü ������ ���μ���
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		
		//���� block������
		pagingHtml = new StringBuffer();
		if(currentPage > blockPage){
			if(searchKeyword != ""){
				pagingHtml.append("<a href=gboardL.action?currentPage="
						+ (startPage -1) + "&searchKeyword=" + searchKeyword
						+ "&showboard_category=" + showboard_category + ">");
			}else if(showboard_category != null){
				pagingHtml.append("<a href=gboardL.action?currentPage="
						+ (startPage - 1) + "&showboard_category=" + showboard_category
						+ ">");
			}else{
				pagingHtml.append("<a href=gboardL.action?currentPage="
						+ (startPage -1) + ">");
			}
			
			pagingHtml.append("<����>");
			pagingHtml.append("</a>");
		}
		pagingHtml.append("&nbsp;&nbsp;");
		
		
		//������ ��ȣ, ������������ ������ ���� ��ũ ����
		for(int i=startPage; i<=endPage; i++){
			if(i>totalPage){
				break;
			}
			if(i==currentPage){
				pagingHtml.append("&nbsp;<b> <font size='2' color='red'>");	//�۾� ������
				pagingHtml.append(i);
				pagingHtml.append("</font></b>");
			}else{
				pagingHtml.append("&nbsp;<a href='gboardL.action?currentPage=");
				pagingHtml.append(i);
				if(searchKeyword != ""){
					pagingHtml.append("&serachKeyword=" + searchKeyword
							+ "&showboard_category=" + showboard_category);
					pagingHtml.append("'>");
					pagingHtml.append(i);
					pagingHtml.append("</a>");
				}else if(showboard_category != null){
					pagingHtml.append("&showboard_category=" + showboard_category);
					pagingHtml.append("'>");
					pagingHtml.append(i);
					pagingHtml.append("</a>");
				}else{
					pagingHtml.append("'>");
					pagingHtml.append(i);
					pagingHtml.append("</a>");
				}
			}
			pagingHtml.append("&nbsp;");
		}
		
		pagingHtml.append("&nbsp;&nbsp;");
		
		//���� ��� ������
		if(totalPage - startPage >= blockPage){
			if(searchKeyword != ""){
				pagingHtml.append("<a href gboardL.action?currentPage="
						+ "endPage + 1" + "&searchKeyword" + searchKeyword
						+ "&showboard_category=" + showboard_category + ">");
			} else if (showboard_category != null) {
				pagingHtml.append("<a href = gboardL.action?currentPage="
						+ (endPage + 1) + "&showboard_category="
						+ showboard_category + ">");
			} else {
				pagingHtml.append("<a href = gboardL.action?currentPage="
						+ (endPage + 1) + ">");
			}
			pagingHtml.append("<����>");
			pagingHtml.append("</a>");
		}

	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public int getStartCount() {
		return startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public String getshowboard_category() {
		return showboard_category;
	}

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}

	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setshowboard_category(String showboard_category) {
		this.showboard_category = showboard_category;
	}

	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
	
	

}
