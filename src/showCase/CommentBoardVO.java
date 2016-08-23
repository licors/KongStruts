package showCase;

import java.util.Date;

public class CommentBoardVO {
	private int no;
	private String id;
	private String name;
	private String content;
	private Date reg_date;
	private int ref;
	private int re_step;
	private int re_level;
	
	public int getNo() {
		return no;
	}
	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public int getRef() {
		return ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	
}
