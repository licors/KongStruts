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

//    public static String path = "/showcaseImg/";
    public static String path = path.class.getResource("").getPath() + "../../../../../WebContent/showcaseImg/";
    ///F:/java/konggaru/build/web/WEB-INF/classes/admin/
    public static String sql = "sqlMapConfig.xml";
    public static String support_listaction = "";
    public static String notice_listaction = "";
}
