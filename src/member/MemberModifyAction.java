package member;

import java.io.Reader;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MemberModifyAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberVO memresultClass;
	private MemberVO memparamClass;
	private MemberVO resultDetail;
	private MemberVO paramDetail;
	private int member_num;
	private String email;
	private String oldpassword;
	private String password;
	private String password2;
	private String name;
	private String address;
	private String company;
	private int admin;
	
	
	
	public MemberModifyAction() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String form() throws Exception {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();
		resultDetail = new MemberVO();
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		int sessionemail = (Integer) session.get("member_num");
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userCheck",
				sessionemail);
		resultDetail = (MemberVO) sqlMapper
				.queryForObject("member.userLogin", getEmail());
		// System.out.println(resultClass.getId());
		return SUCCESS;
	}

	public String execute() throws Exception {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();

		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		String sessionemail = (String) session.get("id");

		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userLogin",
				sessionemail);
		//System.out.println("리절트클래스 " + memresultClass.getEmail());
		
		memparamClass.setEmail(sessionemail);
		memparamClass.setAddress(getAddress());
		memparamClass.setCompany(getCompany());
	
		sqlMapper.update("member.memberUpdate", memparamClass);
		//context.getSession().clear();
		return SUCCESS;
	}

	public String modifyPasswordform() throws Exception {
		return SUCCESS;
	}

	public String modifyPassword() throws Exception {
		
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		
		
		String sessionemail =  (String) session.get("id");
	/*	String sessionpassword =  (String) session.get("password");*/
		
		
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userLogin",
				sessionemail);
		
		if(memresultClass.getPassword().equals(getOldpassword())){
			memparamClass.setEmail(sessionemail);
			memparamClass.setPassword(getPassword());
			sqlMapper.update("member.passwordUpdate", memparamClass);
			
			return SUCCESS;
		}
		return ERROR;
	}

	public String delform() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		String sessionemail = (String) session.get("email");
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userLogin",
				sessionemail);
		return SUCCESS;
	}

	public String delete() throws Exception {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		String sessionemail = (String) session.get("id");
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userLogin",
				sessionemail);
		if (memresultClass.getPassword().equals(password)) {
			memparamClass.setEmail(sessionemail);
			sqlMapper.delete("member.deleteMember", memparamClass);
			context.getSession().clear();
			return SUCCESS;
		}
		return ERROR;
	}

	public String booted() throws Exception {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();
		paramDetail = new MemberVO();
		resultDetail = new MemberVO();
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		String sessionemail = (String) session.get("email");
		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userLogin",
				sessionemail);
		System.out.println(getEmail());
		paramDetail.setEmail(getEmail());

		sqlMapper.delete("member.deleteMember", paramDetail);
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

	public MemberVO getResultDetail() {
		return resultDetail;
	}

	public void setResultDetail(MemberVO resultDetail) {
		this.resultDetail = resultDetail;
	}

	public MemberVO getParamDetail() {
		return paramDetail;
	}

	public void setParamDetail(MemberVO paramDetail) {
		this.paramDetail = paramDetail;
	}

	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	
	

	
	
}
