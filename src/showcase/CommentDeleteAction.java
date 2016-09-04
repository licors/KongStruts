package showcase;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;

public class CommentDeleteAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sqlMapper;

    private CommentBoardVO paramClass;
    private CommentBoardVO resultClass;
    private MemberVO memberDataClass;
    private int currentPage;
    private int comment_num;
    private int showboard_num;

    public CommentDeleteAction() throws IOException {
        reader = Resources.getResourceAsReader("sqlMapConfig.xml");
        sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    public String execute() throws Exception {
        memberDataClass = new MemberVO();
        paramClass = new CommentBoardVO();
//		resultClass = new CommentBoardVO();

        memberDataClass = admin.MemberLoginCheck.getMember(sqlMapper, memberDataClass);
        if(memberDataClass == null) {
        	return LOGIN;
        }
        
        paramClass = (CommentBoardVO) sqlMapper.queryForObject("showcaseDetailComment.selectOne", getComment_num());

        System.out.println("getCommentNum : " + getComment_num());
        System.out.println("commentDelete : memberData : " + memberDataClass.getMember_num());
        System.out.println("commentDelete : paramData : " + paramClass.getMember_num());
//		paramClass.setMember_num(memberDataClass.getMember_num());
        if (paramClass.getMember_num() != memberDataClass.getMember_num()) {
            return ERROR;
        }
        sqlMapper.update("showcaseDetailComment.deleteBoard", paramClass.getComment_num());
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

	public int getShowboard_num() {
		return showboard_num;
	}

	public void setShowboard_num(int showboard_num) {
		this.showboard_num = showboard_num;
	}

}
