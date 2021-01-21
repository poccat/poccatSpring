package com.myproject.pocat;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myproject.logic.CatLogic;
import com.myproject.logic.FirstBLogic;
import com.myproject.logic.MemberLogic;
import com.google.firebase.auth.UserRecord;
import com.myproject.firebase.FirebaseDB;
import com.myproject.firebase.FirebaseUser;



@Controller
@RequestMapping("/member/*")
public class MemberController  {
	Logger logger = LogManager.getLogger(MemberController.class);
	
	Boolean isSession = false;
	int result = 0;
	List<Map<String,Object>> memList = null;
	List<Map<String,Object>> fbList = null;
	List<Map<String,Object>> memList2 = null;
	List<Map<String,Object>> catList = null;
	
	@Autowired(required=false)
	MemberLogic memLogic;
	@Autowired(required=false)
	CatLogic catLogic;
	@Autowired(required=false)
	FirstBLogic fbLogic;
	@Autowired
	FirebaseUser firebaseUser;
	@Autowired
	FirebaseDB db;
	
	UserRecord userRecord;
	
	@RequestMapping("/member_login.foc")
	public @ResponseBody List<Map<String,Object>> member_login(@RequestParam Map<String,Object> pMap
			,HttpServletRequest req) {
		logger.info("member_login 호출 성공"+pMap);
		memList = memLogic.member_login(pMap);
		logger.info(pMap);
		pMap.clear();
		pMap=memList.get(0);
		String token ="";
		token =firebaseUser.createToken(pMap.get("mem_uid").toString());
		pMap.put("token",token);
		HttpSession session = req.getSession();
		session.setAttribute("userMap", pMap);
		logger.info("MemberController 세션 setAttribute===>"+pMap);
		isSession = true;
		//세션에 값을 저장하므로 요청이 유지 되지 않아도 된다.
		return memList;
	}
	@RequestMapping("/member_id_check.foc")
	public String member_id_check(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("member_id_check 호출 성공"+pMap);
		memList = memLogic.member_id_check(pMap);
		mod.addAttribute("rList", fbList);
		return "forward:/test.jsp";
	}
	@RequestMapping("/member_logout.foc")
	public String member_logout(Model mod, @RequestParam Map<String,Object> pMap) {
		return "sns/member/member_logout";
	}
	
	@RequestMapping("/member_mypage.foc")
	public String member_mypage(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("member_mypage 호출 성공"+pMap);
		memList = memLogic.member_info(pMap);
		fbList = fbLogic.posting_list(pMap);
		memList2 = memLogic.friend_member_list(pMap);
		catList = catLogic.member_cat_follow_list(pMap);
		mod.addAttribute("rList", memList);
		mod.addAttribute("fbList", fbList);
		mod.addAttribute("frdList", memList2);
		mod.addAttribute("folList", catList);
		return "sns/myPage";
	}
	
	@RequestMapping("/member_join.foc")
	public String member_join(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info(pMap);
		logger.info(firebaseUser+"firebaseUser");
		logger.info("member_join 호출 성공"+pMap);
        //파이어베이스 회원가입
		userRecord =firebaseUser.signUPFirebase(pMap);
		logger.info(userRecord.getUid());
		//파이어베이스 회원가입 성공하면
		if(userRecord.getUid() != null && userRecord.getUid().length() >0) {
		//파이어베이스 성공한 회원의 uid를 가져와서
		pMap.put("uid",userRecord.getUid());
		//오라클에 회원가입 하면서 파이어베이스 uid오라클에 인서트
		result = memLogic.member_join(pMap);
		logger.info("결과 : "+result);
		}
		if(result==1) {
			//오라클 회원가입성공하면 파이어베이스 DB에 회원정보 넣기
			//끝 이제 로그
			db.signUpDB(userRecord);
		}
		mod.addAttribute("result", result);
		return "test";
	}
	@RequestMapping("/member_modi.foc")
	public String member_modi(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("member_modi 호출 성공"+pMap);
		result = memLogic.member_modi(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/member_del.foc")
	public String member_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("member_del 호출 성공"+pMap);
		result = memLogic.member_del(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/friend_member_list.foc")
	public String friend_member_list(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("friend_member_list 호출 성공"+pMap);
		memList = memLogic.friend_member_list(pMap);
		mod.addAttribute("rList", fbList);
		return "forward:/test.jsp";
	}
	@RequestMapping("/friend_member_add.foc")
	public String friend_member_add(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("friend_member_add 호출 성공"+pMap);
		result = memLogic.friend_member_add(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/friend_member_del.foc")
	public String friend_member_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("friend_member_del 호출 성공"+pMap);
		result = memLogic.friend_member_del(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_search.foc")
	public String group_search(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_search 호출 성공"+pMap);
		memList = memLogic.group_search(pMap);
		mod.addAttribute("rList", fbList);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_create.foc")
	public String group_create(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_create 호출 성공"+pMap);
		result = memLogic.group_create(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_change_title.foc")
	public String group_change_title(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_change_title 호출 성공"+pMap);
		result = memLogic.group_change_title(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_del.foc")
	public String group_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_del 호출 성공"+pMap);
		result = memLogic.group_del(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_mem_mygroup.foc")
	public @ResponseBody List<Map<String,Object>> group_mem_mygroup(@RequestParam Map<String,Object> pMap) {
		logger.info("group_mem_mygroup 호출 성공"+pMap);
		return memLogic.group_mem_mygroup(pMap);
	}
	@RequestMapping("/group_mem_list.foc")
	public String group_mem_list(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_mem_list 호출 성공"+pMap);
		memList = memLogic.group_mem_list(pMap);
		mod.addAttribute("rList", memList);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_mem_join.foc")
	public String group_mem_join(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_mem_join 호출 성공"+pMap);
		result = memLogic.group_mem_join(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_mem_del.foc")
	public String group_mem_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_mem_del 호출 성공"+pMap);
		result = memLogic.group_mem_del(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_board_list.foc")
	public @ResponseBody List<Map<String,Object>> group_board_list(@RequestParam Map<String,Object> pMap) {
		logger.info("group_board_list 호출 성공"+pMap);
		return memLogic.group_board_list(pMap);
	}
	@RequestMapping("/group_board_detail.foc")
	public String group_board_detail(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_board_detail 호출 성공"+pMap);
		memList = memLogic.group_board_detail(pMap);
		mod.addAttribute("rList", fbList);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_board_write.foc")
	public String group_board_write(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_board_write 호출 성공"+pMap);
		result = memLogic.group_board_write(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_board_modi.foc")
	public String group_board_modi(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_board_modi 호출 성공"+pMap);
		result = memLogic.group_board_modi(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_board_del.foc")
	public String group_board_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_board_del 호출 성공"+pMap);
		result = memLogic.group_board_del(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_board_cmt_list.foc")
	public String group_board_cmt_list(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_board_cmt_list 호출 성공"+pMap);
		memList = memLogic.group_board_cmt_list(pMap);
		mod.addAttribute("rList", fbList);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_board_cmt_write.foc")
	public String group_board_cmt_write(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_board_cmt_write 호출 성공"+pMap);
		result = memLogic.group_board_cmt_write(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_board_cmt_modi.foc")
	public String group_board_cmt_modi(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_board_cmt_modi 호출 성공"+pMap);
		result = memLogic.group_board_cmt_modi(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/group_board_cmt_del.foc")
	public String group_board_cmt_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("group_board_cmt_del 호출 성공"+pMap);
		result = memLogic.group_board_cmt_del(pMap);
		return "forward:/test.jsp";
	}
	
	
	
}
