package com.myproject.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDao {
	Logger logger = LogManager.getLogger(MemberDao.class);
	@Autowired(required=false)
	private SqlSessionTemplate sqlSessionTemplate;
	int result = 0;
	List<Map<String,Object>> memList= null;
//////////////////////////////[[회원정보 시작]]//////////////////////////////
	public List<Map<String,Object>> member_login(Map<String, Object> pMap) {
		logger.info("member_login 호출성공");
		memList = new ArrayList<>();
		Map<String,Object> rLoginMap = new HashMap<>();
			sqlSessionTemplate.selectOne("proc_Login",pMap);
			logger.info("로그인 성공? 이름 : "+pMap.get("msg"));
			rLoginMap.put("mem_name",pMap.get("msg"));
			rLoginMap.put("mem_id",pMap.get("r_memID"));
			rLoginMap.put("mem_no",pMap.get("r_memNum"));
			memList.add(rLoginMap);
		return memList;
	}
		
	public List<Map<String, Object>> member_info(Map<String, Object> pMap) {
		logger.info("member_info 호출성공");
		return sqlSessionTemplate.selectList("member_info",pMap);
	}
	
	public List<Map<String, Object>> member_id_check(Map<String, Object> pMap) {
		logger.info("member_id_check 호출성공");
		return sqlSessionTemplate.selectList(" ",pMap);
	}
	
	public int member_join(Map<String, Object> pMap) {
		logger.info("member_join 호출성공");
		return sqlSessionTemplate.insert("member_join",pMap);
	}
	
	public int member_modi(Map<String, Object> pMap) {
		logger.info("member_modi 호출성공");
		return sqlSessionTemplate.update(" ",pMap);
	}
	 
	public int member_del(Map<String, Object> pMap) {
		logger.info("member_del 호출성공");
		return sqlSessionTemplate.delete(" ",pMap);
	}
//////////////////////////////[[회원정보 끝]]//////////////////////////////
	
//////////////////////////////[[친구-회원 시작]]//////////////////////////////
	public List<Map<String, Object>> friend_member_list(Map<String, Object> pMap) {
		logger.info("friend_member_list 호출성공");
		return sqlSessionTemplate.selectList("friend_member_list",pMap);
	}
	
	public int friend_member_add(Map<String, Object> pMap) {
		logger.info("friend_member_add 호출성공");
		return sqlSessionTemplate.insert(" ",pMap);
	}
	
	public int friend_member_del(Map<String, Object> pMap) {
		logger.info("friend_member_del 호출성공");
		return sqlSessionTemplate.delete(" ",pMap);
	}
//////////////////////////////[[친구-회원 끝]]//////////////////////////////
	public List<Map<String, Object>> group_search(Map<String, Object> pMap) {
		logger.info("group_search 호출성공");
		return sqlSessionTemplate.selectList(" ",pMap);
	}
	
	public int group_create(Map<String, Object> pMap) {
		logger.info("group_create 호출성공");
		return sqlSessionTemplate.insert(" ",pMap);
	}
	
	public int group_change_title(Map<String, Object> pMap) {
		logger.info("group_change_title 호출성공");
		return sqlSessionTemplate.update(" ",pMap);
	}
	
	public int group_del(Map<String, Object> pMap) {
		logger.info("group_del 호출성공");
		return sqlSessionTemplate.delete(" ",pMap);
	}
////////////////////////////////[[그룹 끝]]/////////////////////////////////

////////////////////////////////[[그룹 생성 및 가입 시작]]/////////////////////////
	public List<Map<String, Object>> group_mem_mygroup(Map<String, Object> pMap) {
		logger.info("group_mem_mygroup 호출성공"+pMap);
		int mem_no = sqlSessionTemplate.selectOne("get_mem_no",pMap);
		pMap.put("mem_no", mem_no); 
		return sqlSessionTemplate.selectList("group_mem_mygroup",pMap);
	}
	
	public List<Map<String, Object>> group_mem_list(Map<String, Object> pMap) {
		logger.info("group_mem_list 호출성공");
		return sqlSessionTemplate.selectList(" ",pMap);
	}
	
	public int group_mem_join(Map<String, Object> pMap) {
		logger.info("group_mem_join 호출성공");
		return sqlSessionTemplate.insert(" ",pMap);
	}
	
	
	public int group_mem_del(Map<String, Object> pMap) {
		logger.info("group_mem_del 호출성공");
		return sqlSessionTemplate.delete(" ",pMap);
	}
////////////////////////////////[[그룹 생성 및 가입 끝]]/////////////////////////
////////////////////////////////[[그룹게시판 시작]]/////////////////////////////////
	public List<Map<String, Object>> group_board_list(Map<String, Object> pMap) {
		logger.info("group_board_list 호출성공" + pMap);
		return sqlSessionTemplate.selectList("group_board_list", pMap);
	}

	public List<Map<String, Object>> group_board_detail(Map<String, Object> pMap) {
		logger.info("group_board_detail 호출성공");
		return sqlSessionTemplate.selectList(" ", pMap);

	}

	public int group_board_write(Map<String, Object> pMap) {
		logger.info("group_board_write 호출성공");
		return sqlSessionTemplate.insert(" ", pMap);
	}

	public int group_board_modi(Map<String, Object> pMap) {
		logger.info("group_board_modi 호출성공");
		return sqlSessionTemplate.update(" ", pMap);
	}

	public int group_board_del(Map<String, Object> pMap) {
		logger.info("group_board_del 호출성공");
		return sqlSessionTemplate.delete(" ", pMap);
	}
////////////////////////////////[[그룹게시판 끝]]/////////////////////////////////

////////////////////////////////[[댓글(그룹게시판) 시작]]/////////////////////////

	public List<Map<String, Object>> group_board_cmt_list(Map<String, Object> pMap) {
		logger.info("group_board_cmt_list 호출성공");
		return sqlSessionTemplate.selectList(" ", pMap);
	}

	public int group_board_cmt_write(Map<String, Object> pMap) {
		logger.info("group_board_cmt_write 호출성공");
		return sqlSessionTemplate.insert(" ", pMap);
	}

	public int group_board_cmt_modi(Map<String, Object> pMap) {
		logger.info("group_board_cmt_modi 호출성공");
		return sqlSessionTemplate.update(" ", pMap);
	}

	public int group_board_cmt_del(Map<String, Object> pMap) {
		logger.info("group_board_cmt_del 호출성공");
		return sqlSessionTemplate.delete(" ", pMap);
	}
////////////////////////////////[[댓글(그룹게시판) 끝]]/////////////////////////
}
