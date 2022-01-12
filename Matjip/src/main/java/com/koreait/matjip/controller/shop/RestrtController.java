package com.koreait.matjip.controller.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.matjip.domain.Restrt;
import com.koreait.matjip.domain.Review;
import com.koreait.matjip.model.category.CategoryService;
import com.koreait.matjip.model.restrt.RestrtService;
import com.koreait.matjip.model.review.ReviewService;
import com.koreait.matjip.util.Pager;

@Controller
public class RestrtController {
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private RestrtService restrtService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private Pager pager;
	
	@GetMapping("/searchRestrt")
	public String getlistRestrt(HttpServletRequest request, Model model) {
		List restrtList = restrtService.selectAll();
		pager.init(restrtList, request);
		
		List categoryList = categoryService.selectAll();
				
		model.addAttribute("restrtList", restrtList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("pager", pager);
		
		return "shop/restrt/searchRestrt";
	}
	
//	@RequestMapping(value="/searchRestrt", method=RequestMethod.GET)
//	public ModelAndView getlistRestrt() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("shop/restrt/searchRestrt");
//		
//		return mav;
//	}
	
	//detailRestrt
	@RequestMapping(value="/restrt/detailRestrt", method=RequestMethod.GET)
	public ModelAndView select(HttpServletRequest request, @RequestParam(name="restrt_id") int restrt_id) {
		// 3단계: 일
		Restrt restrt = restrtService.select(restrt_id);
		List reviewList = reviewService.selectAllByRestrt(restrt_id);
		pager.init(reviewList, request);
		
		
		// 4단계: 저장
		ModelAndView mav = new ModelAndView("shop/restrt/detailRestrt"); //setViewName
		mav.addObject("restrt", restrt);
		mav.addObject("reviewList", reviewList);
		mav.addObject("pager", pager);
		
		return mav;
	}
	
	
	
}
