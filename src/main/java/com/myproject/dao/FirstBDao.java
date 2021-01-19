package com.myproject.dao;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FirstBDao {
	Logger logger = LogManager.getLogger(FirstBDao.class);
	@Autowired(required=false)
	private SqlSessionTemplate sqlSessionTemplate;
	int result = 0;
	public List<Map<String, Object>> poccat(Map<String, Object> pMap) {
	      logger.info("poccat 호출성공");
	         if(pMap.containsKey("mem_no")&&pMap.containsKey("all")==false) {
	            logger.info("로그인시 조회호출");
	            logger.info(pMap.get("mem_no"));
	            return sqlSessionTemplate.selectList("posting_list_login",pMap);
	            //로그인 했을시 pMap안에 유저정보 들어있음.
	         }else {
	        	
	            logger.info("비로그인시 조회호출");
	            return sqlSessionTemplate.selectList("posting_list_logout");//비로그인시.
	         }
	   }
	   
	
	public List<Map<String, Object>> posting_list(Map<String, Object> pMap) {
		logger.info("posting_list 호출성공"+pMap);
		return  sqlSessionTemplate.selectList("posting_list",pMap);
	}
	
	public List<Map<String, Object>> posting_detail(Map<String, Object> pMap) {
		logger.info("posting_detail 호출성공");
		return sqlSessionTemplate.selectList(" ",pMap);
	}
	
	public int posting_write(Map<String, Object> pMap) {
		logger.info("posting_write 호출성공");
		return sqlSessionTemplate.insert("posting_insert",pMap);
	}
	
	public int insert_or_del_like(Map<String, Object> pMap) {
		logger.info("insert_or_del_like 호출성공"+pMap);
			if(pMap.get("chk").equals("0")) {
				logger.info("좋아요취소");
				return sqlSessionTemplate.delete("del_post_like",pMap);
			}
			else{
				logger.info("좋아요");
				return sqlSessionTemplate.insert("ins_post_like",pMap);
			}
	}
	
	public int posting_modi(Map<String, Object> pMap) {
		logger.info("posting_modi 호출성공");
		return sqlSessionTemplate.update(" ",pMap);
	}
	
	public int posting_del(Map<String, Object> pMap) {
		logger.info("posting_del 호출성공");
		return sqlSessionTemplate.delete(" ",pMap);
	}
	
	public List<Map<String, Object>> posting_cmt_list(Map<String, Object> pMap) {
		logger.info("posting_cmt_list 호출성공");
		return sqlSessionTemplate.selectList("posting_cmt_list",pMap);
	}
//////////////////////////////////////////[[입양관리 및 후기 시작]]///////////////////////////////////////////
	public List<Map<String, Object>> adoption_review_list(Map<String, Object> pMap) {
		logger.info("adoption_review_list 호출성공");
		return sqlSessionTemplate.selectList(" ",pMap);
	}
	
	public List<Map<String, Object>> adoption_review_detail(Map<String, Object> pMap) {
		logger.info("adoption_review_detail 호출성공");
		return sqlSessionTemplate.selectList(" ",pMap);
	}
	
	public int adoption_review_write(Map<String, Object> pMap) {
		logger.info("adoption_review_write 호출성공");
		return sqlSessionTemplate.insert(" ",pMap);
	}
	
	public int adoption_review_modi(Map<String, Object> pMap) {
		logger.info(" 호출성공");
		return sqlSessionTemplate.update(" ",pMap);
	}
	
	public int adoption_review_del(Map<String, Object> pMap) {
		logger.info(" 호출성공");
		return sqlSessionTemplate.delete(" ",pMap);
	}
//////////////////////////////////////////[[입양관리 및 후기 종료]]///////////////////////////////////////////
	
	
//////////////////////////////////////////[[댓글(통합) 시작]]///////////////////////////////////////////
	public List<Map<String, Object>> fbSelect1(Map<String, Object> pMap) {
		logger.info("swDesignExam 호출성공");
		return sqlSessionTemplate.selectList(" ",pMap);
	}
	
	public int fbInsert(Map<String, Object> pMap) {
		logger.info(" 호출성공");
		return sqlSessionTemplate.insert(" ",pMap);
	}
	
	public int fbUpdate(Map<String, Object> pMap) {
		logger.info(" 호출성공");
		return sqlSessionTemplate.update(" ",pMap);
	}
	
	public int fbDelete(Map<String, Object> pMap) {
		logger.info(" 호출성공");
		return sqlSessionTemplate.delete(" ",pMap);
	}
//////////////////////////////////////////[[]]///////////////////////////////////////////

}
