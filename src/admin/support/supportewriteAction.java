/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.support;

import admin.path;
import admin.support.email.support_email;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;
import java.util.Date;
import member.MemberVO;

/**
 *
 * @author user2
 */
public class supportewriteAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;
    private supportVO pc, rc;
    private MemberVO memresultClass;

    private int support_num, member_num, ref, re_step, re_level;
    private Date reg_date;
    private String type, email, content;
    Calendar today = Calendar.getInstance();

    public supportewriteAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    public String form() throws Exception {
        rc = new supportVO();

        memresultClass = admin.MemberLoginCheck.getMember(sql, memresultClass);

        rc = (supportVO) sql.queryForObject("support.selectOne", getSupport_num());
        email = getEmail();
        support_num = getSupport_num();

        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        pc = new supportVO();
        rc = new supportVO();

        memresultClass = admin.MemberLoginCheck.getMember(sql, memresultClass);

        if (ref == 0) {
            pc.setRe_step(0);
            pc.setRe_level(0);

        } else {

            pc.setRef(getRef());
            pc.setRe_step(getRe_step());
            sql.update("support.updateReplyStep", pc);

            pc.setRe_step(getRe_step() + 1);
            pc.setRe_level(getRe_level() + 1);
            pc.setRef(getRef());
        }

        pc.setType("답변");
        pc.setMember_num(memresultClass.getMember_num());
        pc.setEmail(memresultClass.getEmail());
        pc.setContent(getContent());
        pc.setReg_date(today.getTime());
//        pc.setRef(rc.getSupport_num()); //어느글의 덧글인지 추적
//        pc.setRe_step(rc.getRe_step() + 1); //덧글하기
//        pc.setRe_level(getRe_level());

        sql.insert("support.insertmail", pc);
        //보내는사람,받는사람,보내는사람이름,제목,내용
        //서버이메일, 문의한사람, 관리자이름(관리자), 제목은 문의답변, 답변내용
        support_email.getInstance().send(support_email.getServer(), getEmail(), memresultClass.getName(), "문의하신 답변입니다.", getContent());
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

    public int getMember_num() {
        return member_num;
    }

    public void setMember_num(int member_num) {
        this.member_num = member_num;
    }

    public int getRef() {
        return ref;
    }

    public void setRef(int ref) {
        this.ref = ref;
    }

    public int getRe_step() {
        return re_step;
    }

    public void setRe_step(int re_step) {
        this.re_step = re_step;
    }

    public int getRe_level() {
        return re_level;
    }

    public void setRe_level(int re_level) {
        this.re_level = re_level;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
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

    public Calendar getToday() {
        return today;
    }

    public void setToday(Calendar today) {
        this.today = today;
    }

    public MemberVO getMemresultClass() {
        return memresultClass;
    }

    public void setMemresultClass(MemberVO memresultClass) {
        this.memresultClass = memresultClass;
    }

}
