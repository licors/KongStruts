package order;

import admin.showcase.showVO;

import java.io.Reader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import member.MemberVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrderViewAction extends ActionSupport{
	private MemberVO memresultClass;
	private MemberVO memparamClass;
	private OrderVO order_paramClass;
	private OrderVO order_resultClass;
	private showVO show_paramClass;
	private showVO show_resultClass;
	
	private int currentPage;
	private List<String> show_savimage = new ArrayList();
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private int order_num; // 리스트번호
	private int member_num;
	private int showboard_num;
	private String name;
	private String sex;
	private String company;
	private String address;
	private String email;
	private String barcode;
	private Date order_date;
	private String tel;
	private String status;
	
	private String subject;
	private String file_orgname;
	private String file_savname;
	private String date;
	private String address2;
	
	public OrderViewAction() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {	
		memresultClass = new MemberVO();
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		int sessionid = (Integer) session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userCheck",
				sessionid);
/*		
		if(memresultClass == null) {
			return LOGIN;
		}
*/
		currentPage = getCurrentPage();

		show_paramClass = new showVO();
		show_resultClass = new showVO();
		order_paramClass = new OrderVO();
		order_resultClass = new OrderVO();

		order_resultClass = (OrderVO) sqlMapper.queryForObject("order.orderDetail",
				order_num);	//orderList.jsp에서 get방식으로 order_num&currentPage 넘겨주므로 order_num 사용가능
		
		show_resultClass = (showVO) sqlMapper.queryForObject("show.selectOne",
				order_resultClass.getShowboard_num());
		
		if (show_resultClass.getFile_savname() != null) {
			String images = show_resultClass.getFile_savname();
			StringTokenizer st = new StringTokenizer(images, ",");
			while (st.hasMoreTokens()) {
				show_savimage.add(st.nextToken());
			}
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

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public List<String> getShow_savimage() {
		return show_savimage;
	}

	public void setShow_savimage(List<String> show_savimage) {
		this.show_savimage = show_savimage;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		OrderViewAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		OrderViewAction.sqlMapper = sqlMapper;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public int getShowboard_num() {
		return showboard_num;
	}

	public void setShowboard_num(int showboard_num) {
		this.showboard_num = showboard_num;
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}
}