/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

/**
 *
 * @author user2
 */
public class path {

    public static String path = "/showcaseImg/"; //jsp용
    
//    public static String savepath = path.class.getResource("").getPath() + "../../../../../WebContent/showcaseImg/"; //업로드용, 넷빈
    // /F:/java/konggaru/build/web/WEB-INF/classes/admin/
    
    public static String savepath = path.class.getResource("").getPath() + "../../../showcaseImg/"; //업로드용, 이클립스
    public static String barcodesav = path.class.getResource("").getPath() + "../../../barcodeImg/"; //바코드업로드용, 이클립스
    // C:\java\Yj\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\kong\WEB-INF\classes\admin
    // /F:/java/konggaru/build/classes/admin/
    public static String sql = "sqlMapConfig.xml";
    public static String support_listaction = "/support/supportlist";
    public static String notice_listaction = "/notice/noticelist";
    public static String member_listaction = "/member/memberlist";
}
