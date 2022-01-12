package com.koreait.matjip.controller.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.matjip.domain.Member;
import com.koreait.matjip.domain.Review;
import com.koreait.matjip.exception.MemberException;
import com.koreait.matjip.model.jjim.JjimService;
import com.koreait.matjip.model.member.MemberService;
import com.koreait.matjip.model.review.ReviewService;
import com.koreait.matjip.util.HashBuilder;
import com.koreait.matjip.util.Message;
import com.koreait.matjip.util.Pager;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private JjimService jjimService;
	
	
	
	//로그인폼
	@GetMapping("/login/form")
	public String getLoginForm(HttpServletRequest request) {
		return "shop/member/loginForm";
	}
	
	//로그아웃 요청 처리;
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();	//세션을 무효화; 기존의 세션을 사용할 수 없게됨
		
		return "redirect:/main";
	}
	
	// 회원 가입 폼 요청; session == null 일떄만!
	@RequestMapping(value="/join/form")
	public String joinForm() {
		return "shop/member/joinForm";
	}
	
	//마이페이지 관련!!!
	
	// 마이페이지 요청; selectOne
	@GetMapping("/myPage")
	public String mypage(HttpServletRequest request) {	// ModelAndView ;회원 정보 수정, 탈퇴, 내가 쓴 리뷰, 내가 찜한 가게		
		return "shop/member/myPage";
	}
	
	// 내가 쓴 리뷰; member/myReview 
	@GetMapping("/myReview")
	public ModelAndView myReview(HttpServletRequest request, @RequestParam(name="member_id") int member_id) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		List<Review> reviewList = reviewService.selectAllByMember(member.getMember_id());
		ModelAndView mav = new ModelAndView("/member/myReview");
		
		Pager pager = (Pager)request.getAttribute("pager");
		pager.init(reviewList, request);
		mav.addObject("reviewList", reviewList);
		mav.addObject("pager", pager);
		
		return mav;	
	}
	
	@ExceptionHandler(MemberException.class)
	public ResponseEntity<Message> handle(HttpServletRequest request, MemberException e) {
		Message message = new Message();
		message.setMsg(e.getMessage());
		message.setCode(0);
		
		ResponseEntity<Message> entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}

	

	
}
