package order;

import order.AdminOrderPagingAction;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;

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
    private int member_num;

    //검색관련
    private String searchKeyword;
    private int searchNum;
    //private int num2 = 0;

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

        memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);
        /*		
		if(memresultClass == null) {
			return LOGIN;
		}
         */
        orderList = sqlMapper.queryForList("order.orderList", getMember_num());

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
    
    //관리자용 회원 오더리스트(페이징, 검색)
    public String adminOrderList() throws Exception {
    	memparamClass = new MemberVO();
        memresultClass = new MemberVO();
        orderparamClass = new OrderVO();
        orderresultClass = new OrderVO();

        memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);
        /*		
		if(memresultClass == null) {
			return LOGIN;
		}
         */
        orderList = sqlMapper.queryForList("order.order_selectAll");

        totalCount = orderList.size();

        adpage = new AdminOrderPagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
        pagingHtml = adpage.getPagingHtml().toString();
        int lastCount = totalCount;

        if (adpage.getEndCount() < totalCount) {
            lastCount = adpage.getEndCount() + 1;
        }

        orderList = orderList.subList(adpage.getStartCount(), lastCount);
    	return SUCCESS;
    }
    
    public String search() throws Exception {
    	memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);

		searchKeyword = new String(searchKeyword.getBytes("8859_1"), "utf-8");
		System.out.print(searchKeyword);

		if (searchNum == 0) {	//회원
			orderList = sqlMapper.queryForList("order.search_id", "%" + getSearchKeyword() + "%");
		}
		if (searchNum == 1) {	//전시
			orderList = sqlMapper.queryForList("order.search_subject", "%" + getSearchKeyword() + "%");
		}
		if (searchNum == 2) {	//신청상태
			orderList = sqlMapper.queryForList("order.search_status", "%" + getSearchKeyword() + "%");
		}
		/*if (searchNum == 2) {	//날짜
		orderList = sqlMapper.queryForList("order.search_date", "%" + getSearchKeyword() + "%");
	}*/

		totalCount = orderList.size(); // 전체 글 갯수를 구한다.
		// pagingAction 객체생성
		adpage = new AdminOrderPagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
		pagingHtml = adpage.getPagingHtml().toString(); // 페이지HTML 생성.

		// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount = totalCount;

		// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 lastCount를 +1 번호로 설정.
		if (adpage.getEndCount() < totalCount)
			lastCount = adpage.getEndCount() + 1;

		// 전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
		orderList = orderList.subList(adpage.getStartCount(), lastCount);
		return SUCCESS;
	}

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

    public int getMember_num() {
        return member_num;
    }

    public void setMember_num(int member_num) {
        this.member_num = member_num;
    }

	public AdminOrderPagingAction getAdpage() {
		return adpage;
	}

	public void setAdpage(AdminOrderPagingAction adpage) {
		this.adpage = adpage;
	}

	public String getAdpagingHtml() {
		return adpagingHtml;
	}

	public void setAdpagingHtml(String adpagingHtml) {
		this.adpagingHtml = adpagingHtml;
	}

	public int getSearchNum() {
		return searchNum;
	}

	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}

}
