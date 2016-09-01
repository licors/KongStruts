package main;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import member.MemberVO;
import admin.showcase.showVO;

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

	// 생성자
	public showcaselistAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		// sqlMapConfig.xml 파일의 설정내용을 가져옴
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}


	//일반회원  메인화면 상품목록
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		
		int sessionid = (Integer)session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("userCheck", sessionid);
		// 검색값이 있으면 category()메서드를 호출.
		if (getShowboard_category() != null) {
			return category();
		// 검색값이 있으면 search()메서드를 호출
		}
		if (getSearchKeyword() != null) {
			return search();
		}
		showboard_paramClass = new showVO();
        showboard_paramClass.setShowboard_category("전시");
        list1 = sqlMapper.queryForList("show.select_9", showboard_paramClass);
        showboard_paramClass.setShowboard_category("미술");
        list2 = sqlMapper.queryForList("show.select_9", showboard_paramClass);
        showboard_paramClass.setShowboard_category("이벤트");
        list3 = sqlMapper.queryForList("show.select_9", showboard_paramClass);
		
        return SUCCESS;
	}
	
    //운영자 메인화면 상품목록
	public String execute2() throws Exception {
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
		showboard_paramClass = new showVO();
        showboard_paramClass.setShowboard_category("전시");
        list1 = sqlMapper.queryForList("show.select_9", showboard_paramClass);
        showboard_paramClass.setShowboard_category("미술");
        list2 = sqlMapper.queryForList("show.select_9", showboard_paramClass);
        showboard_paramClass.setShowboard_category("이벤트");
        list3 = sqlMapper.queryForList("show.select_9", showboard_paramClass);
		
        return SUCCESS;
	}


	//일반회원 메인 카테고리 클릭
	public String category() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		
		int sessionid = (Integer)session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("userCheck", sessionid);
		
		showboard_paramClass = new showVO();
        showboard_paramClass.setShowboard_category("전시");
        list1 = sqlMapper.queryForList("show.select_category", showboard_paramClass);
        showboard_paramClass.setShowboard_category("미술");
        list2 = sqlMapper.queryForList("show.select_category", showboard_paramClass);
        showboard_paramClass.setShowboard_category("이벤트");
        list3 = sqlMapper.queryForList("show.select_category", showboard_paramClass);

		return SUCCESS;
	}

	//일반회원 메인 상품검색
	public String search() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		
		int sessionid = (Integer)session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("userCheck", sessionid);
		System.out.print(searchKeyword); // 키워드를 출력
		showboard_paramClass = new showVO();
		

        showboard_paramClass.setShowboard_category("전시");
        list1 = sqlMapper.queryForList("selectSearch", "%" + getSearchKeyword() + "%");
        showboard_paramClass.setShowboard_category("미술");
        list2 = sqlMapper.queryForList("selectSearch", "%" + getSearchKeyword() + "%");
        showboard_paramClass.setShowboard_category("이벤트");
        list3 = sqlMapper.queryForList("selectSearch", "%" + getSearchKeyword() + "%");
		return SUCCESS;
	}

    //관리자  메인 카테고리 클릭
	public String adcategory() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		
		int sessionid = (Integer)session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("userCheck", sessionid);
		
		showboard_paramClass = new showVO();
        showboard_paramClass.setShowboard_category("전시");
        list1 = sqlMapper.queryForList("show.select_category", showboard_paramClass);
        showboard_paramClass.setShowboard_category("미술");
        list2 = sqlMapper.queryForList("show.select_category", showboard_paramClass);
        showboard_paramClass.setShowboard_category("이벤트");
        list3 = sqlMapper.queryForList("show.select_category", showboard_paramClass);

		return SUCCESS;
	}

	// 관리자 메인 상품검색
	public String adsearch() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		
		int sessionid = (Integer)session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("userCheck", sessionid);
		System.out.print(searchKeyword); // 키워드를 출력
		showboard_paramClass = new showVO();
		
		list1 = sqlMapper.queryForList("selectSearch", "%" + getSearchKeyword() + "%"); // search 쿼리 수행
		
		return SUCCESS;
	}

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
