package com.myproject.pocat;

import java.util.HashMap;
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

import com.myproject.logic.FirstBLogic;


@Controller
@RequestMapping("/firstB/*")

public class FirstBController {
	Logger logger = LogManager.getLogger(FirstBController.class);
	HttpSession session = null;
	int result = 0;
	List<Map<String,Object>> fbList = null;
	@Autowired(required=false)
	FirstBLogic fbLogic;
	
	
	@RequestMapping("/poccat.foc")
	public String poccat(Model mod, @RequestParam Map<String,Object> pMap
			,HttpServletRequest req) {
		String temp= null;
		session = req.getSession();
		logger.info("poccat 호출 성공"+pMap);
		if(req.getParameter("mem_no")==null&&session.getAttribute("userMap")!=null)
		{
			if(req.getParameter("all")!=null) {//헤더의 서치박스 눌렀을때 비로그인 포스팅리스트 뜨게할조건
				pMap.put("all", "all");
			}else {
				Map<String,Object> tempMap = new HashMap<>();
				tempMap = (Map<String,Object>)session.getAttribute("userMap");
				//세션에 있는 회원번호 꺼내서 담아주는 과정.
				temp =(String)tempMap.get("mem_no");
				logger.info("temp : "+temp);
			}
		}
		if(temp!=null) {
			pMap.put("mem_no", temp);
		}
		logger.info(pMap);
		fbList = fbLogic.poccat(pMap);
		mod.addAttribute("rList", fbList);
		logger.info("fbList : "+fbList);
		return "sns/mainPage";
	}
	
	@RequestMapping("/adoption_review_list.foc")
	public String adoption_review_list(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("adoption_review_list 호출 성공"+pMap);
		fbList = fbLogic.adoption_review_list(pMap);
		mod.addAttribute("rList", fbList);
		return "forward:/test.jsp";
	}
	@RequestMapping("/adoption_review_detail.foc")
	public String adoption_review_detail(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("adoption_review_detail 호출 성공"+pMap);
		fbList = fbLogic.adoption_review_detail(pMap);
		mod.addAttribute("rList", fbList);
		return "forward:/test.jsp";
	}
	@RequestMapping("/adoption_review_write.foc")
	public String adoption_review_write(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("adoption_review_write 호출 성공"+pMap);
		result = fbLogic.adoption_review_write(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/adoption_review_modi.foc")
	public String adoption_review_modi(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("adoption_review_modi 호출 성공"+pMap);
		result = fbLogic.adoption_review_modi(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/adoption_review_del.foc")
	public String adoption_review_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("adoption_review_del 호출 성공"+pMap);
		result = fbLogic.adoption_review_del(pMap);
		return "forward:/test.jsp";
	}
	
	@RequestMapping("/posting_list.foc")
	public String posting_list(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("posting_list 호출 성공"+pMap);
		fbList = fbLogic.posting_list(pMap);
		logger.info("fbList===> " + fbList);
		mod.addAttribute("rList", fbList);
		return "forward:/test.jsp";
	}
	@RequestMapping("/posting_detail.foc")
	public String posting_detail(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("posting_detail 호출 성공"+pMap);
		fbList = fbLogic.posting_detail(pMap);
		mod.addAttribute("rList", fbList);
		return "forward:/test.jsp";
	}
	@RequestMapping("/posting_write.foc")
	public String posting_write(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("posting_write 호출 성공"+pMap);
		result = fbLogic.posting_write(pMap);
		//return "redirect:/sns/mainPage.jsp?result="+result;//result에 따라 보여줄값이있을때?
		return "sns/mainPage";//result에 따라 보여줄값이있을때?
	}
	
	@RequestMapping("/posting_modi.foc")
	public String posting_modi(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("posting_modi 호출 성공"+pMap);
		result = fbLogic.posting_modi(pMap);
		return "forward:/test.jsp";
	}
	@RequestMapping("/posting_del.foc")
	public String posting_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("posting_del 호출 성공"+pMap);
		result = fbLogic.posting_del(pMap);
		return "forward:/test.jsp";// 
	}
	@RequestMapping("/insert_or_del_like.foc")
	public String insert_or_del_like(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("insert_or_del_like 호출 성공"+pMap);
		result = fbLogic.insert_or_del_like(pMap);
		return "forward:/test.jsp";//아작스로 처리 리턴타입 보이드 가능?
	}
	@RequestMapping("/posting_cmt_list.foc")
	public String posting_cmt_list(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("posting_cmt_list 호출 성공"+pMap);
		fbList = fbLogic.posting_cmt_list(pMap);
		mod.addAttribute("rList", fbList);
		return "/common/JsonPrint";
	}
	
	
	

}
