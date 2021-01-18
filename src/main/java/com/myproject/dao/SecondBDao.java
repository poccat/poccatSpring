package com.myproject.dao;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SecondBDao {
	Logger logger = LogManager.getLogger(SecondBDao.class);
	@Autowired(required=false)
	private SqlSessionTemplate sqlSessionTemplate =null;
////////////////////////////////////////자원봉사 공고 시작 /////////////////////////////////////
	public List<Map<String, Object>> volunteer_noti_list(Map<String, Object> pMap) {
		logger.info("volunteer_noti_list 호출성공");
		return sqlSessionTemplate.selectList(" ",pMap);
	}
	public List<Map<String, Object>> volunteer_noti_detail(Map<String, Object> pMap) {
		logger.info("swDesignExam 호출성공");
		return sqlSessionTemplate.selectList(" ",pMap);
	}
	
	public int volunteer_noti_write(Map<String, Object> pMap) {
		logger.info(" 호출성공");
		return sqlSessionTemplate.insert(" ",pMap);
	}
	
	public int volunteer_noti_modi(Map<String, Object> pMap) {
		logger.info(" 호출성공");
		return sqlSessionTemplate.update(" ",pMap);
	}
	
	public int volunteer_noti_del(Map<String, Object> pMap) {
		logger.info(" 호출성공");
		return sqlSessionTemplate.delete(" ",pMap);
	}
////////////////////////////////////////자원봉사 공고 종료 /////////////////////////////////////

////////////////////////////////////////자원봉사 신청  시작/////////////////////////////////////
	public List<Map<String, Object>> volunteer_apply_check(Map<String, Object> pMap) {
		logger.info("swDesignExam 호출성공");
		return sqlSessionTemplate.selectList(" ",pMap);
	}
	
	public int volunteer_apply_book(Map<String, Object> pMap) {
		logger.info(" 호출성공");
		return sqlSessionTemplate.insert(" ",pMap);
	}
	
	public int volunteer_apply_cancel(Map<String, Object> pMap) {
		logger.info(" 호출성공");
		return sqlSessionTemplate.delete(" ",pMap);
	}
////////////////////////////////////////자원봉사 신청  종료/////////////////////////////////////

////////////////////////////////////////게시판(통합) 시작/////////////////////////////////////
	public List<Map<String, Object>> common_board_list(Map<String, Object> pMap) {
		logger.info("sb Dao common_board_list pMap===>"+pMap);
		return sqlSessionTemplate.selectList("commonB_List",pMap);
	}
	public List<Map<String, Object>> common_board_detail(Map<String, Object> pMap) {
		logger.info("common_board_detail 호출성공");
		return sqlSessionTemplate.selectList("common_board_detail",pMap);
	}
	
	public int common_board_write(Map<String, Object> pMap) {
		logger.info("common_board_write 호출성공 pMap===>" + pMap);
		return sqlSessionTemplate.insert("commonB_insert",pMap);
	}
	
	public int common_board_modi(Map<String, Object> pMap) {
		logger.info(" 호출성공");
		return sqlSessionTemplate.update("commonB_update",pMap);
	}
	
	public int common_board_del(Map<String, Object> pMap) {
		logger.info(" 호출성공");
		return sqlSessionTemplate.delete("commonB_delete",pMap);
	}

////////////////////////////////[[후원 공고 시작]]////////////////////////////////////////////
	public List<Map<String, Object>> donation_noti_list(Map<String, Object> pMap) {
		logger.info("donation_noti_list 호출성공");
		return sqlSessionTemplate.selectList(" ", pMap);
	}

	public List<Map<String, Object>> donation_noti_detail(Map<String, Object> pMap) {
		logger.info("donation_noti_detail 호출성공");
		return sqlSessionTemplate.selectList(" ", pMap);
	}

	public int donation_noti_write(Map<String, Object> pMap) {
		logger.info("donation_noti_write 호출성공");
		return sqlSessionTemplate.insert(" ", pMap);
	}

	public int donation_noti_modi(Map<String, Object> pMap) {
		logger.info("donation_noti_modi 호출성공");
		return sqlSessionTemplate.update(" ", pMap);
	}

	public int donation_noti_del(Map<String, Object> pMap) {
		logger.info("donation_noti_del 호출성공");
		return sqlSessionTemplate.delete(" ", pMap);
	}
////////////////////////////////[[후원 공고 종료]]////////////////////////////////////////////

////////////////////////////////[[후원 이력(신청) 시작]]////////////////////////////////////////////
	public List<Map<String, Object>> donation_check(Map<String, Object> pMap) {
		logger.info("donation_check 호출성공");
		return sqlSessionTemplate.selectList(" ", pMap);
	}

	public int donation_book(Map<String, Object> pMap) {
		logger.info("donation_book 호출성공");
		return sqlSessionTemplate.insert(" ", pMap);
	}

	public int donation_cancel(Map<String, Object> pMap) {
		logger.info("donation_cancel 호출성공");
		return sqlSessionTemplate.delete(" ", pMap);
	}
////////////////////////////////[[후원 이력(신청) 종료]]////////////////////////////////////////////
}
