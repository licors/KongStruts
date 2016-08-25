package member;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class MemberJoinAction extends ActionSupport {
	
	public static Reader reader; // 파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper;// SqlMapClient API를 사용하기 위함
	private MemberVO memresultClass;
	private MemberVO memparamClass;
	
	
	
	private String email;
	private String passwd;
	
	public MemberJoinAction() throws Exception {
		// sqlMapConfig.xml 파일의 설정 내용을 가져온다
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		// sqlMapConfig.xml 의 내용을 적용한 sqlMapper 객체 생성
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();
		
		
		memparamClass.setEmail(getEmail());
		memparamClass.setPasswd(getPasswd());
		
		
		sqlMapper.insert("joinMember", memparamClass);
		memresultClass=(MemberVO)sqlMapper.queryForObject("UserCheck",memparamClass.getEmail());
		
		return SUCCESS;
	}
	
	public String form() throws Exception{
		return SUCCESS;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
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
	
	
	


}
