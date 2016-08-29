package order;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import admin.showcase.showVO;
import basket.BasketVO;
import member.MemberVO;

public class OrderFormAction extends ActionSupport {
	// 상세보기에서 '신청하기' 버튼 클릭 시 get 방식으로 showboard_num 전송
	// 위에서 받은 showboard_num 을 이용하여 DB 에서 show.selectOne 쿼리문 동작, showcase 정보
	// 읽어옴(admin.showcase.showVO class 객체이용)
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberVO memparamClass;
	private MemberVO memresultClass;
	private showVO show_paramClass;
	private showVO show_resultClass;
	private OrderVO order_paramClass;
	private OrderVO order_resultClass;
	private BasketVO paramBas;
	private BasketVO resultBas;

	private int showboard_num; // 전시회 번호
	private int member_num; // 주문자 번호
	/*
	 * private int order_num; //주문번호 private String name; //주문자 이름 private
	 * String sex; //주문자 성별 private String company; //주문자 회사 private String
	 * address; //주문자 주소 private String email; //주문자 email(id) private String
	 * barcode; //주문하면 발급될 barcode private Date order_date;//주문날짜 private String
	 * tel; //주문자 핸드폰번호 private String status; //현재 주문상태
	 * 
	 * private String subject; //전시회 명 private String file_orgname; //전시회 이미지
	 * private String file_savname; //전시회 이미지 private String date; //전시회 일정
	 * private int readcount; //조회수 private int ordercount; //주문수
	 */
	private List<BasketVO> basketList = new ArrayList<BasketVO>();
	private List<showVO> showList = new ArrayList<showVO>();

	public OrderFormAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	// 상세보기, 메인에서 주문시 폼 불러오기 (get방식으로 showboard_num 받음)
	public String form() throws Exception {

		memparamClass = new MemberVO();
		memresultClass = new MemberVO();

		show_paramClass = new showVO();
		show_resultClass = new showVO();

		order_paramClass = new OrderVO();
		order_resultClass = new OrderVO();

		// member 고유넘버로 회원정보빼오기
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		int sessionid = (Integer) session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userCheck", sessionid);

		// 상품번호로 상품정보 꺼내오기
		show_paramClass.setShowboard_num(getShowboard_num());
		show_resultClass = (showVO) sqlMapper.queryForObject("show.selectOne", show_paramClass.getShowboard_num());

		showboard_num = show_paramClass.getShowboard_num();

		return SUCCESS;
	}

	// 장바구니에서 주문시 처리폼
	public String form_B() throws SQLException {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();

		show_paramClass = new showVO();
		show_resultClass = new showVO();

		paramBas = new BasketVO();
		resultBas = new BasketVO();

		// 주문 신청인 정보 가져오기
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		int sessionid = (Integer) session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userCheck", sessionid);

		// 해당 아이디의 장바구니 목록 가져오기
		basketList = sqlMapper.queryForList("basket.basket_list", sessionid);
		// goodsList =
		// sqlMapper.queryForList("goodsselect",getBasket_goods_name());
		// System.out.println(goodsList);
		for (int i = 0; i < basketList.size(); i++) {
			paramBas = basketList.get(i);

			showList = sqlMapper.queryForList("show.selectOne", paramBas.getShowboard_num());
			for (int j = 0; j < showList.size(); j++) {
				show_resultClass = showList.get(j);
			}
		}
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		OrderFormAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		OrderFormAction.sqlMapper = sqlMapper;
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

	public showVO getShow_paramClass() {
		return show_paramClass;
	}

	public void setShow_paramClass(showVO show_paramClass) {
		this.show_paramClass = show_paramClass;
	}

	public showVO getShow_resultClass() {
		return show_resultClass;
	}

	public void setShow_resultClass(showVO show_resultClass) {
		this.show_resultClass = show_resultClass;
	}

	public OrderVO getOrder_paramClass() {
		return order_paramClass;
	}

	public void setOrder_paramClass(OrderVO order_paramClass) {
		this.order_paramClass = order_paramClass;
	}

	public OrderVO getOrder_resultClass() {
		return order_resultClass;
	}

	public void setOrder_resultClass(OrderVO order_resultClass) {
		this.order_resultClass = order_resultClass;
	}

	public BasketVO getParamBas() {
		return paramBas;
	}

	public void setParamBas(BasketVO paramBas) {
		this.paramBas = paramBas;
	}

	public BasketVO getResultBas() {
		return resultBas;
	}

	public void setResultBas(BasketVO resultBas) {
		this.resultBas = resultBas;
	}

	public int getShowboard_num() {
		return showboard_num;
	}

	public void setShowboard_num(int showboard_num) {
		this.showboard_num = showboard_num;
	}

	/*
	 * public int getOrder_num() { return order_num; } public void
	 * setOrder_num(int order_num) { this.order_num = order_num; } public String
	 * getSubject() { return subject; } public void setSubject(String subject) {
	 * this.subject = subject; } public int getMember_num() { return member_num;
	 * } public void setMember_num(int member_num) { this.member_num =
	 * member_num; } public String getName() { return name; } public void
	 * setName(String name) { this.name = name; } public String getSex() {
	 * return sex; } public void setSex(String sex) { this.sex = sex; } public
	 * String getCompany() { return company; } public void setCompany(String
	 * company) { this.company = company; } public String getAddress() { return
	 * address; } public void setAddress(String address) { this.address =
	 * address; } public String getEmail() { return email; } public void
	 * setEmail(String email) { this.email = email; } public String getBarcode()
	 * { return barcode; } public void setBarcode(String barcode) { this.barcode
	 * = barcode; } public Date getOrder_date() { return order_date; } public
	 * void setOrder_date(Date order_date) { this.order_date = order_date; }
	 * public String getTel() { return tel; } public void setTel(String tel) {
	 * this.tel = tel; } public String getStatus() { return status; } public
	 * void setStatus(String status) { this.status = status; } public String
	 * getFile_orgname() { return file_orgname; } public void
	 * setFile_orgname(String file_orgname) { this.file_orgname = file_orgname;
	 * } public String getFile_savname() { return file_savname; } public void
	 * setFile_savname(String file_savname) { this.file_savname = file_savname;
	 * } public String getDate() { return date; } public void setDate(String
	 * date) { this.date = date; } public int getReadcount() { return readcount;
	 * } public void setReadcount(int readcount) { this.readcount = readcount; }
	 * public int getOrdercount() { return ordercount; } public void
	 * setOrdercount(int ordercount) { this.ordercount = ordercount; }
	 */
	public List<BasketVO> getBasketList() {
		return basketList;
	}

	public void setBasketList(List<BasketVO> basketList) {
		this.basketList = basketList;
	}

	public List<showVO> getShowList() {
		return showList;
	}

	public void setShowList(List<showVO> showList) {
		this.showList = showList;
	}
}
