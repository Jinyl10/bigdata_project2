package com.koreait.matjip.controller.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.matjip.model.restrt.RestrtService;
import com.koreait.matjip.util.Pager;

@Controller
public class RestrtController {
	
	@Autowired
	private RestrtService restrtService;
	
	//@Autowired
	//private Pager pager;
	
	@GetMapping("/searchRestrt")
	public String getlistRestrt(Model model) {
		List restrtList = restrtService.selectAll();
		//pager.init(restrtList);
		
		model.addAttribute("restrtList", restrtList);
		//model.addAttribute("pager", pager);
		
		return "shop/restrt/searchRestrt";
	}
	
//	@RequestMapping(value="/searchRestrt", method=RequestMethod.GET)
//	public ModelAndView getlistRestrt() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("shop/restrt/searchRestrt");
//		
//		return mav;
//	}
	
	
	
}
