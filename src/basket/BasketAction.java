package basket;

import java.io.Reader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import member.MemberVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BasketAction extends ActionSupport {

    public static Reader reader; // 파일 스트림을 위한 reader
    public static SqlMapClient sqlMapper;// SqlMapClient API를 사용하기 위함

    private MemberVO memresultClass;
    private MemberVO memparamClass;
    private BasketVO paramBas;
    private BasketVO resultBas;

    private int basket_num;
    private int member_num;
    private int showboard_num;
    private Date basket_date;

    private List<BasketVO> basketList = new ArrayList<BasketVO>();

    private int currentPage = 1; // 현재 페이지
    private int totalCount;// 총 게시물의 수
    private int blockCount = 10; // 한 페이지의 게시물 수
    private int blockPage = 3; // 한 화면에 보여줄 페이지 수
    private String pagingHtml; // 페이징을 구현한 HTML
    private BasketpagingAction page; // 페이징 클래스
    private int num = 0;

    private String searchKeyword;
    private int searchNum;

    public BasketAction() throws Exception {
        // sqlMapConfig.xml 파일의 설정 내용을 가져온다
        reader = Resources.getResourceAsReader("sqlMapConfig.xml");
        // sqlMapConfig.xml 의 내용을 적용한 sqlMapper 객체 생성
        sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    public String execute() throws Exception {
        memparamClass = new MemberVO();
        memresultClass = new MemberVO();
        paramBas = new BasketVO();
        resultBas = new BasketVO();

        ActionContext context = ActionContext.getContext();
        Map<String, Object> session = context.getSession();
        int sessionid = (Integer) session.get("member_num");
        memresultClass = (MemberVO) sqlMapper.queryForObject("member.userCheck", sessionid);

        basketList = sqlMapper.queryForList("basket.basket_list", sessionid); //아닛 여기도...

        totalCount = basketList.size();// 전체 글의 갯수를 구함
        // 페이지액션 객체 생성
        page = new BasketpagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
        pagingHtml = page.getPagingHtml().toString();
        int lastCount = totalCount;
        // 현재 페이지의 마지막 글 번호가
        // 전체의 마지막 글번호보다 작다면
        // lastCount를 +1 번호로 설정
        if (page.getEndCount() < totalCount) {
            lastCount = page.getEndCount() + 1;
        }

        basketList = basketList.subList(page.getStartCount(), lastCount);

        return SUCCESS;
    }

    public String delete() throws Exception {
        paramBas = new BasketVO();
        resultBas = new BasketVO();
        memresultClass = new MemberVO();

        memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);

        basketList = sqlMapper.queryForList("basket.basket_list", getMember_num()); //여기도..
        paramBas.setBasket_num(basket_num);
        sqlMapper.delete("basket.basketDelete", paramBas);
        return SUCCESS;
    }

    public static Reader getReader() {
        return reader;
    }

    public static void setReader(Reader reader) {
        BasketAction.reader = reader;
    }

    public static SqlMapClient getSqlMapper() {
        return sqlMapper;
    }

    public static void setSqlMapper(SqlMapClient sqlMapper) {
        BasketAction.sqlMapper = sqlMapper;
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

    public int getShowboard_num() {
        return showboard_num;
    }

    public void setShowboard_num(int showboard_num) {
        this.showboard_num = showboard_num;
    }

    public Date getBasket_date() {
        return basket_date;
    }

    public void setBasket_date(Date basket_date) {
        this.basket_date = basket_date;
    }

    public List<BasketVO> getBasketList() {
        return basketList;
    }

    public void setBasketList(List<BasketVO> basketList) {
        this.basketList = basketList;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getBlockCount() {
        return blockCount;
    }

    public void setBlockCount(int blockCount) {
        this.blockCount = blockCount;
    }

    public int getBlockPage() {
        return blockPage;
    }

    public void setBlockPage(int blockPage) {
        this.blockPage = blockPage;
    }

    public String getPagingHtml() {
        return pagingHtml;
    }

    public void setPagingHtml(String pagingHtml) {
        this.pagingHtml = pagingHtml;
    }

    public BasketpagingAction getPage() {
        return page;
    }

    public void setPage(BasketpagingAction page) {
        this.page = page;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }

    public int getSearchNum() {
        return searchNum;
    }

    public void setSearchNum(int searchNum) {
        this.searchNum = searchNum;
    }

}
