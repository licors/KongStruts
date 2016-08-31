package order;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import admin.showcase.showVO;
import member.MemberVO;
import basket.BasketVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;

public class OrderProcessAction extends ActionSupport {
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
	
	private int order_num;	//주문번호
	private int showboard_num;	//전시회 번호
	private String subject;	//전시회 명
	private int member_num;	//주문자 번호
	private String name;	//주문자 이름
	private String sex;		//주문자 성별
	private String company;	//주문자 회사
	private String address;	//주문자 주소
	private String email;	//주문자 email(id)
	private String barcode;	//주문하면 발급될 barcode
	private Date order_date;//주문날짜
	private String tel;		//주문자 핸드폰번호
	private String status;		//현재 주문상태
	private String file_orgname;	//전시회 이미지
	private String file_savname;	//전시회 이미지
	private String date;			//전시회 일정
	private int readcount;			//조회수
	private int ordercount;			//주문수
	
	Calendar today = Calendar.getInstance(); // 오늘 날짜
	
	private List<BasketVO> basketList = new ArrayList<BasketVO>(); // ++
	private List<showVO> showList = new ArrayList<showVO>(); // ++
	private List<OrderVO> orderList = new ArrayList<OrderVO>();
	private int basket_num; // ++

	public OrderProcessAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
/*	
	//주문 처리 폼
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
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userCheck",
				sessionid);

		// 상품번호로 상품정보 꺼내오기
		show_paramClass.setShowboard_num(getShowboard_num());
		show_resultClass = (showVO) sqlMapper.queryForObject(
				"show.selectOne", show_paramClass);

		order_goods_amount = getGoods_amount();
		order_goods_size = getGoods_size();
		order_goods_color = getGoods_color();

		showboard_num = show_paramClass.getShowboard_num();
		qr코드는 여기에서 생성! barcode = 
		order_sum_money = (getGoods_price() * order_goods_amount);

		return SUCCESS;
	}
	
	//장바구니 구매 처리 폼
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
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userCheck",
				sessionid);

		// 해당 아이디의 장바구니 목록 가져오기
		basketList = sqlMapper.queryForList("basket.basketList", sessionid);
		// goodsList =
		// sqlMapper.queryForList("goodsselect",getBasket_goods_name());
		// System.out.println(goodsList);
		if (basketList.size() == 0) {
			return INPUT; // 여기 잘 생각해보기!!!;;;;
		} else {
			for (int i = 0; i < basketList.size(); i++) {

				// order_snum_money =0;
				paramBas = basketList.get(i);
				order_sum_money += (paramBas.getBasket_goods_price() * paramBas.getBasket_goods_amount());
				
				showList = sqlMapper.queryForList("show.select", paramBas.getSubject());
				for (int j = 0; j < showList.size(); j++) {
					show_resultClass = showList.get(j);
				}
			}
			return SUCCESS;
		}
	}*/
	
	public String execute() throws Exception {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		int sessionid = (Integer) session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userCheck",
				sessionid);

		show_resultClass = new showVO();
		show_resultClass = (showVO) sqlMapper.queryForObject(
				"show.selectOne", getShowboard_num());

		order_paramClass = new OrderVO();
		order_resultClass = new OrderVO();
		
/*		System.out.println(getName());
		System.out.println(getSex());
		System.out.println(getCompany());
		System.out.println(getAddress());
		System.out.println(getEmail());
		System.out.println(getTel());*/
		
		order_paramClass.setName(getName());
		order_paramClass.setSex(getSex());
		order_paramClass.setCompany(getCompany());
		order_paramClass.setAddress(getAddress());
		order_paramClass.setEmail(getEmail());
		//order_paramClass.setbarcode(barcode);	//barcode는 계산해서 넣어야되므로
		order_paramClass.setTel(getTel());
		
		order_paramClass.setMember_num(sessionid);
		order_paramClass.setShowboard_num(show_resultClass.getShowboard_num());

		order_paramClass.setStatus("티켓 신청");
		
