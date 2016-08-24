package showcase;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class CommentModifyAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private CommentBoardVO paramClass;
	private CommentBoardVO resultClass;
	
	private int currentPage;
	
	private int comment_num;
	private String name;
	private String content;
	
	public CommentModifyAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	 
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		paramClass = new CommentBoardVO();
		resultClass = new CommentBoardVO();
		
		paramClass.setComment_num(comment_num);
		paramClass.setName(getName());
		paramClass.setContent(getContent());
		
		sqlMapper.update("updateBoard",paramClass);
		
		resultClass = (CommentBoardVO) sqlMapper.queryForObject("selectOne",getComment_num());
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

	public int getComment_num() {
		return comment_num;
	}

	public String getName() {
		return name;
	}

	public String getContent() {
		return content;
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

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setContent(String content) {
		this.content = content;
	}


}