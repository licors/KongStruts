/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.qna;

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
public class qnalistAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;

    private MemberVO memresultClass;
    private List<qnaVO> list = new ArrayList<qnaVO>();

    public qnalistAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    @Override
    public String execute() throws Exception {
        list = sql.queryForList("qna.selectall");

        memresultClass = admin.MemberLoginCheck.getMember(sql, memresultClass);

        return SUCCESS;
    }

    public List<qnaVO> getList() {
        return list;
    }

    public void setList(List<qnaVO> list) {
        this.list = list;
    }

    public MemberVO getMemresultClass() {
        return memresultClass;
    }

    public void setMemresultClass(MemberVO memresultClass) {
        this.memresultClass = memresultClass;
    }

}
