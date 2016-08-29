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
		
		
		//전체 페이지수
		totalPage=(int)Math.ceil((double) totalCount / blockCount);
		
		//올림
		if(totalPage==0){
			totalPage=1;
		}
		
		//현재페이지가 전체페이지 보다 크면
		if(currentPage > totalPage){
			currentPage=totalPage;
		}
		
		//현재페이지의 처음과 마지막 글 번호 가져오기
		startCount = (currentPage -1)*blockCount;
		endCount = startCount + blockCount -1;
		
		
		//시작페이지와 마지막 페이지 값 구하기
		startPage = (int)((currentPage -1)/blockPage)*blockPage+1;
		endPage = startPage+blockPage - 1;
		
		//마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로설정
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		
		//이전 block페이지
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
			
			pagingHtml.append("<이전>");
			pagingHtml.append("</a>");
		}
		pagingHtml.append("&nbsp;&nbsp;");
		
		
		//페이지 번호, 현재페이지는 빨간색 강조 링크 제거
		for(int i=startPage; i<=endPage; i++){
			if(i>totalPage){
				break;
			}
			if(i==currentPage){
				pagingHtml.append("&nbsp;<b> <font size='2' color='red'>");	//글씨 빨간색
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
		
		//다음 블로 페이지
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
			pagingHtml.append("<다음>");
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