		String str1 = Integer.toString(getMember_num());
		String str2 = Integer.toString(show_resultClass.getShowboard_num());
		Long str3 = Calendar.getInstance().getTimeInMillis();
		String codeStr = str1 + str2 + str3;
		try {
			Barcode barcode = BarcodeFactory.createCode128B(codeStr);
			File file = new File("C:\\kong\\WebContent\\barcodeImg\\"+codeStr+".png");
			//File file = new File("C:\\java\\YJ\\kong\\WebContent\\barcodeImg\\"+codeStr+".png");
			BarcodeImageHandler.savePNG(barcode, file);			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		order_paramClass.setBarcode(codeStr);
		order_paramClass.setOrder_date(today.getTime());
		
		sqlMapper.insert("order.insert_order", order_paramClass);
		
		return SUCCESS;
		//orderNum안했음
	}
	
	//장바구니 처리
	public String execute2() throws Exception {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		int sessionid = (Integer) session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userCheck",
				sessionid);

		show_resultClass = new showVO();
		show_resultClass = (showVO) sqlMapper.queryForObject(
				"show.selectOne", getShowboard_num());

		order_paramClass = new OrderVO();
		order_resultClass = new OrderVO();

		resultBas = new BasketVO();
		
		System.out.println(memresultClass.getMember_num());
		
		basketList = sqlMapper.queryForList("basket.basket_list", sessionid);
		
		/*for(int i = 0; i < basketList.size(); i++) {
			order_paramClass.setbarcode(barcode);
		} 애매함  수정필요*/

		for (int i = 0; i < basketList.size(); i++) {
			resultBas = basketList.get(i);
			
			order_paramClass.setShowboard_num(resultBas.getShowboard_num());
			
			/*if (getOrder_member_id() == null) {
				return INPUT;			//로그인이 안되어있을때 구매하기가 되면 처리하기위해 한듯?
			}*/
			
			order_paramClass.setMember_num(memresultClass.getMember_num());
			order_paramClass.setName(getName());
			System.out.print(order_paramClass.getName());
			order_paramClass.setSex(getSex());
			order_paramClass.setCompany(getCompany());
			order_paramClass.setAddress(getAddress());
			order_paramClass.setEmail(getEmail());
			order_paramClass.setOrder_date(getOrder_date());
			order_paramClass.setOrder_date(today.getTime());
			order_paramClass.setTel(getTel());
			order_paramClass.setStatus("티켓 신청");

			/*각 전시회마다 다른 바코드 생성*/
			String str1 = Integer.toString(memresultClass.getMember_num());
			String str2 = Integer.toString(resultBas.getShowboard_num()); 
			Long str3 = Calendar.getInstance().getTimeInMillis();

			String codeStr = str1 + str2 + str3;
			
			try {
				Barcode barcode = BarcodeFactory.createCode128B(codeStr);
				File file = new File("C:\\kong\\WebContent\\barcodeImg\\"+codeStr+".png");
				//File file = new File("C:\\java\\YJ\\kong\\WebContent\\barcodeImg\\"+codeStr+".png");
				BarcodeImageHandler.savePNG(barcode, file);			
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			order_paramClass.setBarcode(codeStr);
			
			sqlMapper.insert("order.insert_order", order_paramClass);

			show_resultClass = (showVO) sqlMapper.queryForObject("show.selectOne", resultBas.getShowboard_num());
			
			//orderList = sqlMapper.queryForList("show.select", resultBas.getSubject()); 이번에 주문한 바코드 뽑기위해서
		}
		
		orderList = sqlMapper.queryForList("order.order_date_list", getOrder_date());

		return SUCCESS;
	}
	
/*	public String orderInsert() throws Exception {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		int sessionid = (Integer) session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userCheck",
				sessionid);

		order_paramClass = new OrderVO();
		order_resultClass = new OrderVO();
		show_paramClass = new showVO();
		show_resultClass = new showVO();
		
바코드 생성
		String str1 = Integer.toString(getMember_num());
		String str2 = Integer.toString(resultBas.getShowboard_num());

		String codeStr = str1 + str2;
		try {
			Barcode barcode = BarcodeFactory.createCode128B(codeStr);
			File file = new File("C:\\java\\YJ\\kong\\WebContent\\order\\barcode_images\\"+codeStr);
			BarcodeImageHandler.savePNG(barcode, file);			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		order_paramClass.setBarcode(codeStr);

		if (getOrder_member_id() == null) {
			return INPUT;
		}
		
		order_paramClass.setMember_num(memresultClass.getMember_num());
		order_paramClass.setShowboard_num(getShowboard_num());
		order_paramClass.setName(getName());
		order_paramClass.setSex(getSex());
		order_paramClass.setCompany(getCompany());
		order_paramClass.setAddress(getAddress());
		order_paramClass.setEmail(getEmail());
		order_paramClass.setOrder_date(today.getTime());
		order_paramClass.setTel(getTel());
		order_paramClass.setStatus("티켓 신청");
	
		sqlMapper.insert("order.insert_order", order_paramClass);

		show_resultClass = (showVO) sqlMapper.queryForObject("show.select",
				getSubject());
		
		return SUCCESS;
	}
	*/
/*	//장바구니에서 구매
	public String orderInsertB() throws Exception { // ++	
		paramBas = new BasketVO();
		resultBas = new BasketVO();

		memparamClass = new MemberVO();
		memresultClass = new MemberVO();

		show_paramClass = new showVO();
		show_resultClass = new showVO();

		order_paramClass = new OrderVO();
		order_resultClass = new OrderVO();

		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		int sessionid = (Integer) session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userCheck",
				sessionid);

		System.out.println(memresultClass.getMember_num());
		
		basketList = sqlMapper.queryForList("basket.basketList", memresultClass.getMember_num());

		for (int i = 0; i < basketList.size(); i++) {
			resultBas = basketList.get(i);
			
			order_paramClass.setShowboard_num(resultBas.getShowboard_num());
			
			if (getOrder_member_id() == null) {
				return INPUT;			//로그인이 안되어있을때 구매하기가 되면 처리하기위해 한듯?
			}
			
			order_paramClass.setMember_num(memresultClass.getMember_num());
			order_paramClass.setName(getName());
			order_paramClass.setSex(getSex());
			order_paramClass.setCompany(getCompany());
			order_paramClass.setAddress(getAddress());
			order_paramClass.setEmail(getEmail());
			order_paramClass.setOrder_date(getOrder_date());
			order_paramClass.setOrder_date(today.getTime());
			order_paramClass.setTel(getTel());
			order_paramClass.setStatus("티켓 신청");

			바코드 생성
			String str1 = Integer.toString(getMember_num());
			String str2 = Integer.toString(resultBas.getShowboard_num()); 

			String codeStr = str1 + str2;
			try {
				Barcode barcode = BarcodeFactory.createCode128B(codeStr);
				File file = new File("C:\\kong\\WebContent\\barcodeImg"+codeStr);
				BarcodeImageHandler.savePNG(barcode, file);			
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			order_paramClass.setBarcode(codeStr);
			
			sqlMapper.insert("order.insert_order", order_paramClass);
			//수량 차감
			show_resultClass = (showVO) sqlMapper.queryForObject("show.select", resultBas.getSubject());
		}

		paramBas.setMember_num(sessionid);
		sqlMapper.update("basket.basketDelete_all", paramBas);
		return SUCCESS;
	}*/
	
