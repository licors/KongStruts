package showcase;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;

public class CommentModifyAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private CommentBoardVO paramClass;
	private CommentBoardVO commentResultClass;
	private MemberVO memberDataClass;
	
	private int currentPage;
	
	private int comment_num;
	private int showboard_num;
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
		memberDataClass = admin.MemberLoginCheck.getMember(sqlMapper, memberDataClass);
        if(memberDataClass == null) {
        	return LOGIN;
        }
		commentResultClass = new CommentBoardVO();
		commentResultClass = (CommentBoardVO) sqlMapper.queryForObject("showcaseDetailComment.selectOne",getComment_num());
        
		paramClass.setComment_num(getComment_num());
		paramClass.setContent(getContent());
        if(memberDataClass.getMember_num() == commentResultClass.getMember_num()) {
        	sqlMapper.update("showcaseDetailComment.updateBoard",paramClass);
        }
		
		//resultClass = (CommentBoardVO) sqlMapper.queryForObject("showcaseDetailComment.selectOne",getComment_num());
		return SUCCESS;
	}

	public String form() throws Exception {
		return SUCCESS;
	}
	public CommentBoardVO getParamClass() {
		return paramClass;
	}

	public CommentBoardVO getCommentResultClass() {
		return commentResultClass;
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

	public void setCommentResultClass(CommentBoardVO commentResultClass) {
		this.commentResultClass = commentResultClass;
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

	public int getShowboard_num() {
		return showboard_num;
	}

	public void setShowboard_num(int showboard_num) {
		this.showboard_num = showboard_num;
	}


}