/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.qna;

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
public class qnadeleteAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;
    private qnaVO pc, rc;

    private int qna_num;

    public qnadeleteAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    public String form() throws Exception {
        pc = new qnaVO();
        rc = new qnaVO();

        pc.setQna_num(getQna_num());
        rc = (qnaVO) sql.queryForObject("qna.selectOne", pc);

        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        pc = new qnaVO();
        rc = new qnaVO();

        pc.setQna_num(getQna_num());

        sql.update("qna.delete", pc);

        return SUCCESS;
    }

    public qnaVO getPc() {
        return pc;
    }

    public void setPc(qnaVO pc) {
        this.pc = pc;
    }

    public qnaVO getRc() {
        return rc;
    }

    public void setRc(qnaVO rc) {
        this.rc = rc;
    }

    public int getQna_num() {
        return qna_num;
    }

    public void setQna_num(int qna_num) {
        this.qna_num = qna_num;
    }

}