	public String orderCancel() throws Exception {	
		//status값변경해야됨 (order.update_order, OrderVO)
		//orderList에서 order_num,currentPage 넘겨줌
		//currentPage=getCurrentPage();
		order_paramClass = new OrderVO();
		show_paramClass = new showVO();
		order_paramClass.setOrder_num(order_num);
		order_paramClass.setStatus("티켓 취소");
		sqlMapper.update("order.update_order", order_paramClass);
		System.out.println("티켓 취소됨");
		
		//바코드 파일 지워야됨	
		return SUCCESS;
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

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public int getShowboard_num() {
		return showboard_num;
	}

	public void setShowboard_num(int showboard_num) {
		this.showboard_num = showboard_num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFile_orgname() {
		return file_orgname;
	}

	public void setFile_orgname(String file_orgname) {
		this.file_orgname = file_orgname;
	}

	public String getFile_savname() {
		return file_savname;
	}

	public void setFile_savname(String file_savname) {
		this.file_savname = file_savname;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getOrdercount() {
		return ordercount;
	}

	public void setOrdercount(int ordercount) {
		this.ordercount = ordercount;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

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

	public int getBasket_num() {
		return basket_num;
	}

	public void setBasket_num(int basket_num) {
		this.basket_num = basket_num;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		OrderProcessAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		OrderProcessAction.sqlMapper = sqlMapper;
	}
	
	
	
}
