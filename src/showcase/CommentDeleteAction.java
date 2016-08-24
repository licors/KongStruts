package showcase;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class CommentDeleteAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private CommentBoardVO paramClass;
	private CommentBoardVO resultClass;
	
	private int currentPage;
	private int comment_num;
	
	public CommentDeleteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		paramClass = new CommentBoardVO();
		resultClass = new CommentBoardVO();
		
		resultClass = (CommentBoardVO) sqlMapper.queryForObject("selectOne",getComment_num());
		
		paramClass.setComment_num(getComment_num());
		
		sqlMapper.update("deleteBoard",paramClass);
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

	
}
	
	
