/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import member.MemberVO;

/**
 *
 * @author user2
 */
public class MemberLoginCheck {

    public static MemberVO getMember(SqlMapClient sql, MemberVO memresultClass) throws Exception {
        ActionContext context = ActionContext.getContext();
        Map<String, Object> session = context.getSession();
        if (!session.isEmpty()) {
            int sessionid = (Integer) session.get("member_num");
            return memresultClass = (MemberVO) sql.queryForObject("member.userCheck", sessionid);
        }
        return null;
    }
}
