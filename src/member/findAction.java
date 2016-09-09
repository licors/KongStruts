package member;

import java.io.IOException;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;

public class findAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private MemberVO memresultClass;
	private MemberVO memparamClass;
	private MemberVO resultDetail;
	private MemberVO paramDetail;
	
	private String check;
	
	private String area3;
	private List<zipcodeVO> zipcodeList = new ArrayList<zipcodeVO>();

	public findAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String form() throws Exception {
		return SUCCESS;
	}
	
	
	public String execute() throws Exception {
		zipcodeList = sqlMapper.queryForList("member.zipCheck", "%" + getArea3() + "%");
		System.out.println(zipcodeList.size());
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

	public String getArea3() {
		return area3;
	}

	public void setArea3(String area3) {
		this.area3 = area3;
	}

	public List<zipcodeVO> getZipcodeList() {
		return zipcodeList;
	}

	public void setZipcodeList(List<zipcodeVO> zipcodeList) {
		this.zipcodeList = zipcodeList;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}
	
}
