package main;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import admin.pagingAction;
import admin.showcase.showVO;
import member.MemberVO;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class mainAction extends ActionSupport {

    private MemberVO memresultClass;
    private MemberVO memparamClass;
    public static Reader reader;
    public static SqlMapClient sqlMapper;

    private List<showVO> list1 = new ArrayList<showVO>();
    private List<showVO> list2 = new ArrayList<showVO>();
    private List<showVO> list3 = new ArrayList<showVO>();

    private showVO goods_paramClass = new showVO();
    private showVO goods_resultClass = new showVO();

    private String searchKeyword;
    private String goods_category;

    private int currentPage = 1;
    private int totalCount;
    private int blockCount = 6;
    private int blockPage = 3;
    private String pagingHtml;
    private String adpagingHtml;
    private pagingAction page;
    private int num = 0;

    public mainAction() throws Exception {

        reader = Resources.getResourceAsReader("sqlMapConfig.xml");

        sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    public String execute() throws Exception {
        memparamClass = new MemberVO();
        memresultClass = new MemberVO();
        
        ActionContext context = ActionContext.getContext();
        Map<String, Object> session = context.getSession();
        String sessionid = (String) session.get("id");
        memresultClass = (MemberVO) sqlMapper.queryForObject("UserCheck", sessionid);

        list1 = sqlMapper.queryForList("support.select_9_showacse");
        list2 = sqlMapper.queryForList("support.select_9_art");
        list3 = sqlMapper.queryForList("support.select_9_event");

        return SUCCESS;
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

    public static Reader getReader() {
        return reader;
    }

    public static void setReader(Reader reader) {
        mainAction.reader = reader;
    }

    public static SqlMapClient getSqlMapper() {
        return sqlMapper;
    }

    public static void setSqlMapper(SqlMapClient sqlMapper) {
        mainAction.sqlMapper = sqlMapper;
    }

    public List<showVO> getList1() {
        return list1;
    }

    public void setList1(List<showVO> list1) {
        this.list1 = list1;
    }

    public List<showVO> getList2() {
        return list2;
    }

    public void setList2(List<showVO> list2) {
        this.list2 = list2;
    }

    public List<showVO> getList3() {
        return list3;
    }

    public void setList3(List<showVO> list3) {
        this.list3 = list3;
    }

    public showVO getGoods_paramClass() {
        return goods_paramClass;
    }

    public void setGoods_paramClass(showVO goods_paramClass) {
        this.goods_paramClass = goods_paramClass;
    }

    public showVO getGoods_resultClass() {
        return goods_resultClass;
    }

    public void setGoods_resultClass(showVO goods_resultClass) {
        this.goods_resultClass = goods_resultClass;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }

    public String getGoods_category() {
        return goods_category;
    }

    public void setGoods_category(String goods_category) {
        this.goods_category = goods_category;
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

    public String getAdpagingHtml() {
        return adpagingHtml;
    }

    public void setAdpagingHtml(String adpagingHtml) {
        this.adpagingHtml = adpagingHtml;
    }

    public pagingAction getPage() {
        return page;
    }

    public void setPage(pagingAction page) {
        this.page = page;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
