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
import com.opensymphony.xwork2.ActionSupport;

public class showcaseSearchAction extends ActionSupport {

	private MemberVO memresultClass;
	private MemberVO memparamClass;
	public static Reader reader; // 파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한
											// sqlMapper객체

	private List<showVO> list = new ArrayList<showVO>();

	private showVO showboard_paramClass = new showVO();
	private showVO showboard_resultClass = new showVO();

	private String searchKeyword;
	private String showboard_category;

	public showcaseSearchAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);

		System.out.println("key:" + searchKeyword); // 키워드를 출력
		System.out.println("c:" + new String(getShowboard_category().getBytes("8859_1"), "UTF-8"));

		if (getShowboard_category() != null && getSearchKeyword() != null) {
			showboard_paramClass = new showVO();
			showboard_paramClass.setSubject("%" + getSearchKeyword() + "%");
			showboard_paramClass.setShowboard_category(new String(getShowboard_category().getBytes("8859_1"), "UTF-8"));

			showboard_category = showboard_paramClass.getShowboard_category();
			list = sqlMapper.queryForList("show.selectSearchC", showboard_paramClass);
		} else {
			list = sqlMapper.queryForList("show.selectSearch", "%" + getSearchKeyword() + "%");
		}

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

	public List<showVO> getList() {
		return list;
	}

	public void setList(List<showVO> list) {
		this.list = list;
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
	
}
