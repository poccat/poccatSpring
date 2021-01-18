package com.myproject.logic;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.dao.MemberDao;



@Service
public class MemberLogic {
	Logger logger = LogManager.getLogger(MemberLogic.class);
	@Autowired(required=false)
	private MemberDao memDao;
	
	
/////////////////////////////////[[ MemberDao_1 ]]////////////////////////////////	
	public List<Map<String,Object>> member_login(Map<String,Object> pMap) {
		logger.info("member_login 호출 성공");
		logger.info(pMap);
		return memDao.member_login(pMap);
	}
	
	public List<Map<String,Object>> member_id_check(Map<String,Object> pMap) {
		logger.info("member_id_check 호출 성공");
		return memDao.member_login(pMap);
	}
	
	public List<Map<String, Object>> member_info(Map<String,Object> pMap) {
		logger.info("member_info 호출 성공");
		return memDao.member_info(pMap);
	}
	
	
	public int member_join(Map<String,Object> pMap) {
		logger.info("member_join 호출 성공");
		return memDao.member_join(pMap);
	}
	
	public int member_modi(Map<String,Object> pMap) {
		logger.info("member_modi 호출 성공");
		return memDao.member_modi(pMap);
	}
	
	public int member_del(Map<String,Object> pMap) {
		logger.info("member_del 호출 성공");
		return memDao.member_del(pMap);
	}
	
	public List<Map<String, Object>> friend_member_list(Map<String,Object> pMap) {
		logger.info("friend_member_list 호출 성공");
		return memDao.friend_member_list(pMap);
	}
	
	public int friend_member_add(Map<String,Object> pMap) {
		logger.info("friend_member_add 호출 성공");
		return memDao.friend_member_add(pMap);
	}
	
	public int friend_member_del(Map<String,Object> pMap) {
		logger.info("friend_member_del 호출 성공");
		return memDao.friend_member_del(pMap);
	}
/////////////////////////////////[[ MemberDao_1 끝 ]]//////////////////////////////////

/////////////////////////////////[[ MemberDao_2 시작 ]]////////////////////////////////
	public List<Map<String, Object>> group_search(Map<String,Object> pMap) {
		logger.info("group_search 호출 성공");
		return memDao.group_search(pMap);
	}
	
	public int group_create(Map<String,Object> pMap) {
		logger.info("group_create 호출 성공");
		return memDao.group_create(pMap);
	}
	
	public int group_change_title(Map<String,Object> pMap) {
		logger.info("group_change_title 호출 성공");
		return memDao.group_change_title(pMap);
	}
	
	public int group_del(Map<String,Object> pMap) {
		logger.info("group_del 호출 성공");
		return memDao.group_del(pMap);
	}
	
	public List<Map<String, Object>> group_mem_mygroup(Map<String,Object> pMap) {
		logger.info("group_mem_mygroup 호출 성공");
		return memDao.group_mem_mygroup(pMap);
	}
	
	public List<Map<String, Object>> group_mem_list(Map<String,Object> pMap) {
		logger.info("group_mem_list 호출 성공");
		return memDao.group_mem_list(pMap);
	}
	
	public int group_mem_join(Map<String,Object> pMap) {
		logger.info("group_mem_join 호출 성공");
		return memDao.group_mem_join(pMap);
	}
	
	public int group_mem_del(Map<String,Object> pMap) {
		logger.info("group_mem_del 호출 성공");
		return memDao.group_mem_del(pMap);
	}
/////////////////////////////////[[ MemberDao_2 끝 ]]/////////////////////////////////
	
/////////////////////////////////[[ MemberDao_3 시작 ]]////////////////////////////////
	public List<Map<String, Object>> group_board_list(Map<String,Object> pMap) {
		logger.info("group_board_list 호출 성공");
		
		return memDao.group_board_list(pMap);
	}
	
	public List<Map<String, Object>> group_board_detail(Map<String,Object> pMap) {
		logger.info("group_board_detail 호출 성공");
		return memDao.group_board_detail(pMap);
	}
	
	public int group_board_write(Map<String,Object> pMap) {
		logger.info("group_board_write 호출 성공");
		return memDao.group_board_write(pMap);
	}
	
	public int group_board_modi(Map<String,Object> pMap) {
		logger.info("group_board_modi 호출 성공");
		return memDao.group_board_modi(pMap);
	}
	
	public int group_board_del(Map<String,Object> pMap) {
		logger.info("group_board_del 호출 성공");
		return memDao.group_board_del(pMap);
	}
	
	public List<Map<String, Object>> group_board_cmt_list(Map<String,Object> pMap) {
		return memDao.group_board_cmt_list(pMap);
	}
	
	public int group_board_cmt_write(Map<String,Object> pMap) {
		logger.info("group_board_cmt_write 호출 성공");
		return memDao.group_board_cmt_write(pMap);
	}
	
	public int group_board_cmt_modi(Map<String,Object> pMap) {
		logger.info("group_board_cmt_modi 호출 성공");
		return memDao.group_board_cmt_modi(pMap);
	}
	
	public int group_board_cmt_del(Map<String,Object> pMap) {
		logger.info("group_board_cmt_del 호출 성공");
		return memDao.group_board_cmt_del(pMap);
	}
	

/////////////////////////////////[[ MemberDao_3 끝 ]]////////////////////////////////
}
