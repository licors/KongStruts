package showcase;

import admin.path;
import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.showcase.showVO;
import member.MemberVO;

public class ShowcaseReadAction extends ActionSupport {

    public static Reader reader;
    public static SqlMapClient sqlMapper;

    private showVO paramClass;
    private showVO resultClass;
    private MemberVO memresultClass;

    private int showboard_num;
    private int pay;                //무료는 0원
    private String subject;
    private String address1;        // 시/도
    private String address2;        // 나머지 주소
    private String tel;
    private String tag;              //ex      웨딩,혼수, ...
    private String content;
    private String file_savname;    //ex      11.jpg,22.jpg,33.jpg
    private String map;
    private String date;     //ex    2016.07.18(월) ~ 2016.09.04(일) / 49일간  (들어가있는거 그대로 출력)
    private String status;   //   일정 항목 옆에 '개최중'

    private String img = path.path; // jsp 이미지 표기용 상대경로

    public ShowcaseReadAction() throws IOException {
        // TODO Auto-generated constructor stub
        reader = Resources.getResourceAsReader("sqlMapConfig.xml");
        sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    @Override
    public String execute() throws Exception {
        paramClass = new showVO();
        resultClass = new showVO();
        // TODO Auto-generated method stub
        // 해당 글의 조회수 +1.
        paramClass.setShowboard_num(getShowboard_num());
        sqlMapper.update("show.readcountPlus", paramClass);

        // 해당 번호의 글을 가져온다.
        resultClass = (showVO) sqlMapper.queryForObject("show.selectOne", paramClass.getShowboard_num());

        memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);

        return SUCCESS;
    }

    public showVO getParamClass() {
        return paramClass;
    }

    public showVO getResultClass() {
        return resultClass;
    }

    public void setParamClass(showVO paramClass) {
        this.paramClass = paramClass;
    }

    public void setResultClass(showVO resultClass) {
        this.resultClass = resultClass;
    }

    public int getShowboard_num() {
        return showboard_num;
    }

    public int getPay() {
        return pay;
    }

    public String getSubject() {
        return subject;
    }

    public String getAddress1() {
        return address1;
    }

    public String getAddress2() {
        return address2;
    }

    public String getTel() {
        return tel;
    }

    public String getTag() {
        return tag;
    }

    public String getContent() {
        return content;
    }

    public String getFile_savname() {
        return file_savname;
    }

    public String getMap() {
        return map;
    }

    public String getDate() {
        return date;
    }

    public String getStatus() {
        return status;
    }

    public void setShowboard_num(int showboard_num) {
        this.showboard_num = showboard_num;
    }

    public void setPay(int pay) {
        this.pay = pay;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setFile_savname(String file_savname) {
        this.file_savname = file_savname;
    }

    public void setMap(String map) {
        this.map = map;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

	public MemberVO getMemresultClass() {
		return memresultClass;
	}

	public void setMemresultClass(MemberVO memresultClass) {
		this.memresultClass = memresultClass;
	}

}
