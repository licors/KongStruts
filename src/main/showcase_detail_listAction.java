/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import admin.path;
import com.opensymphony.xwork2.ActionSupport;

import admin.showcase.showVO;
import member.MemberVO;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class showcase_detail_listAction extends ActionSupport {

    private MemberVO memresultClass;
    private showVO rc, pc;

    public static Reader reader;
    public static SqlMapClient sql;

    private List<showVO> list = new ArrayList<showVO>();

    public String showboard_category;
    public String img = path.path;

    public showcase_detail_listAction() throws Exception {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    @Override
    public String execute() throws Exception {
        memresultClass = new MemberVO();
        rc = new showVO();
        pc = new showVO();

        memresultClass = admin.MemberLoginCheck.getMember(sql, memresultClass);

        pc.setShowboard_category(new String(getShowboard_category().getBytes("8859_1"), "UTF-8")); //파라메타에서 카테고리 디코딩해서 게시글 추출
        list = sql.queryForList("show.select_9", pc);
        
        showboard_category = new String(getShowboard_category().getBytes("8859_1"), "UTF-8"); //파라메타에서 카테고리 디코딩해서 jsp에 넘겨줌

        return SUCCESS;
    }

    public MemberVO getMemresultClass() {
        return memresultClass;
    }

    public void setMemresultClass(MemberVO memresultClass) {
        this.memresultClass = memresultClass;
    }

    public showVO getRc() {
        return rc;
    }

    public void setRc(showVO rc) {
        this.rc = rc;
    }

    public showVO getPc() {
        return pc;
    }

    public void setPc(showVO pc) {
        this.pc = pc;
    }

    public List<showVO> getList() {
        return list;
    }

    public void setList(List<showVO> list) {
        this.list = list;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getShowboard_category() {
        return showboard_category;
    }

    public void setShowboard_category(String showboard_category) {
        this.showboard_category = showboard_category;
    }

}
