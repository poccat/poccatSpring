package com.myproject.logic;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.dao.CatDao;

@Service

public class CatLogic {
	Logger logger = LogManager.getLogger(CatLogic.class);
	@Autowired(required=false)
	private CatDao catDao;
	

	public List<Map<String, Object>> cat_search(Map<String,Object> pMap) {
		logger.info("cat_search 호출 성공");
		return catDao.cat_search(pMap);
	}
	public List<Map<String, Object>> cat_all() {
		logger.info("cat_all 호출 성공");
		return catDao.cat_all();
	}
	
	public int cat_regist(Map<String,Object> pMap) {
		logger.info("cat_regist 호출 성공");
		return catDao.cat_regist(pMap);
	}
	
	public int cat_modi(Map<String,Object> pMap) {
		logger.info("cat_modi 호출 성공");
		return catDao.cat_modi(pMap);
	}
	
	public int cat_del(Map<String,Object> pMap) {
		logger.info("cat_del 호출 성공");
		return catDao.cat_del(pMap);
	}
	
	public List<Map<String, Object>> cat_map(Map<String, Object> pMap) {
		logger.info("cat_map 호출 성공");
		return catDao.cat_map(pMap);
	}
	
	public List<Map<String, Object>> member_cat_follower_list(Map<String,Object> pMap) {
		logger.info("member_cat_follower_list 호출 성공");
		return catDao.member_cat_follower_list(pMap);
	}
	public List<Map<String, Object>> member_cat_follow_list(Map<String,Object> pMap) {
		logger.info("member_cat_follow_list 호출 성공");
		return catDao.member_cat_follow_list(pMap);
	}
	
	public int member_cat_follow_regist(Map<String,Object> pMap) {
		logger.info("member_cat_follow_regist 호출 성공");
		return catDao.member_cat_follow_regist(pMap);
	}
	
	public int member_cat_follow_cancel(Map<String,Object> pMap) {
		logger.info("member_cat_follow_cancel 호출 성공");
		return catDao.member_cat_follow_cancel(pMap);
	}
	
	public List<Map<String, Object>> mealcenter_search(Map<String,Object> pMap) {
		logger.info("mealcenter_search 호출 성공");
		return catDao.mealcenter_search(pMap);
	}
	
	public int mealcenter_regist(Map<String,Object> pMap) {
		logger.info("mealcenter_regist 호출 성공");
		return catDao.mealcenter_regist(pMap);
	}
	
	public int mealcenter_update(Map<String,Object> pMap) {
		logger.info("mealcenter_update 호출 성공");
		return catDao.mealcenter_update(pMap);
	}
	
	public int mealcenter_del(Map<String,Object> pMap) {
		logger.info("mealcenter_del 호출 성공");
		return catDao.mealcenter_del(pMap);
	}
	public List<Map<String, Object>> cat_mealcenter_list(Map<String,Object> pMap) {
		logger.info("cat_mealcenter_list 호출 성공");
		return catDao.cat_mealcenter_list(pMap);
	}
	
	public int cat_mealcenter_regist(Map<String,Object> pMap) {
		logger.info("cat_mealcenter_regist 호출 성공");
		return catDao.cat_mealcenter_regist(pMap);
	}
	
	public int cat_mealcenter_del(Map<String,Object> pMap) {
		logger.info("cat_mealcenter_del 호출 성공");
		return catDao.cat_mealcenter_del(pMap);
	}
}
