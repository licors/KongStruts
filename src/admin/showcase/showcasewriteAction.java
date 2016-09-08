/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.showcase;

import admin.path;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import member.MemberVO;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author user2
 */
public class showcasewriteAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;

    private showVO pc, rc;
    private MemberVO memresultClass;

    private int showboard_num, pay, readCount, orderCount;
    private String subject, address1, address2, tel, tag, content, file_orgname, file_savname, map, date, showboard_category;

    private List<File> upload = new ArrayList<File>(); // 파일 객체
    private List<String> uploadContentType = new ArrayList<String>(); // 컨텐츠 타입
    private List<String> uploadFileName = new ArrayList<String>(); // 파일 이름
    private String uploadpath = path.savepath; //저장용 경로
    private int index; // 경로

    public showcasewriteAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    public String showcasehide() throws Exception { //기간 지난 전시글 숨기기(수동)
        pc = new showVO();
        rc = new showVO();

        pc.setShowboard_num(getShowboard_num());
        sql.update("show.updatestatus", pc);

        return SUCCESS;
    }

    public String form() throws Exception {
        memresultClass = admin.MemberLoginCheck.getMember(sql, memresultClass);

        return SUCCESS;
    }

    @Override
    public String execute() throws Exception {
        pc = new showVO();
        rc = new showVO();

        pc.setSubject(getSubject());
        pc.setAddress1(getAddress1());
        pc.setAddress2(getAddress2());
        pc.setDate(getDate());
        pc.setPay(getPay());
        pc.setTel(getTel());
        pc.setTag(getTag());
        pc.setContent(getContent());
        pc.setShowboard_category(getShowboard_category());
        pc.setMap(getMap());
        pc.setShowboard_num(getShowboard_num());
        sql.insert("show.insert", pc);
        rc = (showVO) sql.queryForObject("show.selectLastNo");

        if (getUpload() != null) { //업로드 객체가 널이 아니면
            for (int i = 0; i < upload.size(); i++) { //업로드된 객체만큼 포문돌려서 저장
                File destFile = new File(uploadpath + getUploadFileName().get(i));
                FileUtils.copyFile((getUpload()).get(i), destFile);
            }
            if (upload.size() > 0) { //파일을 업로드했다면
                file_savname = getUploadFileName().get(0) + ",";
                for (int i = 1; i < upload.size(); i++) { //올린 갯수만큼 포문돌려서 파일이름에 , 붙이기
                    file_savname += getUploadFileName().get(i) + ",";
                }
                index = file_savname.lastIndexOf(',');
                file_savname = file_savname.substring(0, index);
            }

            pc.setShowboard_num(rc.getShowboard_num());
//            pc.setFile_orgname(getFile_savname()); // 원래 파일 이름         근데 이게 getsavname(원본)인지 getorgname인지 모르겠네(수호 08.25)
            pc.setFile_savname(getFile_savname());

            sql.update("show.updatefile", pc);

        }
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

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public int getPay() {
        return pay;
    }

    public void setPay(int pay) {
        this.pay = pay;
    }

    public int getReadCount() {
        return readCount;
    }

    public void setReadCount(int readCount) {
        this.readCount = readCount;
    }

    public int getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(int orderCount) {
        this.orderCount = orderCount;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFile_orgname() {
        return file_orgname;
    }

    public void setFile_orgname(String file_orgname) {
        this.file_orgname = file_orgname;
    }

    public String getFile_savname() {
        return file_savname;
    }

    public void setFile_savname(String file_savname) {
        this.file_savname = file_savname;
    }

    public String getMap() {
        return map;
    }

    public void setMap(String map) {
        this.map = map;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<File> getUpload() {
        return upload;
    }

    public void setUpload(List<File> upload) {
        this.upload = upload;
    }

    public String getUploadpath() {
        return uploadpath;
    }

    public void setUploadpath(String uploadpath) {
        this.uploadpath = uploadpath;
    }

    public String getShowboard_category() {
        return showboard_category;
    }

    public void setShowboard_category(String showboard_category) {
        this.showboard_category = showboard_category;
    }

    public MemberVO getMemresultClass() {
        return memresultClass;
    }

    public void setMemresultClass(MemberVO memresultClass) {
        this.memresultClass = memresultClass;
    }

    public List<String> getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(List<String> uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public List<String> getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(List<String> uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

}
