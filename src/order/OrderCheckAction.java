package order;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import admin.showcase.showVO;
import basket.BasketVO;
import order.OrderVO;
import member.MemberVO;

public class OrderCheckAction extends ActionSupport {
    public static Reader reader;
    public static SqlMapClient sqlMapper;
    
    private MemberVO memparamClass;
    private MemberVO memresultClass;
    private showVO show_paramClass;
    private showVO show_resultClass;
    private OrderVO order_paramClass;
    private OrderVO order_resultClass;
    private BasketVO paramBas;
    private BasketVO resultBas;
    
    private int showboard_num; // 전시회 번호
    private int member_num; // 주문자 번호
    
    public OrderCheckAction() throws IOException {
        reader = Resources.getResourceAsReader("sqlMapConfig.xml");
        sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }
    
    public String execute() throws Exception {
        memresultClass = new MemberVO();
        show_resultClass = new showVO();
        order_paramClass = new OrderVO();
        order_resultClass = new OrderVO();
        
        memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);

        order_paramClass.setMember_num(memresultClass.getMember_num());
        order_paramClass.setShowboard_num(showboard_num);
        
        order_resultClass = (OrderVO) sqlMapper.queryForObject("order.order_check", order_paramClass);

        if(order_resultClass != null && order_resultClass.getStatus().equals("티켓 신청")) {
        	return INPUT;
        } else {
        	return SUCCESS;
        }  
    }
    
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		OrderCheckAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		OrderCheckAction.sqlMapper = sqlMapper;
	}

	public MemberVO getMemparamClass() {
		return memparamClass;
	}

	public void setMemparamClass(MemberVO memparamClass) {
		this.memparamClass = memparamClass;
	}

	public MemberVO getMemresultClass() {
		return memresultClass;
	}

	public void setMemresultClass(MemberVO memresultClass) {
		this.memresultClass = memresultClass;
	}

	public showVO getShow_paramClass() {
		return show_paramClass;
	}

	public void setShow_paramClass(showVO show_paramClass) {
		this.show_paramClass = show_paramClass;
	}

	public showVO getShow_resultClass() {
		return show_resultClass;
	}

	public void setShow_resultClass(showVO show_resultClass) {
		this.show_resultClass = show_resultClass;
	}

	public OrderVO getOrder_paramClass() {
		return order_paramClass;
	}

	public void setOrder_paramClass(OrderVO order_paramClass) {
		this.order_paramClass = order_paramClass;
	}

	public OrderVO getOrder_resultClass() {
		return order_resultClass;
	}

	public void setOrder_resultClass(OrderVO order_resultClass) {
		this.order_resultClass = order_resultClass;
	}

	public int getShowboard_num() {
		return showboard_num;
	}

	public void setShowboard_num(int showboard_num) {
		this.showboard_num = showboard_num;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
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
}
