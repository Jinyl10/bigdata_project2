package com.koreait.matjip.controller.shop;

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
import com.koreait.matjip.exception.UploadException;
import com.koreait.matjip.model.review.ReviewService;
import com.koreait.matjip.util.FileManager;
import com.koreait.matjip.util.Pager;

@Controller
public class ReviewController {
	
	@Autowired
	private FileManager fileManager;
	
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
		
		return "shop/review/listReview";
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
	@RequestMapping(value="/review/write")
	public String writeForm() {
		return "shop/review/write";
	}
	
	//regist
	@RequestMapping(value="/review/regist", method=RequestMethod.POST)
	public ModelAndView regist(HttpServletRequest request, Review review) {
		String filename=FileManager.saveAsFile(request, review);
		review.setFilename(filename);
		reviewService.insert(review);
		
		ModelAndView mav = new ModelAndView("redirect:/review/listReview");
		return mav;
	}
	
	//업로드 테스트
		@RequestMapping(value="/review/upload", method=RequestMethod.POST)
		public String uploadTest(HttpServletRequest request, Review review) {
			return null;
		}	
	
	//detailReview
	@RequestMapping(value="/review/detailReview", method=RequestMethod.GET)
	public ModelAndView select(int review_id) {
		// 3단계: 일
		Review review = reviewService.select(review_id);	
		
		// 4단계: 저장
		ModelAndView mav = new ModelAndView("shop/review/detailReview"); //setViewName
		mav.addObject("review", review);
		
		return mav;
	}
	
	//update
	@RequestMapping(value="/review/update", method=RequestMethod.POST)
	public ModelAndView update(Review review) {
		reviewService.update(review);
		ModelAndView mav = new ModelAndView("redirect:/review/detailReview?review_id="+review.getReview_id());
		return mav;
	}
	
	//delete
	@RequestMapping(value="/review/delete", method=RequestMethod.GET)
	public String delete(int review_id) {
		reviewService.delete(review_id);
		
		return "redirect:/review/listReview";
	}
	
	// 에러 발생; 3단계; 방치하지 말고 에러페이지로!
	@ExceptionHandler(ReviewException.class)
	public ModelAndView handleException(ReviewException e) {
		ModelAndView mav = new ModelAndView("error");
		mav.addObject("e", e);
		return mav;
	}
	
	@ExceptionHandler(UploadException.class)
	public ModelAndView handleException(UploadException e) {
		ModelAndView mav = new ModelAndView("error");
		mav.addObject("e" , e);
		return mav;
	}

	
}
