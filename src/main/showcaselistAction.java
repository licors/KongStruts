package main;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import member.MemberVO;
import admin.showcase.showVO;
/*import admin.pagingAction;*/

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class showcaselistAction extends ActionSupport {
	private MemberVO memresultClass;
	private MemberVO memparamClass;
	public static Reader reader; // 파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper객체

    private List<showVO> list1 = new ArrayList<showVO>();
    private List<showVO> list2 = new ArrayList<showVO>();
    private List<showVO> list3 = new ArrayList<showVO>();

    private showVO showboard_paramClass = new showVO();
    private showVO showboard_resultClass = new showVO();

    private String searchKeyword;
    private String showboard_category;

/*	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 20; // 한 페이지의 게시물의 수
	private int blockPage = 3; // 한 화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private String pagingHtml;
	private pagingAction adpage;
	private int num = 0;*/

	// 생성자
	public showcaselistAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		// sqlMapConfig.xml 파일의 설정내용을 가져옴
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}


	//일반회원 상품목록 리스트처리
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		
		int sessionid = (Integer)session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("userCheck", sessionid);
		// 검색값이 있으면 search()메서드를 호출.
		if (getShowboard_category() != null) {
			return category();
		}

		if (getSearchKeyword() != null) {
			return search();
		}
        showboard_paramClass.setShowboard_category("전시");
        list1 = sqlMapper.queryForList("show.select_9", showboard_paramClass);
        showboard_paramClass.setShowboard_category("미술");
        list2 = sqlMapper.queryForList("show.select_9", showboard_paramClass);
        showboard_paramClass.setShowboard_category("이벤트");
        list3 = sqlMapper.queryForList("show.select_9", showboard_paramClass);
		
        return SUCCESS;
	}

/*		// 모튼 글을 가져와 list에 넣는다.
		list = sqlMapper.queryForList("selectall");

		totalCount = list.size();// 전체 글 갯수를 구한다.
		// pagingAction객체 생성.
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage,
				showboard_category, "");
		pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML생성.

		// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount = totalCount;

		// 현제 페이지의 마지막 글의 번호가 전체의 마지막 글번호보다 작으면
		// lastCount를 +1 번호로 설정.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// 1부터 마지막갯수까지 리스트를 가져온다.
		list = list.subList(1, lastCount);

		return SUCCESS;
	}*/

	
/*	//운영자 상품목록 리스트처리
	public String execute2() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		int sessionid = (Integer)session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("userCheck", sessionid);

		if (getShowboard_category() != null) {
			return adcategory();
		}

		if (getSearchKeyword() != null) {
			return adsearch();
		}

		showboard_paramClass = new showVO();

		//showboard_category = "";
		// 모튼 글을 가져와 list에 넣는다.
		list = sqlMapper.queryForList("selectall", showboard_paramClass);

		totalCount = list.size();// 전체 글 갯수를 구한다.
		// pagingAction객체 생성.
		adpage = new pagingAction(currentPage, totalCount, blockCount,
				blockPage, showboard_category, "");
		pagingHtml = adpage.getpagingHtml().toString(); // 페이지 HTML생성.

		// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount = totalCount;

		// 현제 페이지의 마지막 글의 번호가 전체의 마지막 글번호보다 작으면
		// lastCount를 +1 번호로 설정.
		if (adpage.getEndCount() < totalCount)
			lastCount = adpage.getEndCount() + 1;

		// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
		list = list.subList(adpage.getStartCount(), lastCount);
		return SUCCESS;
	}*/

	
	//메인 카테고리
	public String category() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		
		int sessionid = (Integer)session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("userCheck", sessionid);
		
		showboard_paramClass = new showVO();
		/*showboard_paramClass.setShowboard_category(getShowboard_category());
		list = sqlMapper.queryForList("goodsselectCategory", showboard_paramClass);
		totalCount = list.size(); // 전체 글 갯수를 구한다.*/		
        showboard_paramClass.setShowboard_category("전시");
        list1 = sqlMapper.queryForList("show.select_9", showboard_paramClass);
        showboard_paramClass.setShowboard_category("미술");
        list2 = sqlMapper.queryForList("show.select_9", showboard_paramClass);
        showboard_paramClass.setShowboard_category("이벤트");
        list3 = sqlMapper.queryForList("show.select_9", showboard_paramClass);

