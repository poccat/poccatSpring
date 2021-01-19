package com.myproject.logic;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.dao.FirstBDao;

@Service
public class FirstBLogic {
	Logger logger = LogManager.getLogger(FirstBLogic.class);
	@Autowired(required=false)
	private FirstBDao fbDao;
	List<Map<String, Object>> fbList = null;
//////////////////////////////////////////[[입양관리 및 후기 시작]]///////////////////////////////////////////	
	public List<Map<String, Object>> adoption_review_list(Map<String,Object> pMap) {
		logger.info("adoption_review_list 호출 성공");
		return fbDao.adoption_review_list(pMap);
	}
	
	public List<Map<String, Object>> adoption_review_detail(Map<String,Object> pMap) {
		logger.info("adoption_review_detail 호출 성공");
		return fbDao.adoption_review_detail(pMap);
	}
	
	public int adoption_review_write(Map<String,Object> pMap) {
		logger.info("adoption_review_write 호출 성공");
		return fbDao.adoption_review_write(pMap);
	}
	
	public int adoption_review_modi(Map<String,Object> pMap) {
		logger.info("adoption_review_modi 호출 성공");
		return fbDao.adoption_review_modi(pMap);
	}
	
	public int adoption_review_del(Map<String,Object> pMap) {
		logger.info("adoption_review_del 호출 성공");
		return fbDao.adoption_review_del(pMap);
	}
//////////////////////////////////////////[[입양관리 및 후기 끝]]///////////////////////////////////////////

//////////////////////////////////////////[[포스팅(신고) 시작]]///////////////////////////////////////////
	public List<Map<String, Object>> poccat(Map<String, Object> pMap) {
		logger.info("poccat 호출 성공");
		return fbDao.poccat(pMap);
	}
	
	public List<Map<String, Object>> posting_list(Map<String,Object> pMap) {
		logger.info("posting_list 호출 성공");
		return fbDao.posting_list(pMap);
	}
	
	public List<Map<String, Object>> posting_detail(Map<String,Object> pMap) {
		logger.info("posting_detail 호출 성공");
		return fbDao.posting_detail(pMap);
	}
	
	public int posting_write(Map<String,Object> pMap) {
		logger.info("posting_write 호출 성공");
		logger.info("form에서 받아온 pMap===>" + pMap);
		return fbDao.posting_write(pMap);
	}
	
	public int insert_or_del_like(Map<String,Object> pMap) {
		logger.info("insert_or_del_like 호출 성공");
		logger.info("form에서 받아온 pMap===>" + pMap);
		return fbDao.insert_or_del_like(pMap);
	}
	
	public int posting_modi(Map<String,Object> pMap) {
		logger.info("posting_modi 호출 성공");
		return fbDao.posting_modi(pMap);
	}
	
	public int posting_del(Map<String,Object> pMap) {
		logger.info("posting_del 호출 성공");
		return fbDao.posting_del(pMap);
	}
/////////////////////////////////////////[[포스팅(신고) 끝]]///////////////////////////////////////////
//////////////////////////////////////////[[댓글 포스팅 시작]]///////////////////////////////////////////

	public List<Map<String, Object>> posting_cmt_list(Map<String,Object> pMap) {
		logger.info("posting_cmt_list 호출 성공");
		return fbDao.posting_cmt_list(pMap);
	}
	
	
	public int posting_cmt_insert(Map<String,Object> pMap) {
		logger.info("posting_write 호출 성공");
		logger.info("form에서 받아온 pMap===>" + pMap);
		return fbDao.posting_write(pMap);
	}
	
	public int posting_cmt_modi(Map<String,Object> pMap) {
		logger.info("posting_modi 호출 성공");
		return fbDao.posting_modi(pMap);
	}
	
	public int posting_cmt_del(Map<String,Object> pMap) {
		logger.info("posting_del 호출 성공");
		return fbDao.posting_del(pMap);
	}
/////////////////////////////////////////[[포스팅(신고) 끝]]///////////////////////////////////////////

	
}
