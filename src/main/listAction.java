package main;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import member.MemberVO;
import admin.pagingAction;
import admin.showcase.showVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class listAction extends ActionSupport {
	private MemberVO memresultClass;
	private MemberVO memparamClass;
	public static Reader reader; // ���� ��Ʈ���� ���� reader
	public static SqlMapClient sqlMapper; // SqlMapClient API�� ����ϱ� ����
											// sqlMapper��ü

	private List<showVO> list = new ArrayList<showVO>();

	private showVO showboard_paramClass = new showVO();
	private showVO showboard_resultClass = new showVO();

	private String searchKeyword; // �Էµ� �˻� Ű����
	private String showboard_category;

	private int currentPage = 1; // ���� ������
	private int totalCount; // �� �Խù��� ��
	private int blockCount = 20; // �� �������� �Խù��� ��
	private int blockPage = 3; // �� ȭ�鿡 ������ ������ ��
	private String pagingHtml; // ����¡�� ������ HTML
	private String adpagingHtml;
	private showcasepagingAction page; // ����¡ Ŭ����
	private pagingAction adpage;
	private int num = 0;

	// ������
	public listAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		// sqlMapConfig.xml ������ ���������� ������
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);

		reader.close();
	}

	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		String sessionid = (String) session.get("email");
		memresultClass = (MemberVO) sqlMapper.queryForObject("UserCheck", sessionid);
		// �˻����� ������ search()�޼��带 ȣ��.
		if (getShowboard_category() != null) {
			return category();
		}

		if (getSearchKeyword() != null) {
			return search();
		}

		// ��ư ���� ������ list�� �ִ´�.
		list = sqlMapper.queryForList("goodsselectAll");

		totalCount = list.size();// ��ü �� ������ ���Ѵ�.
		// pagingAction��ü ����.
		page = new showcasepagingAction(currentPage, totalCount, blockCount, blockPage,
				showboard_category, "");
		pagingHtml = page.getPagingHtml().toString(); // ������ HTML����.

		// ���� ���������� ������ ������ ���� ��ȣ ����.
		int lastCount = totalCount;

		// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �۹�ȣ���� ������
		// lastCount�� +1 ��ȣ�� ����.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}

	public String execute2() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		String sessionid = (String) session.get("id");
		memresultClass = (MemberVO) sqlMapper.queryForObject("UserCheck", sessionid);

		if (getShowboard_category() != null) {
			return adcategory();
		}

		if (getSearchKeyword() != null) {
			return adsearch();
		}

		showboard_paramClass = new showVO();

		//showboard_category = "";
		// ��ư ���� ������ list�� �ִ´�.
		list = sqlMapper.queryForList("goodsselectAll", showboard_paramClass);

		totalCount = list.size();// ��ü �� ������ ���Ѵ�.
		// pagingAction��ü ����.
		adpage = new pagingAction(currentPage, totalCount, blockCount,
				blockPage, showboard_category, "");
		adpagingHtml = adpage.getAdpagingHtml().toString(); // ������ HTML����.

		// ���� ���������� ������ ������ ���� ��ȣ ����.
		int lastCount = totalCount;

		// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �۹�ȣ���� ������
		// lastCount�� +1 ��ȣ�� ����.
		if (adpage.getEndCount() < totalCount)
			lastCount = adpage.getEndCount() + 1;

		// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
		list = list.subList(adpage.getStartCount(), lastCount);
		return SUCCESS;
	}

	public String category() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		String sessionid = (String) session.get("id");
		memresultClass = (MemberVO) sqlMapper.queryForObject("UserCheck", sessionid);
		
		showboard_paramClass = new showVO();
		showboard_paramClass.setShowboard_category(getShowboard_category());
		list = sqlMapper.queryForList("goodsselectCategory", showboard_paramClass);

		totalCount = list.size(); // ��ü �� ������ ���Ѵ�.

		// pagingAction ��ü ����
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage,
				showboard_category, "");
		pagingHtml = page.getPagingHtml().toString(); // ������HTML ����.

		// ���� ���������� ������ ������ ���� ��ȣ ����.
		int lastCount = totalCount;

		// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ lastCount�� +1 ��ȣ�� ����.
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}

	public String search() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		String sessionid = (String) session.get("id");
		memresultClass = (MemberVO) sqlMapper.queryForObject("UserCheck", sessionid);
		
		// searchKeyword = new
		// String(searchKeyword.getBytes("iso-8859-1"),"euc-kr");
		System.out.print(searchKeyword); // Ű���带 ���

		list = sqlMapper.queryForList("goodsselectSearch", "%" + getSearchKeyword() + "%"); // search ���� ����

		totalCount = list.size();
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage,
				showboard_category, getSearchKeyword());
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}
	public String adcategory() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		String sessionid = (String) session.get("id");
		memresultClass = (MemberVO) sqlMapper.queryForObject("UserCheck", sessionid);
		
		showboard_paramClass = new showVO();
		showboard_paramClass.setShowboard_category(getShowboard_category());
		list = sqlMapper.queryForList("goodsselectCategory", showboard_paramClass);

		totalCount = list.size(); // ��ü �� ������ ���Ѵ�.

		// pagingAction ��ü ����
		adpage = new adminpagingAction(currentPage, totalCount, blockCount, blockPage,
				showboard_category, "");
		adpagingHtml = adpage.getAdpagingHtml().toString(); // ������HTML ����.

		// ���� ���������� ������ ������ ���� ��ȣ ����.
		int lastCount = totalCount;

		// ���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ lastCount�� +1 ��ȣ�� ����.
		if (adpage.getEndCount() < totalCount)
			lastCount = adpage.getEndCount() + 1;

		// ��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
		list = list.subList(adpage.getStartCount(), lastCount);

		return SUCCESS;
	}
	public String adsearch() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		String sessionid = (String) session.get("id");
		memresultClass = (MemberVO) sqlMapper.queryForObject("UserCheck", sessionid);
		
		// searchKeyword = new
		// String(searchKeyword.getBytes("iso-8859-1"),"euc-kr");
		System.out.print(searchKeyword); // Ű���带 ���

		list = sqlMapper.queryForList("selectSearch", "%" + getSearchKeyword() + "%"); // search ���� ����

		totalCount = list.size();
		adpage = new adminpagingAction(currentPage, totalCount, blockCount, blockPage,
				showboard_category, getSearchKeyword());
		adpagingHtml = adpage.getAdpagingHtml().toString();

		int lastCount = totalCount;

		if (adpage.getEndCount() < totalCount)
			lastCount = adpage.getEndCount() + 1;

		list = list.subList(adpage.getStartCount(), lastCount);

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
		listAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		listAction.sqlMapper = sqlMapper;
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

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public String getAdpagingHtml() {
		return adpagingHtml;
	}

	public void setAdpagingHtml(String adpagingHtml) {
		this.adpagingHtml = adpagingHtml;
	}

	public showcasepagingAction getPage() {
		return page;
	}

	public void setPage(showcasepagingAction page) {
		this.page = page;
	}

	public pagingAction getAdpage() {
		return adpage;
	}

	public void setAdpage(pagingAction adpage) {
		this.adpage = adpage;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

}