package showcase;

import java.util.Date;

public class CommentBoardVO {
	private int comment_num;
	private int member_num;
	private int showboard_num;
	private String content;
	private Date reg_date;
	private String name;
	
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "CommentBoardVO [comment_num=" + comment_num + ", member_num=" + member_num + ", showboard_num="
				+ showboard_num + ", content=" + content + ", reg_date=" + reg_date + ", name=" + name + "]";
	}
	
	
}
