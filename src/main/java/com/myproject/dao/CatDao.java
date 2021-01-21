package com.myproject.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

//스프링은 커밋알아서 관리해줌.

@Repository

public class CatDao {
	Logger logger = LogManager.getLogger(CatDao.class);
	@Autowired(required=false)
	private SqlSessionTemplate sqlSessionTemplate;
	int result = 0;
	List<Map<String,Object>> catList = null;
//////////////////////////[[고양이 시작]]////////////////////////////////////	
	public List<Map<String, Object>> cat_search(Map<String, Object> pMap) {
		logger.info("cat_search 호출성공"+pMap);
			if(pMap.get("mem_no").equals("null")) {
				pMap.put("mem_no", 99999);
			}
		return sqlSessionTemplate.selectList("cat_search",pMap);
	}
	
	public int cat_regist(Map<String, Object> pMap) {
		logger.info("cat_regist 호출성공");
		return  sqlSessionTemplate.insert(" ",pMap);
	}
	
	public int cat_modi(Map<String, Object> pMap) {
		logger.info("cat_modi 호출성공");
		return sqlSessionTemplate.update(" ",pMap);
	}
	
	public int cat_del(Map<String, Object> pMap) {
		logger.info("cat_del 호출성공");
		return sqlSessionTemplate.delete(" ",pMap);
	}
///////////////////////////////[[고양이 끝]]///////////////////////////
	
//////////////////////////[[고양이 팔로우 시작]]////////////////////////////////////	
	public List<Map<String, Object>> member_cat_follower_list(Map<String, Object> pMap) {
		logger.info("member_cat_follow_list 호출성공");
		return sqlSessionTemplate.selectList("member_cat_follower_list",pMap);
	}
	
	public List<Map<String, Object>> member_cat_follow_list(Map<String, Object> pMap) {
		logger.info("member_cat_follow_list 호출성공");
		return sqlSessionTemplate.selectList("member_cat_follow_list",pMap);
	}
	
	public int member_cat_follow_regist(Map<String, Object> pMap) {
		logger.info("member_cat_follow_regist 호출성공");
		return sqlSessionTemplate.insert(" ",pMap);
	}
	
	public int member_cat_follow_cancel(Map<String, Object> pMap) {
		logger.info("member_cat_follow_cancel 호출성공");
		return sqlSessionTemplate.delete(" ",pMap);
	}
///////////////////////////////[[고양이 팔로우 끝]]///////////////////////////
///////////////////////////////[[급식소 시작]]///////////////////////////
	public List<Map<String, Object>> mealcenter_search(Map<String, Object> pMap) {
		logger.info("mealcenter_search 호출성공");
		return sqlSessionTemplate.selectList(" ", pMap);
	}

	public int mealcenter_regist(Map<String, Object> pMap) {
		logger.info("mealcenter_regist 호출성공");
		return sqlSessionTemplate.insert(" ", pMap);
	}

	public int mealcenter_update(Map<String, Object> pMap) {
		logger.info("mealcenter_update 호출성공");
		return sqlSessionTemplate.update(" ", pMap);
	}

	public int mealcenter_del(Map<String, Object> pMap) {
		logger.info("mealcenter_del 호출성공");
		return sqlSessionTemplate.delete(" ", pMap);
	}
///////////////////////////////[[급식소 끝]]///////////////////////////

//////////////////////////[[고양이-급식소 시작]]////////////////////////////////////	
	public List<Map<String, Object>> cat_mealcenter_list(Map<String, Object> pMap) {
		logger.info("cat_mealcenter_list 호출성공");
		return sqlSessionTemplate.selectList(" ", pMap);
	}

	public int cat_mealcenter_regist(Map<String, Object> pMap) {
		logger.info("cat_mealcenter_regist 호출성공");
		return sqlSessionTemplate.insert(" ", pMap);
	}

	public int cat_mealcenter_del(Map<String, Object> pMap) {
		logger.info("cat_mealcenter_del 호출성공");
		return sqlSessionTemplate.delete(" ", pMap);
	}
//////////////////////////////[[고양이-급식소 끝]]////////////////////////		
}
