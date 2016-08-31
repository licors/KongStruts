package showcase;

import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;

public class CommentWriteAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private CommentBoardVO paramClass;
	private CommentBoardVO resultClass;
	private MemberVO memberDataClass;
	
	private int currentPage;
	
	private int comment_num;
	private int member_num;
	private int showboard_num;
	private String subject;
	private String name;
	private String content;
	Calendar today = Calendar.getInstance();
	
	private int ref;
	private int re_step;
	private int re_level;
	
//	boolean reply = false;
	
	public CommentWriteAction() throws IOException
	{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}
	
	public String form() throws Exception
	{
		return SUCCESS;
		
	}
	
//	public String reply() throws Exception
//	{
//		reply=true;
//		resultClass = new CommentBoardVO();
//		
//		resultClass = (CommentBoardVO) sqlMapper.queryForObject("showcaseDetailComment.selectOne", getComment_num());
//		resultClass.setContent("[답변] " + resultClass.getContent());
//		//resultClass.setName("");
//		
//		return SUCCESS;
//		
//	}
	
	

	public String execute() throws Exception {
		memberDataClass = new MemberVO();
		paramClass = new CommentBoardVO();
		resultClass = new CommentBoardVO();
		
		
		if(ref == 0)
		{
			paramClass.setRe_step(0);
			paramClass.setRe_level(0);
		}
		else
		{
			paramClass.setRef(getRef());
			paramClass.setRe_step(getRe_step());
			sqlMapper.update("showcaseDetailComment.updateReplyStep", paramClass);
			
			paramClass.setRe_step(getRe_step() + 1);
			paramClass.setRe_level(getRe_level() + 1);
			paramClass.setRef(getRef());
		}
		
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		//session 에 정보 없으면 로그인 창 갔다오는 기능 추가 예정
		
		int sessionNum = (Integer) session.get("member_num");
		memberDataClass = (MemberVO) sqlMapper.queryForObject("member.userCheck", sessionNum);
		
		
		paramClass.setComment_num(getComment_num());
		paramClass.setMember_num(memberDataClass.getMember_num());
		paramClass.setShowboard_num(getShowboard_num());
		paramClass.setContent(getContent());
		paramClass.setReg_date(today.getTime());
		
		
		if(ref == 0)
			sqlMapper.insert("showcaseDetailComment.insertBoard", paramClass);
		else
			sqlMapper.insert("showcaseDetailComment.insertBoardReply", paramClass);

		return SUCCESS;
	}

	@Override
	public void validate() {
		// TODO Auto-generated method stub
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		//session 에 정보 없으면 로그인 창 갔다오는 기능 추가 예정

		if(session == null) {
			addFieldError("name", "Enter Your Name!!");
		}
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

	public String getSubject() {
		return subject;
	}

	public String getName() {
		return name;
	}

	public String getContent() {
		return content;
	}

	public int getRef() {
		return ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public int getRe_level() {
		return re_level;
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

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public MemberVO getMemberDataClass() {
		return memberDataClass;
	}

	public void setMemberDataClass(MemberVO memberDataClass) {
		this.memberDataClass = memberDataClass;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public int getShowboard_num() {
		return showboard_num;
	}

	public void setShowboard_num(int showboard_num) {
		this.showboard_num = showboard_num;
	}
	
	
}