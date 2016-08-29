package order;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;
import order.OrderPagingAction;

public class OrderListAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberVO memparamClass;
	private MemberVO memresultClass;
	private OrderVO orderparamClass;
	private OrderVO orderresultClass;

	private List<OrderVO> orderList = new ArrayList<OrderVO>();

	private int currentPage = 1; // 현재 페이지
	private int totalCount;// 총 게시물의 수
	private int blockCount = 10; // 한 페이지의 게시물 수
	private int blockPage = 3; // 한 화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private OrderPagingAction page; // 페이징 클래스
	private AdminOrderPagingAction adpage;
	private String adpagingHtml;
	private int num = 0;

	private String searchKeyword;
	private List<OrderVO> list = new ArrayList<OrderVO>();

	public OrderListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();
		orderparamClass = new OrderVO();
		orderresultClass = new OrderVO();
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		int sessionid = (Integer) session.get("member_num"); // 세션 id명을 memId로
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userCheck", sessionid);

		orderList = sqlMapper.queryForList("order.orderList", sessionid);

		totalCount = orderList.size();

		page = new OrderPagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		orderList = orderList.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}
	
	/*public String deleteOrder() throws Exception {
		//주문리스트에서 주문취소하기
		return SUCCESS;
	}*/

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		OrderListAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		OrderListAction.sqlMapper = sqlMapper;
	}

	public MemberVO getMemparamClass() {
		return memparamClass;
	}

	public void setMemparamClass(MemberVO memparamClass) {
		this.memparamClass = memparamClass;
	}

	public MemberVO getMemresultClass() {
		return memresultClass;
	}

	public void setMemresultClass(MemberVO memresultClass) {
		this.memresultClass = memresultClass;
	}

	public OrderVO getOrderparamClass() {
		return orderparamClass;
	}

	public void setOrderparamClass(OrderVO orderparamClass) {
		this.orderparamClass = orderparamClass;
	}

	public OrderVO getOrderresultClass() {
		return orderresultClass;
	}

	public void setOrderresultClass(OrderVO orderresultClass) {
		this.orderresultClass = orderresultClass;
	}

	public List<OrderVO> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<OrderVO> orderList) {
		this.orderList = orderList;
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

	public OrderPagingAction getPage() {
		return page;
	}

	public void setPage(OrderPagingAction page) {
		this.page = page;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

}
