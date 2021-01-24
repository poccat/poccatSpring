package com.myproject.pocat;

import java.util.List;
import java.util.Map;

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

@Controller
@RequestMapping("/cat/*")
  
public class CatController{
	Logger logger = LogManager.getLogger(CatController.class);
	String requestName = null;
	String saveDir = null;
	int result = 0;
	List<Map<String,Object>> catList = null;
	List<Map<String,Object>> fbList = null;
	List<Map<String,Object>> followList = null;
	@Autowired(required=false)
	CatLogic catLogic;
	@Autowired(required=false)
	FirstBLogic fbLogic = null;
	
	
	@RequestMapping("/cat_search_ajax.foc")
	public @ResponseBody List<Map<String,Object>> cat_search_ajax( @RequestParam Map<String,Object> pMap) {
		logger.info("cat_search_ajax 호출 성공"+pMap);
		return catLogic.cat_search(pMap);
	}
	@RequestMapping("/cat_all.foc")
	public @ResponseBody List<Map<String,Object>> cat_all() {
		logger.info("cat_all 호출 성공");
		return catLogic.cat_all();
	}
	
	@RequestMapping("/cat_search.foc")
	public String cat_search(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("cat_search 호출 성공"+pMap);
		catList = catLogic.cat_search(pMap);
		followList = catLogic.member_cat_follower_list(pMap);//고양이 프로필에 보여줄 고양이 포스팅 목록
		pMap.put("mem_no", "");
		pMap.put("gubun", "c");
		fbList = fbLogic.posting_list(pMap);//고양이 프로필에 보여줄 고양이 포스팅 목록
		logger.info(fbList.size());
		mod.addAttribute("fbList",fbList);
		mod.addAttribute("folList",followList);
		mod.addAttribute("rList", catList);
		logger.info(catList);
		return "sns/profile";// "sns/profile";
	}
	@RequestMapping("/cat_regist.foc")
	public String cat_regist(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("cat_regist 호출 성공"+pMap);
		return "redirect:/okOrNot.jsp?result="+result;
	}
	@RequestMapping("/cat_modi.foc")
	public String cat_modi(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("cat_modi 호출 성공"+pMap);
		result = catLogic.cat_modi(pMap);
		return "redirect:/okOrNot.jsp?result="+result;
	}
	@RequestMapping("/cat_del.foc")
	public String cat_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("cat_del 호출 성공"+pMap);
		result = catLogic.cat_del(pMap);
		return "redirect:/okOrNot.jsp?result="+result;
	}
	@RequestMapping("/cat_map.foc")
	public @ResponseBody List<Map<String,Object>> cat_map(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("cat_map 호출 성공"+pMap);
		catList = catLogic.cat_map(pMap);
		return catList; 
	}
////////////////////[[고양이정보 끝]]///////////////////
////////////////////[[고양이 팔로우 시작]]///////////////////
	@RequestMapping("/member_cat_follower_list.foc")
	public @ResponseBody List<Map<String,Object>> member_cat_follower_list(@RequestParam Map<String,Object> pMap) {
		logger.info("member_cat_follower_list 호출 성공"+pMap);
		return catLogic.member_cat_follower_list(pMap);
	}
	@RequestMapping("/member_cat_follow_list.foc")
	public @ResponseBody List<Map<String,Object>> member_cat_follow_list(@RequestParam Map<String,Object> pMap) {
		logger.info("member_cat_follow_list 호출 성공"+pMap);
		return catLogic.member_cat_follow_list(pMap);
	}
	@RequestMapping("/member_cat_follow_regist.foc")
	public @ResponseBody List<Map<String,Object>> member_cat_follow_regist(@RequestParam Map<String,Object> pMap) {
		logger.info("member_cat_follow_regist 호출 성공"+pMap);
			if(catLogic.member_cat_follow_regist(pMap)==1) {
				catList = catLogic.member_cat_follower_list(pMap);
			}
		return catList;
	}
	@RequestMapping("/member_cat_follow_cancel.foc")
	public String member_cat_follow_cancel(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("member_cat_follow_cancel 호출 성공"+pMap);
		result = catLogic.member_cat_follow_regist(pMap);
		return "redirect:/okOrNot.jsp?result="+result;
	}
////////////////////[[고양이 팔로우 끝]]///////////////////
////////////////////[[급식소 정보 시작]]///////////////////
	@RequestMapping("/mealcenter_search.foc")
	public String mealcenter_search(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("mealcenter_search 호출 성공"+pMap);
		catList = catLogic.mealcenter_search(pMap);
		mod.addAttribute("rList", catList);
		return "sns/mealcenter";
	} 
	@RequestMapping("/mealcenter_regist.foc")
	public String mealcenter_regist(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info(" 호출 성공"+pMap);
		result = catLogic.mealcenter_regist(pMap);
		return "redirect:/okOrNot.jsp?result="+result;
	}
	@RequestMapping("/mealcenter_update.foc")
	public String mealcenter_update(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("mealcenter_update 호출 성공"+pMap);
		result = catLogic.mealcenter_update(pMap);
		return "redirect:/okOrNot.jsp?result="+result;
	}
	@RequestMapping("/mealcenter_del.foc")
	public String mealcenter_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info(" 호출 성공"+pMap);
		result = catLogic.mealcenter_del(pMap);
		return "redirect:/okOrNot.jsp?result="+result;
	}
////////////////////[[급식소 정보 끝]]///////////////////
////////////////////[[고양이-급식소 시작]]///////////////////
	@RequestMapping("/cat_mealcenter_list.foc")
	public @ResponseBody List<Map<String,Object>> cat_mealcenter_list(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("cat_mealcenter_list 호출 성공"+pMap);
		return catLogic.cat_mealcenter_list(pMap);
	}
	@RequestMapping("/cat_mealcenter_regist.foc")
	public String cat_mealcenter_regist(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("cat_mealcenter_regist 호출 성공"+pMap);
		result = catLogic.cat_mealcenter_regist(pMap);
		return "redirect:/okOrNot.jsp?result="+result;
	}
	@RequestMapping("/cat_mealcenter_del.foc")
	public String cat_mealcenter_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("cat_mealcenter_del 호출 성공"+pMap);
		result = catLogic.cat_mealcenter_del(pMap);
		return "redirect:/okOrNot.jsp?result="+result;
	}

}
