package basket;

import java.io.Reader;
import java.util.Calendar;
import java.util.Date;

import member.MemberVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class AddBasketAction extends ActionSupport {

    public static Reader reader; // 파일 스트림을 위한 reader
    public static SqlMapClient sqlMapper;// SqlMapClient API를 사용하기 위함

    private MemberVO memresultClass;
    private MemberVO memparamClass;
    private BasketVO paramBas;
    private BasketVO resultBas;

    private String subject;
    private String file_orgname;
    private String file_savname;
    private String date;
    private String address2;
    private int readcount;
    private int ordercount;

    private int showboard_num;
    private int basket_num;
    private int member_num;
    private Date basket_date;
    Calendar today = Calendar.getInstance();

    public AddBasketAction() throws Exception {
        // sqlMapConfig.xml 파일의 설정 내용을 가져온다
        reader = Resources.getResourceAsReader("sqlMapConfig.xml");
        // sqlMapConfig.xml 의 내용을 적용한 sqlMapper 객체 생성
        sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    public String execute() throws Exception {
        paramBas = new BasketVO();
        resultBas = new BasketVO();

        memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);

        paramBas.setMember_num(memresultClass.getMember_num());
        paramBas.setShowboard_num(getShowboard_num());			
        paramBas.setBasket_date(today.getTime());				

        sqlMapper.insert("basket.basketInsert", paramBas);
        return SUCCESS;
    }

    public static Reader getReader() {
        return reader;
    }

    public static void setReader(Reader reader) {
        AddBasketAction.reader = reader;
    }

    public static SqlMapClient getSqlMapper() {
        return sqlMapper;
    }

    public static void setSqlMapper(SqlMapClient sqlMapper) {
        AddBasketAction.sqlMapper = sqlMapper;
    }

    public MemberVO getMemresultClass() {
        return memresultClass;
    }

    public void setMemresultClass(MemberVO memresultClass) {
        this.memresultClass = memresultClass;
    }

    public MemberVO getMemparamClass() {
        return memparamClass;
    }

    public void setMemparamClass(MemberVO memparamClass) {
        this.memparamClass = memparamClass;
    }

    public BasketVO getParamBas() {
        return paramBas;
    }

    public void setParamBas(BasketVO paramBas) {
        this.paramBas = paramBas;
    }

    public BasketVO getResultBas() {
        return resultBas;
    }

    public void setResultBas(BasketVO resultBas) {
        this.resultBas = resultBas;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public int getReadcount() {
        return readcount;
    }

    public void setReadcount(int readcount) {
        this.readcount = readcount;
    }

    public int getOrdercount() {
        return ordercount;
    }

    public void setOrdercount(int ordercount) {
        this.ordercount = ordercount;
    }

    public int getShowboard_num() {
        return showboard_num;
    }

    public void setShowboard_num(int showboard_num) {
        this.showboard_num = showboard_num;
    }

    public int getBasket_num() {
        return basket_num;
    }

    public void setBasket_num(int basket_num) {
        this.basket_num = basket_num;
    }

    public int getMember_num() {
        return member_num;
    }

    public void setMember_num(int member_num) {
        this.member_num = member_num;
    }

    public Date getBasket_date() {
        return basket_date;
    }

    public void setBasket_date(Date basket_date) {
        this.basket_date = basket_date;
    }

    public Calendar getToday() {
        return today;
    }

    public void setToday(Calendar today) {
        this.today = today;
    }

}
