package main;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import member.MemberVO;
import admin.showcase.showVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class showcaselistAction extends ActionSupport {

    private MemberVO memresultClass;
    private MemberVO memparamClass;
    public static Reader reader; // 파일 스트림을 위한 reader
    public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper객체

	private List<showVO> list = new ArrayList<showVO>();

    private showVO showboard_paramClass = new showVO();
    private showVO showboard_resultClass = new showVO();

    private String searchKeyword;
    private String showboard_category;

    // 생성자
    public showcaselistAction() throws IOException {
        reader = Resources.getResourceAsReader("sqlMapConfig.xml");
        // sqlMapConfig.xml 파일의 설정내용을 가져옴
        sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close();
    }

    //비회원, 일반회원  상품메뉴(All) 클릭시
    public String execute() throws Exception {
        memparamClass = new MemberVO();
        memresultClass = new MemberVO();
        showboard_resultClass = new showVO();
        showboard_paramClass = new showVO();
        
        memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);
        // 검색값이 있으면 category()메서드를 호출.
        if (getShowboard_category() != null) {
            return category();
            // 검색값이 있으면 search()메서드를 호출
        }
//        if (getSearchKeyword() != null) {
//            return search();
//        }
		list = sqlMapper.queryForList("show.selectall");
        System.out.println(list);
        return SUCCESS;
    }	

    //관리자  상품메뉴(All) 클릭시
    public String execute2() throws Exception {
        memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);
        // 검색값이 있으면 search()메서드를 호출.
        if (getShowboard_category() != null) {
            return category();
        }
//        if (getSearchKeyword() != null) {
//            return search();
//        }
        showboard_paramClass = new showVO();
		list = sqlMapper.queryForList("show.selectall", showboard_paramClass);
        System.out.println(list);

        return SUCCESS;
    }
    //비회원, 일반회원  상품메뉴(전시,미술,이벤트) 클릭시
    public String category() throws Exception {
        memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);

        showboard_paramClass = new showVO();
        
/*        showboard_paramClass.setShowboard_category(getShowboard_category());
		list = sqlMapper.queryForList("select_category", showboard_paramClass);*/
        
        showboard_paramClass.setShowboard_category(new String(getShowboard_category().getBytes("8859_1"), "UTF-8")); //파라메타에서 카테고리 디코딩해서 게시글 추출
        list = sqlMapper.queryForList("show.select_category", showboard_paramClass);
        
        showboard_category = new String(getShowboard_category().getBytes("8859_1"), "UTF-8"); //파라메타에서 카테고리 디코딩해서 jsp에 넘겨줌
        return SUCCESS;
    }

    //일반회원 메인 상품검색
//    public String search() throws Exception {
//        memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);
//
//        System.out.println("key:"+searchKeyword); // 키워드를 출력
///*        System.out.println(showboard_category); //카테고리
//*/        
//        System.out.println("c:"+getShowboard_category());
//        if (getShowboard_category() != null && getSearchKeyword() != null) {
//        	showboard_paramClass = new showVO();
//        	showboard_paramClass.setSubject("%" + getSearchKeyword() + "%");
//        	showboard_paramClass.setShowboard_category(new String(getShowboard_category().getBytes("8859_1"), "UTF-8"));
//        	
//			list = sqlMapper.queryForList("show.selectSearchC", showboard_paramClass ); // search 쿼리 수행
//        } else {
//        	list = sqlMapper.queryForList("show.selectSearch", "%" + getSearchKeyword() + "%"); // search 쿼리 수행
//        }
///*
//*/        return SUCCESS;
//    }

    //관리자  상품메뉴(전시,미술,이벤트) 클릭시
    public String adcategory() throws Exception {
        memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);

        showboard_paramClass = new showVO();
        
/*        showboard_paramClass.setShowboard_category(getShowboard_category());
		list = sqlMapper.queryForList("select_category", showboard_paramClass);*/
        
        showboard_paramClass.setShowboard_category(new String(getShowboard_category().getBytes("8859_1"), "UTF-8")); //파라메타에서 카테고리 디코딩해서 게시글 추출
        list = sqlMapper.queryForList("show.select_category", showboard_paramClass);
        
        showboard_category = new String(getShowboard_category().getBytes("8859_1"), "UTF-8"); //파라메타에서 카테고리 디코딩해서 jsp에 넘겨줌
        return SUCCESS;
    }

    // 관리자 메인 상품검색
    public String adsearch() throws Exception {
        memresultClass = admin.MemberLoginCheck.getMember(sqlMapper, memresultClass);

		System.out.print(searchKeyword); // 키워드를 출력

		list = sqlMapper.queryForList("selectSearch", "%" + getSearchKeyword() + "%"); // search 쿼리 수행

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
		showcaselistAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		showcaselistAction.sqlMapper = sqlMapper;
	}

	public List<showVO> getList() {
		return list;
	}

	public void setList(List<showVO> list) {
		this.list = list;
	}

	public showVO getShowboard_paramClass() {
		return showboard_paramClass;
	}

	public void setShowboard_paramClass(showVO showboard_paramClass) {
		this.showboard_paramClass = showboard_paramClass;
	}

	public showVO getShowboard_resultClass() {
		return showboard_resultClass;
	}

	public void setShowboard_resultClass(showVO showboard_resultClass) {
		this.showboard_resultClass = showboard_resultClass;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getShowboard_category() {
		return showboard_category;
	}

	public void setShowboard_category(String showboard_category) {
		this.showboard_category = showboard_category;
	}

}