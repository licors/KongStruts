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
import member.MemberVO;

/**
 *
 * @author user2
 */
public class qnaviewAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;
    private qnaVO pc, rc;
    private MemberVO memresultClass;

    private int qna_num;

    public qnaviewAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    @Override
    public String execute() throws Exception {
        pc = new qnaVO();
        rc = new qnaVO();

        rc = (qnaVO) sql.queryForObject("qna.selectOne", getQna_num());
        memresultClass = admin.MemberLoginCheck.getMember(sql, memresultClass);

        return SUCCESS;
    }

    public MemberVO getMemresultClass() {
        return memresultClass;
    }

    public void setMemresultClass(MemberVO memresultClass) {
        this.memresultClass = memresultClass;
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
