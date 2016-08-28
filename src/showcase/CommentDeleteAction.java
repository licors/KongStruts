package showcase;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;

public class CommentDeleteAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private CommentBoardVO paramClass;
	private CommentBoardVO resultClass;
	private MemberVO memberDataClass;
	private int currentPage;
	private int comment_num;
	
	public CommentDeleteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		memberDataClass = new MemberVO();
		paramClass = new CommentBoardVO();
//		resultClass = new CommentBoardVO();
		
		paramClass = (CommentBoardVO) sqlMapper.queryForObject("showcaseDetailComment.selectOne",getComment_num());

		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		//session 에 정보 없으면 로그인 창 갔다오는 기능 추가 예정
		
		int sessionNum = (Integer) session.get("member_num");
		memberDataClass = (MemberVO) sqlMapper.queryForObject("member.userCheck", sessionNum);
		
//		paramClass.setMember_num(memberDataClass.getMember_num());
		
		if(paramClass.getMember_num() != memberDataClass.getMember_num()) {
			return ERROR;
		}
		sqlMapper.update("showcaseDetailComment.deleteBoard",paramClass);
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
	
	
