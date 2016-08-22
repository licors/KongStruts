/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.qna;

/**
 *
 * @author user2
 */
public class qnaVO {

    private int qna_num;
    private String subject, content;

    public int getQna_num() {
        return qna_num;
    }

    public void setQna_num(int qna_num) {
        this.qna_num = qna_num;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
