/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.notice;

import admin.path;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.Reader;
import java.util.Map;
import member.MemberVO;

/**
 *
 * @author user2
 */
public class noticeviewAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;
    private noticeVO pc, rc;
    private MemberVO memresultClass;

    private int notice_num;
    private int currentPage = 1;

    public noticeviewAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    @Override
    public String execute() throws Exception {
        pc = new noticeVO();
        rc = new noticeVO();

        ActionContext context = ActionContext.getContext();
        Map<String, Object> session = context.getSession();
        int sessionid = (Integer) session.get("member_num");
        memresultClass = (MemberVO) sql.queryForObject("member.userCheck", sessionid);

        pc.setNotice_num(getNotice_num());
        sql.update("notice.readcount", pc);

        currentPage = getCurrentPage();

        rc = (noticeVO) sql.queryForObject("notice.selectOne", pc);

        return SUCCESS;
    }

    public noticeVO getPc() {
        return pc;
    }

    public void setPc(noticeVO pc) {
        this.pc = pc;
    }

    public noticeVO getRc() {
        return rc;
    }

    public void setRc(noticeVO rc) {
        this.rc = rc;
    }

    public int getNotice_num() {
        return notice_num;
    }

    public void setNotice_num(int notice_num) {
        this.notice_num = notice_num;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public MemberVO getMemresultClass() {
        return memresultClass;
    }

    public void setMemresultClass(MemberVO memresultClass) {
        this.memresultClass = memresultClass;
    }

}
