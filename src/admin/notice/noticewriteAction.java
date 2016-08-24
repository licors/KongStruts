/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.notice;

import admin.showcase.path;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.Reader;
import java.sql.Date;

/**
 *
 * @author user2
 */
public class noticewriteAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;
    private noticeVO pc, rc;

    private int notice_num, readCount;
    private Date reg_date;
    private String subject, content;

    public noticewriteAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    @Override
    public String execute() throws Exception {
        pc = new noticeVO();
        rc = new noticeVO();

        return SUCCESS;
    }
}
