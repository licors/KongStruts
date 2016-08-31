package member;

import java.io.Reader;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MemberLoginAction extends ActionSupport {
	public static Reader reader; // 파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper;// SqlMapClient API를 사용하기 위함

	private MemberVO memresultClass;
	private MemberVO memparamClass;

	private String email;
	private String password;

	public MemberLoginAction() throws Exception {
		// sqlMapConfig.xml 파일의 설정 내용을 가져온다
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		// sqlMapConfig.xml 의 내용을 적용한 sqlMapper 객체 생성
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String form() throws Exception {
		return SUCCESS;
	}
	
	public String logout() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		session.remove("id");
		session.remove("member_num");
		return SUCCESS;
	}

	public String execute() throws Exception {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();

		memresultClass = (MemberVO) sqlMapper.queryForObject("member.userLogin",getEmail());

		if (memresultClass == null) {
		} else {
			if (memresultClass.getPassword().equals(password)) {
				ActionContext context = ActionContext.getContext();
				Map<String, Object> session = context.getSession();
				session.put("member_num",memresultClass.getMember_num());
				session.put("id", email);
				
//				System.out.println(session.get("member_num").toString());
//				System.out.println(session.get("id").toString());
				return SUCCESS;
			}
		}
		return ERROR;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	

}
