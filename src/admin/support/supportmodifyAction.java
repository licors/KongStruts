/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.support;

import admin.path;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.Reader;
import member.MemberVO;

/**
 *
 * @author user2
 */
public class supportmodifyAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;
    private supportVO pc, rc;
    private MemberVO mc;

    private int support_num;
    private String type, email, content;

    public supportmodifyAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    public String form() throws Exception {
        pc = new supportVO();
        rc = new supportVO();

        pc.setSupport_num(getSupport_num());
        rc = (supportVO) sql.queryForObject("show.selectOne", getSupport_num());
        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        pc = new supportVO();
        rc = new supportVO();

        pc.setType(getType());
        pc.setEmail(getEmail());
        pc.setContent(getContent());

        sql.update("support.update", pc);

        rc = (supportVO) sql.queryForObject("support.selectOne", getSupport_num());

        return SUCCESS;
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

    public int getSupport_num() {
        return support_num;
    }

    public void setSupport_num(int support_num) {
        this.support_num = support_num;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public MemberVO getMc() {
        return mc;
    }

    public void setMc(MemberVO mc) {
        this.mc = mc;
    }

}
