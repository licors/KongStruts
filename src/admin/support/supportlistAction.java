/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.support;

import admin.pagingAction;
import admin.path;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import member.MemberVO;

/**
 *
 * @author user2
 */
public class supportlistAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;
    private supportVO pc, rc;
    private MemberVO memresultClass;

    private int member_num;

    private List<supportVO> list = new ArrayList<supportVO>();
    private int currentPage = 1, totalCount, blockCount = 10, blockPage = 5;
    private String pagingHtml;
    private pagingAction page;

    public supportlistAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    @Override
    public String execute() throws Exception {
        pc = new supportVO();
        rc = new supportVO();

        memresultClass = admin.MemberLoginCheck.getMember(sql, memresultClass);

        if (memresultClass != null && memresultClass.getAdmin() > 0) { //운영자 구분 1이면 운영자임
            list = sql.queryForList("support.selectall"); //관리자용

            totalCount = list.size();
            page = new pagingAction(path.support_listaction, currentPage, totalCount, blockCount, blockPage);
            pagingHtml = page.getPagingHtml().toString();
            int lastCount = totalCount;

            if (page.getEndCount() < totalCount) {
                lastCount = page.getEndCount() + 1;
            }
            list = list.subList(page.getStartCount(), lastCount);
        }
        return SUCCESS;
    }

    public int getMember_num() {
        return member_num;
    }

    public void setMember_num(int member_num) {
        this.member_num = member_num;
    }

    public supportVO getPc() {
        return pc;
    }

    public void setPc(supportVO pc) {
        this.pc = pc;
    }

    public supportVO getRc() {
        return rc;
    }

    public void setRc(supportVO rc) {
        this.rc = rc;
    }

    public List<supportVO> getList() {
        return list;
    }

    public void setList(List<supportVO> list) {
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

    public MemberVO getMemresultClass() {
        return memresultClass;
    }

    public void setMemresultClass(MemberVO memresultClass) {
        this.memresultClass = memresultClass;
    }

}
