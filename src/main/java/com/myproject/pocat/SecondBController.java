package com.myproject.pocat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myproject.logic.SecondBLogic;


@Controller
@RequestMapping("/secondB/*")
public class SecondBController {
	Logger logger = LogManager.getLogger(FirstBController.class);
	List<Map<String,Object>> sbList = null; 
	int result = 0;
	@Autowired(required=false)
	SecondBLogic sbLogic;
	String com_b_type = null;
	String return_address = null;
	
	@RequestMapping("/volunteer_noti_list.foc")
	public String volunteer_noti_list(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("volunteer_noti_list 호출 성공"+pMap);
		sbList = sbLogic.volunteer_noti_list(pMap);
		mod.addAttribute("rList", sbList);
		return "forward:/test.jsp";
	}
	
	@RequestMapping("/volunteer_noti_detail.foc")
	public String volunteer_noti_detail(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("volunteer_noti_detail 호출 성공"+pMap);
		sbList = sbLogic.volunteer_noti_detail(pMap);
		mod.addAttribute("rList", sbList);
		return "forward:/test.jsp";
	}
	
	@RequestMapping("/volunteer_noti_write.foc")
	public String volunteer_noti_write(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("volunteer_noti_write 호출 성공"+pMap);
		result = sbLogic.volunteer_noti_write(pMap);
		return "forward:/test.jsp";
	}
	
	@RequestMapping("/volunteer_noti_modi.foc")
	public String volunteer_noti_modi(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("volunteer_noti_modi 호출 성공"+pMap);
		result = sbLogic.volunteer_noti_modi(pMap);
		return "forward:/test.jsp";
	}
	
	@RequestMapping("/volunteer_noti_del.foc")
	public String volunteer_noti_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("volunteer_noti_del 호출 성공"+pMap);
		result = sbLogic.volunteer_noti_del(pMap);
		return "forward:/test.jsp";
	}
	
	@RequestMapping("/volunteer_apply_check.foc")
	public String volunteer_apply_check(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("volunteer_apply_check 호출 성공"+pMap);
		sbList = sbLogic.volunteer_apply_check(pMap);
		mod.addAttribute("rList", sbList);
		return "forward:/test.jsp";
	}
	
	@RequestMapping("/volunteer_apply_book.foc")
	public String volunteer_apply_book(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("volunteer_apply_book 호출 성공"+pMap);
		result = sbLogic.volunteer_apply_book(pMap);
		return "forward:/test.jsp";
	}
	
	@RequestMapping("/volunteer_apply_cancel.foc")
	public String volunteer_apply_cancel(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("volunteer_apply_cancel 호출 성공"+pMap);
		result = sbLogic.volunteer_apply_cancel(pMap);
		return "forward:/test.jsp";
	}
	
	@RequestMapping("/common_board_list.foc")
	public String common_board_list(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("common_board_list 호출 성공"+pMap);
		if(pMap.containsKey("com_b_type")){
			logger.info("containskey");
			com_b_type = (String) pMap.get("com_b_type");
		}
		sbList = sbLogic.common_board_list(pMap);
		if (sbList.size()==0) { //게시글이 없을 때 500번 방지
			com_b_type = (String) pMap.get("com_b_type");
			Map<String, Object> rMap = new HashMap<>();
			rMap.put("COM_B_TYPE",com_b_type);
			sbList.add(rMap);
		}
		mod.addAttribute("rList", sbList);
		if(com_b_type.equals("0")) {
			return_address = "sns/commonBoard";
		}
		else if(com_b_type.equals("3")) {
			return_address = "sns/commonBoard";
		}
		return return_address;
	}
	
	@RequestMapping("/common_board_detail.foc")
	public String common_board_detail(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("common_board_detail 호출 성공"+pMap);
		sbList = sbLogic.common_board_detail(pMap);
		mod.addAttribute("rList", sbList);
		return "sns/commonBoardDetail";
	}
	
	@RequestMapping("/common_board_write.foc")
	public String common_board_write(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("common_board_write 호출 성공"+pMap);
		com_b_type = (String) pMap.get("com_b_type");
		result = sbLogic.common_board_write(pMap);
		return "redirect:/common_board_list.foc?com_b_type="+com_b_type;
	}
	
	@RequestMapping("/common_board_modi.foc")
	public String common_board_modi(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("common_board_modi 호출 성공"+pMap);
		result = sbLogic.common_board_modi(pMap);
		return "sns/commonBoard";
	}
	
	@RequestMapping("/common_board_del.foc")
	public String common_board_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("common_board_del 호출 성공"+pMap);
		com_b_type = (String) pMap.get("com_b_type");
		result = sbLogic.common_board_del(pMap);
		return "redirect:/common_board_list.foc?com_b_type="+com_b_type;
	}
	
	@RequestMapping("/donation_noti_list.foc")
	public String donation_noti_list(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("donation_noti_list 호출 성공"+pMap);
		sbList = sbLogic.donation_noti_list(pMap);
		mod.addAttribute("rList", sbList);
		return "sns/donationBoard";
	}
	
	@RequestMapping("/donation_noti_detail.foc") 
	public String donation_noti_detail(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("donation_noti_detail 호출 성공"+pMap);
		sbList = sbLogic.donation_noti_detail(pMap);
		mod.addAttribute("rList", sbList);
		return "sns/donationBoardDetail";
	}
	
	@RequestMapping("/donation_noti_write.foc")
	public String donation_noti_write(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("donation_noti_write 호출 성공"+pMap);
		result = sbLogic.donation_noti_write(pMap);
		logger.info("sbList"+sbList);
		mod.addAttribute("rList", sbList);
		return "forward:/test.jsp";
	}
	
	@RequestMapping("/donation_noti_modi.foc")
	public String donation_noti_modi(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("donation_noti_modi 호출 성공"+pMap);
		result = sbLogic.donation_noti_modi(pMap);
		mod.addAttribute("rList", sbList);
		return "forward:/test.jsp";
	}
	
	@RequestMapping("/donation_noti_del.foc")
	public String donation_noti_del(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("donation_noti_del 호출 성공"+pMap);
		result = sbLogic.donation_noti_del(pMap);
		mod.addAttribute("rList", sbList);
		return "forward:/test.jsp";
	}
	
	@RequestMapping("/donation_check.foc")
	public String donation_check(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("donation_check 호출 성공"+pMap);
		sbList = sbLogic.donation_check(pMap);
		mod.addAttribute("rList", sbList);
		return "forward:/test.jsp";
	}
	
	@RequestMapping("/donation_book.foc")
	public String donation_book(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("donation_book 호출 성공"+pMap);
		result = sbLogic.donation_book(pMap);
		mod.addAttribute("rList", sbList);
		return "common/PrintResult";
	}
	
	@RequestMapping("/donation_cancel.foc")
	public String donation_cancel(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("donation_cancel 호출 성공"+pMap);
		result = sbLogic.donation_cancel(pMap);
		mod.addAttribute("rList", sbList);
		return "forward:/test.jsp";
	}
	@RequestMapping("/donation_getTotal.foc")
	public String donation_getTotal(Model mod, @RequestParam Map<String,Object> pMap) {
		logger.info("donation_getTotal 호출 성공"+pMap);
		sbList = sbLogic.donation_getTotal(pMap);
		mod.addAttribute("rList", sbList);
		return "/common/JsonPrint";
	}
}
