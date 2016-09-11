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

public class CommentWriteAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sqlMapper;

    private CommentBoardVO CommentParamClass;
    private CommentBoardVO CommentResultClass;
    private MemberVO memberDataClass;

    private int showboard_num;
    private String subject;
    private String name;
    private String content;
    Calendar today = Calendar.getInstance();

    public CommentWriteAction() throws IOException {
        reader = Resources.getResourceAsReader("sqlMapConfig.xml");
        sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();

    }

    public String form() throws Exception {
        return SUCCESS;

    }

    public String execute() throws Exception {
        memberDataClass = new MemberVO();
        CommentParamClass = new CommentBoardVO();
        CommentResultClass = new CommentBoardVO();

        memberDataClass = admin.MemberLoginCheck.getMember(sqlMapper, memberDataClass);
        if(memberDataClass == null) {
        	return LOGIN;
        }

        CommentParamClass.setMember_num(memberDataClass.getMember_num());
        CommentParamClass.setShowboard_num(getShowboard_num());
        CommentParamClass.setContent(getContent());
        CommentParamClass.setReg_date(today.getTime());

        sqlMapper.insert("showcaseDetailComment.insertBoard", CommentParamClass);

        return SUCCESS;
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
    
    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public MemberVO getMemberDataClass() {
        return memberDataClass;
    }

    public void setMemberDataClass(MemberVO memberDataClass) {
        this.memberDataClass = memberDataClass;
    }

    public int getShowboard_num() {
        return showboard_num;
    }

    public void setShowboard_num(int showboard_num) {
        this.showboard_num = showboard_num;
    }

    public CommentBoardVO getCommentParamClass() {
        return CommentParamClass;
    }

    public CommentBoardVO getCommentResultClass() {
        return CommentResultClass;
    }

    public void setCommentParamClass(CommentBoardVO commentParamClass) {
        CommentParamClass = commentParamClass;
    }

    public void setCommentResultClass(CommentBoardVO commentResultClass) {
        CommentResultClass = commentResultClass;
    }

}
