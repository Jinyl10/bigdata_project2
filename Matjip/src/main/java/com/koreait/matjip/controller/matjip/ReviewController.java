package com.koreait.matjip.controller.matjip;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.matjip.domain.Review;
import com.koreait.matjip.exception.ReviewException;
import com.koreait.matjip.model.review.ReviewService;
import com.koreait.matjip.util.Pager;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private Pager pager;
	
	//listDetail
	@GetMapping("/review/listReview")
	public String getList(HttpServletRequest request, Model model) {
		List reviewList = reviewService.selectAll();
		pager.init(reviewList, request);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pager", pager);
		
		return "/review/listReview";
	}
	
//	notice	
//	@RequestMapping(value="/review/listReview", method=RequestMethod.GET)
//	public ModelAndView getList(HttpServletRequest request) {
//		// 3단계
//		List reviewList = reviewService.selectAll();
//		
//		// 4단계
//		ModelAndView mav = new ModelAndView("review/listReview");
//		mav.addObject("reviewList", reviewList);
//		pager.init(reviewList, request);
//		mav.addObject("pager", pager);
//		return mav;
//	}
	
	//writeReview
	@RequestMapping(value="/review/writeReview")
	public String writeForm() {
		return "/review/writeReview";
	}
	
	//regist
	
	//detailReview
	@RequestMapping(value="/review/detailReview", method=RequestMethod.GET)
	public ModelAndView select(int review_id) {
		// 3단계: 일
		Review review = reviewService.select(review_id);	
		
		// 4단계: 저장
		ModelAndView mav = new ModelAndView("review/detailReview"); //setViewName
		mav.addObject("review", review);
		
		return mav;
	}
	
	//update
	
	//delete
	@RequestMapping(value="/review/delete", method=RequestMethod.GET)
	public String delete(int review_id) {
		reviewService.delete(review_id);
		
		return "redirect:/review/list";
	}
	
	// 에러 발생; 3단계; 방치하지 말고 에러페이지로!
	@ExceptionHandler(ReviewException.class)
	public ModelAndView handleException(ReviewException e) {
		ModelAndView mav = new ModelAndView("error");
		mav.addObject("e", e);
		return mav;
	}

	
}
