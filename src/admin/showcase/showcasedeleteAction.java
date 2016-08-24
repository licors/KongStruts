/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.showcase;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.IOException;
import java.io.Reader;

/**
 *
 * @author user2
 */
public class showcasedeleteAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;

    private showVO pc, rc;
    private int showboard_num;
    private String uploadpath = path.path;

    public showcasedeleteAction() throws IOException {
        reader = Resources.getResourceAsReader(path.path);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    @Override
    public String execute() throws Exception {
        pc = new showVO();
        rc = new showVO();
        rc = (showVO) sql.queryForObject("show.selectOne", getShowboard_num());
        //여러파일을 지우도록 수정해야함
        File delFile = new File(uploadpath + rc.getFile_savname());
        delFile.delete();

        pc.setShowboard_num(getShowboard_num());
        sql.update("delete", pc);
        return SUCCESS;
    }

    public showVO getPc() {
        return pc;
    }

    public void setPc(showVO pc) {
        this.pc = pc;
    }

    public showVO getRc() {
        return rc;
    }

    public void setRc(showVO rc) {
        this.rc = rc;
    }

    public int getShowboard_num() {
        return showboard_num;
    }

    public void setShowboard_num(int showboard_num) {
        this.showboard_num = showboard_num;
    }

    public String getUploadpath() {
        return uploadpath;
    }

    public void setUploadpath(String uploadpath) {
        this.uploadpath = uploadpath;
    }

}
