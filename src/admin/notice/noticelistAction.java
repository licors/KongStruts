/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.notice;

import admin.pagingAction;
import admin.path;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import member.MemberVO;

/**
 *
 * @author user2
 */
public class noticelistAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;
    private MemberVO mc;

    private List<noticeVO> list = new ArrayList<noticeVO>();
    private int currentPage = 1, totalCount, blockCount = 10, blockPage = 5;
    private String pagingHtml;
    private pagingAction page;

    public noticelistAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    @Override
    public String execute() throws Exception {
        ActionContext context = ActionContext.getContext();
        Map<String, Object> session = context.getSession();
        if (!session.isEmpty()) {
            int sessionid = (Integer) session.get("member_num");
            mc = (MemberVO) sql.queryForObject("member.userCheck", sessionid);
        }

        list = sql.queryForList("notice.selectall");

        totalCount = list.size();
        page = new pagingAction(path.notice_listaction, currentPage, totalCount, blockCount, blockPage);
        pagingHtml = page.getPagingHtml().toString();
        int lastCount = totalCount;

        if (page.getEndCount() < totalCount) {
            lastCount = page.getEndCount() + 1;
        }
        list = list.subList(page.getStartCount(), lastCount);
        return SUCCESS;
    }

    public MemberVO getMc() {
        return mc;
    }

    public void setMc(MemberVO mc) {
        this.mc = mc;
    }

    public List<noticeVO> getList() {
        return list;
    }

    public void setList(List<noticeVO> list) {
        this.list = list;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getBlockCount() {
        return blockCount;
    }

    public void setBlockCount(int blockCount) {
        this.blockCount = blockCount;
    }

    public int getBlockPage() {
        return blockPage;
    }

    public void setBlockPage(int blockPage) {
        this.blockPage = blockPage;
    }

    public String getPagingHtml() {
        return pagingHtml;
    }

    public void setPagingHtml(String pagingHtml) {
        this.pagingHtml = pagingHtml;
    }

    public pagingAction getPage() {
        return page;
    }

    public void setPage(pagingAction page) {
        this.page = page;
    }

}
