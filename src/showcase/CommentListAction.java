package showcase;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;

public class CommentListAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sqlMapper;

    private List<CommentBoardVO> list = new ArrayList<CommentBoardVO>();
    private int currentPage = 1;
    private int totalCount;
    private int blockCount = 10;
    private int blockPage = 5;
    private String pagingHtml;
    private CommentPagingAction page;

    private int member_num;
    private int comment_num;
    private int showboard_num;
    private int login_member_num;
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
        list = sqlMapper.queryForList("showcaseDetailComment.selectAll", getShowboard_num());

        MemberVO memberDataClass = null;
        memberDataClass = admin.MemberLoginCheck.getMember(sqlMapper, memberDataClass);
        if(memberDataClass == null) {
        	login_member_num = -1;
        } else {
        	login_member_num = memberDataClass.getMember_num();
        }
        
        
        totalCount = list.size();
        page = new CommentPagingAction(currentPage, totalCount, blockCount, blockPage, getShowboard_num());
        pagingHtml = page.getPagingHtml().toString();

        int lastCount = totalCount;

        if (page.getEndCount() < totalCount) {
            lastCount = page.getEndCount() + 1;
        }
        list = list.subList(page.getStartCount(), lastCount);

        return SUCCESS;
    }

    public List<CommentBoardVO> getList() {
        return list;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public String getPagingHtml() {
        return pagingHtml;
    }

    public int getMember_num() {
        return member_num;
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

    public void setPagingHtml(String pagingHtml) {
        this.pagingHtml = pagingHtml;
    }

    public void setMember_num(int member_num) {
        this.member_num = member_num;
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

	public int getLogin_member_num() {
		return login_member_num;
	}

	public void setLogin_member_num(int login_member_num) {
		this.login_member_num = login_member_num;
	}

}
