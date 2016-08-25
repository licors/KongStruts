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

/**
 *
 * @author user2
 */
public class supportviewAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;
    private supportVO pc, rc;

    private int support_num;

    public supportviewAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    @Override
    public String execute() throws Exception {
        pc = new supportVO();
        rc = new supportVO();
        
        rc = (supportVO) sql.queryForObject("selectOne", getSupport_num());

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

}
