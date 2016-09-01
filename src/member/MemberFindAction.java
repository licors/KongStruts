   package member;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

//import zipcode.zipcodeVO;

public class MemberFindAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberVO memresultClass;
	private MemberVO memparamClass;
	
	
	private String email;
	private String password;
	private String name;
	//private Date birth;
	//private String phone;
	private int check;
	private String area3;
	//private List<zipcodeVO> zipcodeList = new ArrayList<zipcodeVO>();

	public MemberFindAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}


/*	public String findidform() throws Exception {
		return SUCCESS;
	}
*/
	public String findpwform() throws Exception {
		return SUCCESS;
	}
	
/*	public String findid() throws Exception {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();

		memparamClass.setName(getName());
		//memparamClass.setPhone(getPhone());
	
		memresultClass = (MemberVO) sqlMapper.queryForObject("FindId",
				memparamClass);
		if (memresultClass != null) {
			return SUCCESS;
		}
		return ERROR;
	}
*/
	public String findpassword() throws Exception {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();
		
		memparamClass.setEmail(getEmail());
		memparamClass.setName(getName());
	

		memresultClass = (MemberVO) sqlMapper.queryForObject("member.FindPassword",
				memparamClass);
		if (memresultClass != null) {
			return SUCCESS;
		}
		return ERROR;
	}


/*	public String idcheck() throws Exception {
		memparamClass = new MemberVO();
		memresultClass = new MemberVO();

		memresultClass = (MemberVO) sqlMapper
				.queryForObject("IdCheck", getEmail());

		if (memresultClass != null) {
			check = 0;
		} else {
			check = 1;
		}
		return SUCCESS;
	}
*/
	
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

/*	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
*/
	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	public String getArea3() {
		return area3;
	}

	public void setArea3(String area3) {
		this.area3 = area3;
	}

	/*public List<zipcodeVO> getZipcodeList() {
		return zipcodeList;
	}

	public void setZipcodeList(List<zipcodeVO> zipcodeList) {
		this.zipcodeList = zipcodeList;
	}*/


}