/*		// pagingAction 객체 생성
		page = new pagingAction(action_name, currentPage, totalCount, blockCount, blockPage, "");
		pagingHtml = page.getPagingHtml().toString(); // 페이지HTML 생성.

		// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount = totalCount;

		// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 lastCount를 +1 번호로 설정.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
		list = list.subList(page.getStartCount(), lastCount);*/

		return SUCCESS;
	}

	//메인 상품검색
	public String search() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		
		int sessionid = (Integer)session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("userCheck", sessionid);
		
/*		// searchKeyword = new
		// String(searchKeyword.getBytes("iso-8859-1"),"euc-kr");
		System.out.print(searchKeyword); // 키워드를 출력

		list = sqlMapper.queryForList("goodsselectSearch", "%" + getSearchKeyword() + "%"); // search 쿼리 수행

		totalCount = list.size();
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage,
				showboard_category, getSearchKeyword());
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);*/

		return SUCCESS;
	}


/*	public String adcategory() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		String sessionid = (String) session.get("id");
		memresultClass = (MemberVO) sqlMapper.queryForObject("userCheck", sessionid);
		
		showboard_paramClass = new showVO();
		showboard_paramClass.setshowboard_category(getShowboard_category());
		list = sqlMapper.queryForList("goodsselectCategory", showboard_paramClass);

		totalCount = list.size(); // 전체 글 갯수를 구한다.

		// pagingAction 객체 생성
		adpage = new pagingAction(action_name, currentPage, totalCount, blockCount, blockPage, "");
		pagingHtml = adpage.getpagingHtml().toString(); // 페이지HTML 생성.

		// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount = totalCount;

		// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 lastCount를 +1 번호로 설정.
		if (adpage.getEndCount() < totalCount)
			lastCount = adpage.getEndCount() + 1;

		// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
		list = list.subList(adpage.getStartCount(), lastCount);

		return SUCCESS;
	}*/
/*	public String adsearch() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		String sessionid = (String) session.get("id");
		memresultClass = (MemberVO) sqlMapper.queryForObject("userCheck", sessionid);
		
		// searchKeyword = new
		// String(searchKeyword.getBytes("iso-8859-1"),"euc-kr");
		System.out.print(searchKeyword); // 키워드를 출력

		list = sqlMapper.queryForList("goodsselectSearch", "%" + getSearchKeyword() + "%"); // search 쿼리 수행

		totalCount = list.size();
		adpage = new pagingAction(currentPage, totalCount, blockCount, blockPage,
				showboard_category, getSearchKeyword());
		pagingHtml = adpage.getpagingHtml().toString();

		int lastCount = totalCount;

		if (adpage.getEndCount() < totalCount)
			lastCount = adpage.getEndCount() + 1;

		list = list.subList(adpage.getStartCount(), lastCount);

		return SUCCESS;
	}
*/

	public MemberVO getMemresultClass() {
		return memresultClass;
	}


	public void setMemresultClass(MemberVO memresultClass) {
		this.memresultClass = memresultClass;
	}


	public MemberVO getMemparamClass() {
		return memparamClass;
	}


	public void setMemparamClass(MemberVO memparamClass) {
		this.memparamClass = memparamClass;
	}


	public static Reader getReader() {
		return reader;
	}


	public static void setReader(Reader reader) {
		showcaselistAction.reader = reader;
	}


	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}


	public static void setSqlMapper(SqlMapClient sqlMapper) {
		showcaselistAction.sqlMapper = sqlMapper;
	}


	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	public String getShowboard_category() {
		return showboard_category;
	}


	public void setShowboard_category(String showboard_category) {
		this.showboard_category = showboard_category;
	}


	public showVO getShowboard_paramClass() {
		return showboard_paramClass;
	}


	public void setShowboard_paramClass(showVO showboard_paramClass) {
		this.showboard_paramClass = showboard_paramClass;
	}


	public showVO getShowboard_resultClass() {
		return showboard_resultClass;
	}


	public void setShowboard_resultClass(showVO showboard_resultClass) {
		this.showboard_resultClass = showboard_resultClass;
	}


	public List<showVO> getList1() {
		return list1;
	}


	public void setList1(List<showVO> list1) {
		this.list1 = list1;
	}


	public List<showVO> getList2() {
		return list2;
	}


	public void setList2(List<showVO> list2) {
		this.list2 = list2;
	}


	public List<showVO> getList3() {
		return list3;
	}


	public void setList3(List<showVO> list3) {
		this.list3 = list3;
	}
}
