/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.showcase;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author user2
 */
public class showcasewriteAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sql;

    private showVO pc, rc;

    private int show_num, pay, readCount, orderCount;
    private String subject, address1, address2, tel, tag, content, file_orgname, file_savname, map, date, status, showboard_category;

    private List<File> upload = new ArrayList<File>();
//    private List<String> uploadname = new ArrayList<String>();
    private List<String> uploadtype = new ArrayList<String>();
    private String uploadpath = path.path;

    public showcasewriteAction() throws IOException {
        reader = Resources.getResourceAsReader(path.sql);
        sql = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
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
        sql.insert("show.insert", pc);
//        if (getUpload() != null) {
//            rc = (showVO) sql.queryForList("show.selectLastNo");
////            String file_name = "", file_ext = "";
//            StringBuilder orgname = new StringBuilder();
//            StringBuilder savname = new StringBuilder();
//
//            for (Iterator<File> itFile = upload.iterator(); itFile.hasNext();) {
////            for (int i = 0; i < upload.size(); i++) {
//                File k = itFile.next();
//                String file_name = "file_" + rc.getShowboard_num();
//                String file_ext = k.substring(getUploadname().lastIndexOf('.') + 1, getUploadname().length());
//                File destFile = new File(uploadpath + file_name + "." + file_ext);
//                FileUtils.copyFile(k, destFile);
//                if (upload.) {
//                    orgname.append(getUploadname().get(i));
//                }
//                savname.append()
//            }
//            for (Iterator<File> itName = uploadname.iterator(); itName.hasNext();) {
//                
//            }
//
//            pc.setShowboard_num(rc.getShowboard_num());
//            pc.setFile_orgname(getUploadname().get(i));
//            pc.setFile_savname(file_name + "." + file_ext);
//            sql.update("show.updatefile", pc);
//        }
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

    public int getShow_num() {
        return show_num;
    }

    public void setShow_num(int show_num) {
        this.show_num = show_num;
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

//    public List<String> getUploadname() {
//        return uploadname;
//    }
//
//    public void setUploadname(List<String> uploadname) {
//        this.uploadname = uploadname;
//    }

    public List<String> getUploadtype() {
        return uploadtype;
    }

    public void setUploadtype(List<String> uploadtype) {
        this.uploadtype = uploadtype;
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

}
