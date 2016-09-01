package showcase;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;

public class CommentListAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<CommentBoardVO> list = new ArrayList<CommentBoardVO>();
	private int currentPage=1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private CommentPagingAction page;
	
	private int member_num;
	private int showcase_num;
	
	private CommentBoardVO CommentParamClass;
	private CommentBoardVO CommentResultClass;
	private MemberVO memberDataClass;
	
	private int comment_num;
	private int showboard_num;
	private String subject;
	private String name;
	private String content;
	Calendar today = Calendar.getInstance();
	
	private int ref;
	private int re_step;
	private int re_level;
	
	
	public CommentListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		list = sqlMapper.queryForList("showcaseDetailComment.selectAll",getShowboard_num());

		totalCount = list.size();
		page = new CommentPagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		list = list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}

	public List<CommentBoardVO> getList() {
		return list;
	}

	public String commentWrite() throws Exception {
		memberDataClass = new MemberVO();
		CommentParamClass = new CommentBoardVO();
		CommentResultClass = new CommentBoardVO();
		
		
		if(ref == 0)
		{
			CommentParamClass.setRe_step(0);
			CommentParamClass.setRe_level(0);
		}
		else
		{
			CommentParamClass.setRef(getRef());
			CommentParamClass.setRe_step(getRe_step());
			sqlMapper.update("showcaseDetailComment.updateReplyStep", CommentParamClass);
			
			CommentParamClass.setRe_step(getRe_step() + 1);
			CommentParamClass.setRe_level(getRe_level() + 1);
			CommentParamClass.setRef(getRef());
		}
		
		ActionContext context = ActionContext.getContext();
		Map<String, Object> session = context.getSession();
		//session 에 정보 없으면 로그인 창 갔다오는 기능 추가 예정
		
		int sessionNum = (Integer) session.get("member_num");
		memberDataClass = (MemberVO) sqlMapper.queryForObject("member.userCheck", sessionNum);
		
		
		CommentParamClass.setComment_num(getComment_num());
		CommentParamClass.setMember_num(memberDataClass.getMember_num());
		CommentParamClass.setShowboard_num(getShowboard_num());
		CommentParamClass.setContent(getContent());
		CommentParamClass.setReg_date(today.getTime());
		
		
		if(ref == 0)
			sqlMapper.insert("showcaseDetailComment.insertBoard", CommentParamClass);
		else
			sqlMapper.insert("showcaseDetailComment.insertBoardReply", CommentParamClass);

		return SUCCESS;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public CommentPagingAction getPage() {
		return page;
	}

	public int getMember_num() {
		return member_num;
	}

	public int getShowcase_num() {
		return showcase_num;
	}

	public CommentBoardVO getCommentParamClass() {
		return CommentParamClass;
	}

	public CommentBoardVO getCommentResultClass() {
		return CommentResultClass;
	}

	public MemberVO getMemberDataClass() {
		return memberDataClass;
	}

	public int getComment_num() {
		return comment_num;
	}

	public int getShowboard_num() {
		return showboard_num;
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

	public void setList(List<CommentBoardVO> list) {
		this.list = list;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public void setPage(CommentPagingAction page) {
		this.page = page;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public void setShowcase_num(int showcase_num) {
		this.showcase_num = showcase_num;
	}

	public void setCommentParamClass(CommentBoardVO commentParamClass) {
		CommentParamClass = commentParamClass;
	}

	public void setCommentResultClass(CommentBoardVO commentResultClass) {
		CommentResultClass = commentResultClass;
	}

	public void setMemberDataClass(MemberVO memberDataClass) {
		this.memberDataClass = memberDataClass;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public void setShowboard_num(int showboard_num) {
		this.showboard_num = showboard_num;
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
	
	
	
}