/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.member;

import admin.path;
import java.io.Reader;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import member.MemberVO;

public class memberadminmodifyAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sqlMapper;

    private MemberVO memresultClass;
    private MemberVO pc;

    private int member_num;
    private String email;
    private String oldpassword;
    private String password;
    private String password2;
    private String name;
    private String address;
    private String company;
    private int admin;

    private int currentPage = 1;

    public memberadminmodifyAction() throws Exception {
        reader = Resources.getResourceAsReader(path.sql);
        sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    public String form() throws Exception {
        memresultClass = new MemberVO();

        memresultClass = (MemberVO) sqlMapper.queryForObject("member.userCheck", getMember_num());

        currentPage = getCurrentPage();

        return SUCCESS;
    }

    public String execute() throws Exception {
        pc = new MemberVO();

        pc.setMember_num(getMember_num());
        pc.setEmail(getEmail());
        pc.setName(getName());
        pc.setAddress(getAddress());
        pc.setCompany(getCompany());

        sqlMapper.update("member.memberadminUpdate", pc);
        System.out.println("dd:" + toString());
        return SUCCESS;
    }

    @Override
    public String toString() {
        return "memberadminmodifyAction{" + "member_num=" + member_num + ", email=" + email + "[여긴 아무것도 없잔아?], oldpassword=" + oldpassword + ", password=" + password + ", password2=" + password2 + ", name=" + name + ", address=" + address + ", company=" + company + ", admin=" + admin + ", currentPage=" + currentPage + '}';
    }

    public MemberVO getMemresultClass() {
        return memresultClass;
    }

    public void setMemresultClass(MemberVO memresultClass) {
        this.memresultClass = memresultClass;
    }

    public int getMember_num() {
        return member_num;
    }

    public void setMember_num(int member_num) {
        this.member_num = member_num;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOldpassword() {
        return oldpassword;
    }

    public void setOldpassword(String oldpassword) {
        this.oldpassword = oldpassword;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

}
