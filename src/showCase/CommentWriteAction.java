package showCase;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class CommentWriteAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private CommentBoardVO paramClass;
	private CommentBoardVO resultClass;
	
	private int currentPage;
	private int no;
	private String name;
	private String content;

	Calendar today = Calendar.getInstance();
	
	public CommentWriteAction() throws IOException {
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception {
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		paramClass = new CommentBoardVO();
		resultClass = new CommentBoardVO();
		
		paramClass.setName(getName());
		paramClass.setContent(getContent());
		paramClass.setReg_date(today.getTime());
		
		sqlMapper.insert("insertBoard",paramClass);

		return SUCCESS;
	}

	public CommentBoardVO getParamClass() {
		return paramClass;
	}

	public CommentBoardVO getResultClass() {
		return resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getNo() {
		return no;
	}

	public String getName() {
		return name;
	}

	public String getContent() {
		return content;
	}

	public Calendar getToday() {
		return today;
	}

	public void setParamClass(CommentBoardVO paramClass) {
		this.paramClass = paramClass;
	}

	public void setResultClass(CommentBoardVO resultClass) {
		this.resultClass = resultClass;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}
}