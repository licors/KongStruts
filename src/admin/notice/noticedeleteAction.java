/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.notice;

import admin.path;
import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import java.io.IOException;
import java.io.Reader;

/**
 *
 * @author user2
 */
public class noticedeleteAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;
    private noticeVO pc, rc;

    private int notice_num;
    private int currentPage = 1;

    public noticedeleteAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }
    
    /* 삭제처리를 위해 원레 글의 정보를 전송! */
    public String form() throws Exception {
        pc = new noticeVO();
        rc = new noticeVO();

        pc.setNotice_num(getNotice_num());
        rc = (noticeVO) sql.queryForObject("notice.selectOne", pc);
        
        currentPage = getCurrentPage();

        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        pc = new noticeVO();
        rc = new noticeVO();

        pc.setNotice_num(getNotice_num());

        sql.update("notice.delete", pc);
        
        currentPage = getCurrentPage();

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

}
