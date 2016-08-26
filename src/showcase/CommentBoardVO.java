package showcase;

import java.util.Date;

/*CREATE TABLE SHOWCASECOMMENT
(COMMENT_NUM NUMBER PRIMARY KEY,
	SHOWBOARD_NUM NUMBER NOT NULL,
	MEMBER_NUM NUMBER NOT NULL,
	CONTENT VARCHAR2(1000)NOT NULL,
	REG_DATE DATE NOT NULL,
	RE_STEP NUMBER(10),
	RE_LEVEL NUMBER(10)
)

alter table SHOWCASECOMMENT add constraint fk_showboardcomment_member_num FOREIGN KEY(MEMBER_NUM) 
	references MEMBER(MEMBER_NUM)
alter table SHOWCASECOMMENT add constraint fk_showboardcomment_showbd_num FOREIGN KEY(SHOWBOARD_NUM) 
	references SHOWBOARD(SHOWBOARD_NUM)*/
	
public class CommentBoardVO {
	private int comment_num;
	private int member_num;
	private int showboard_num;
	private String content;
	private Date reg_date;
	private int ref;
	private int re_step;
	private int re_level;
	
	
	public int getComment_num() {
		return comment_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public int getShowboard_num() {
		return showboard_num;
	}
	public String getContent() {
		return content;
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
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public void setShowboard_num(int showboard_num) {
		this.showboard_num = showboard_num;
	}
	public void setContent(String content) {
		this.content = content;
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
	
	
}
