/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.support;

import java.sql.Date;

/**
 *
 * @author user2
 */
public class supportVO {

    private int ref_num, member_num, re_step, re_level;
    private Date reg_date;
    private String type, email, content;

    public int getRef_num() {
        return ref_num;
    }

    public void setRef_num(int ref_num) {
        this.ref_num = ref_num;
    }

    public int getMember_num() {
        return member_num;
    }

    public void setMember_num(int member_num) {
        this.member_num = member_num;
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

}
