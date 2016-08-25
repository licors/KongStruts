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
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.Reader;
import java.util.Date;
import java.util.Calendar;

/**
 *
 * @author user2
 */
public class noticewriteAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;
    private noticeVO pc, rc;

    private Date reg_date;
    private String subject, content;
    Calendar today = Calendar.getInstance();

    public noticewriteAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    @Override
    public String execute() throws Exception {
        pc = new noticeVO();
        rc = new noticeVO();

        pc.setSubject(getSubject());
        pc.setContent(getContent());
        pc.setReg_date(today.getTime());

        sql.insert("notice.insert", pc);

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

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
