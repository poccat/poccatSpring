package com.myproject.logic;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.dao.SecondBDao;



@Service
public class SecondBLogic {
	Logger logger = LogManager.getLogger(SecondBLogic.class);
	@Autowired(required=false)
	private SecondBDao sbDao;
////////////////////////////////////////자원봉사 공고 시작 /////////////////////////////////////
	public List<Map<String, Object>> volunteer_noti_list(Map<String,Object> pMap) {
		logger.info("volunteer_noti_list 호출 성공");
		return sbDao.volunteer_noti_list(pMap);
	}
	
	public List<Map<String, Object>> volunteer_noti_detail(Map<String,Object> pMap) {
		logger.info("volunteer_noti_detail 호출 성공");
		return sbDao.volunteer_noti_detail(pMap);
	}
	
	public int volunteer_noti_write(Map<String,Object> pMap) {
		logger.info("volunteer_noti_write 호출 성공");
		return sbDao.volunteer_noti_write(pMap);
	}
	
	public int volunteer_noti_modi(Map<String,Object> pMap) {
		logger.info("volunteer_noti_modi 호출 성공");
		return sbDao.volunteer_noti_modi(pMap);
	}
	
	public int volunteer_noti_del(Map<String,Object> pMap) {
		logger.info("volunteer_noti_del 호출 성공");
		return sbDao.volunteer_noti_del(pMap);
	}
////////////////////////////////////////자원봉사 공고 종료 /////////////////////////////////////

////////////////////////////////////////자원봉사 신청  시작/////////////////////////////////////	
	public List<Map<String, Object>> volunteer_apply_check(Map<String,Object> pMap) {
		logger.info("volunteer_apply_check 호출 성공");
		return sbDao.volunteer_apply_check(pMap);
	}
	
	public int volunteer_apply_book(Map<String,Object> pMap) {
		logger.info("volunteer_apply_book 호출 성공");
		return sbDao.volunteer_apply_book(pMap);
	}
	public int volunteer_apply_cancel(Map<String,Object> pMap) {
		logger.info("volunteer_apply_cancel 호출 성공");
		return sbDao.volunteer_apply_cancel(pMap);
	}
////////////////////////////////////////자원봉사 신청  종료/////////////////////////////////////

////////////////////////////////////////게시판(통합) 시작/////////////////////////////////////
	public List<Map<String, Object>> common_board_list(Map<String,Object> pMap) {
		logger.info("common_board_list 호출 성공");
		logger.info("sb Logic pMap===>"+pMap);
		return sbDao.common_board_list(pMap);
	}
	
	public List<Map<String, Object>> common_board_detail(Map<String,Object> pMap) {
		logger.info("common_board_detail 호출 성공");
		return sbDao.common_board_detail(pMap);
	}
	
	public int common_board_write(Map<String,Object> pMap) {
		logger.info("common_board_write 호출 성공");
		return sbDao.common_board_write(pMap);
	}
	
	public int common_board_modi(Map<String,Object> pMap) {
		logger.info("common_board_modi 호출 성공");
		return sbDao.common_board_modi(pMap);
	}
	
	public int common_board_del(Map<String,Object> pMap) {
		logger.info("common_board_del 호출 성공");
		return sbDao.common_board_del(pMap); 
	} 
////////////////////////////////////////게시판(통합) 종료/////////////////////////////////////

////////////////////////////////[[후원 공고 시작]]////////////////////////////////////////////
	public List<Map<String, Object>> donation_noti_list(Map<String,Object> pMap) {
		logger.info("donation_noti_list 호출 성공");
		return sbDao.donation_noti_list(pMap);
	}
	
	public List<Map<String, Object>> donation_noti_detail(Map<String,Object> pMap) {
		logger.info("donation_noti_detail 호출 성공");
		return sbDao.donation_noti_detail(pMap);
	}
	
	public int donation_noti_write(Map<String,Object> pMap) {
		logger.info("donation_noti_write 호출 성공");
		return sbDao.donation_noti_write(pMap);
	}
	
	public int donation_noti_modi(Map<String,Object> pMap) {
		logger.info("donation_noti_modi 호출 성공");
		return sbDao.donation_noti_modi(pMap);
	}
	
	public int donation_noti_del(Map<String,Object> pMap) {
		logger.info("donation_noti_del 호출 성공");
		return sbDao.donation_noti_del(pMap);
	}
	public List<Map<String, Object>> donation_getTotal(Map<String,Object> pMap) {
		logger.info("donation_getTotal 호출 성공");
		return sbDao.donation_getTotal(pMap);
	}

////////////////////////////////////////후원 공고 종료 /////////////////////////////////////

////////////////////////////////////////후원 이력(신청) 시작/////////////////////////////////////	
	public List<Map<String, Object>> donation_check(Map<String,Object> pMap) {
		logger.info("donation_check 호출 성공");
		return sbDao.donation_check(pMap);
	}
	
	public int donation_book(Map<String,Object> pMap) {
		logger.info("donation_book 호출 성공");
		return sbDao.donation_book(pMap);
	}
	public int donation_cancel(Map<String,Object> pMap) {
		logger.info("donation_cancel 호출 성공");
		return sbDao.donation_cancel(pMap);
	}
////////////////////////////////////////후원 이력(신청) 종료/////////////////////////////////////
}
