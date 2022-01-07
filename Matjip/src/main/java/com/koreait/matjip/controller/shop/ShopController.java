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

import com.koreait.matjip.domain.Shop;
import com.koreait.matjip.exception.ShopException;
import com.koreait.matjip.model.shop.ShopService;
import com.koreait.matjip.util.Pager;

// 스프링 버전이 올라갈 수록 구현 강제보다는 개발자의 자율에 맡기는 추세이며
// xml에 설정하는 대부분의 코드가 자바 어노테이션으로 지원된다

@Controller
public class ShopController {

	@Autowired
	private ShopService shopService;			// 느슨하게 보유
	
	@Autowired
	private Pager pager;
	
	// 메소드 정의 자율!!!!!!
	@RequestMapping(value="/restrt/write")
	public String writeForm() {
		
		return "restrt/write";
	}

	
	// 음식점 목록
	@GetMapping("/searchRestrt")
	public String getList(HttpServletRequest request, Model model) {
		List shopList = shopService.selectAll();
		pager.init(shopList, request);
		
		model.addAttribute("shopList", shopList);
		model.addAttribute("pager", pager);
		
		return "shop/restrt/searchRestrt";
	}	
//	@RequestMapping(value="/restrt/listRestrt")
//	public ModelAndView getList(HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView("shop/list");		// setViewName() 메소드 사용과 동일
//		List shopList = shopService.selectAll();
//		mav.addObject("shopList", shopList);
//		return mav;
//	}

//	@RequestMapping(value="/searchStore", method=RequestMethod.GET)
//	public ModelAndView getStore() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("shop/restrt/searchRestrt");
//		
//		return mav;
//	}
	
	// 음식점 등록
	@RequestMapping(value="/restrt/regist", method=RequestMethod.POST)
	public ModelAndView regist( HttpServletRequest request, Shop shop) {
		System.out.println("당신이 입력한 가게 이름은"+shop.getRESTRT_NM());
		shopService.insert(shop);						
		
		ModelAndView mav=new ModelAndView("redirect:/restrt/listRestrt");
		return mav;
	}
	
	
	// 한건가져오기
	@RequestMapping(value="/restrt/detailRestrt", method=RequestMethod.GET)
	public ModelAndView select(int restrt_id) {
		//3단계
		Shop shop = shopService.select(restrt_id);
		
		//4단계
		ModelAndView mav=new ModelAndView("shop/restrt/detailRestrt");
		mav.addObject("shop", shop);
		return mav;
	}
	
	/*
	// 수정요청 처리
	@RequestMapping(value="/notice/update", method=RequestMethod.POST)
	public ModelAndView update(Notice notice) {
		//3단계
		noticeService.update(notice);
		ModelAndView mav=new ModelAndView("redirect:/notice/detail?notice_id="+notice.getNotice_id());
		return mav;
	}
	
	// 삭제요청 처리
	@RequestMapping(value="/notice/delete", method=RequestMethod.GET)
	public String delete(int notice_id) {
		noticeService.delete(notice_id);
		return "redirect:/notice/list";							// 담을게 없다면 String으로 주소를 처리해도 된다
		// 즉 뷰만 처리해도 될 때는 String도 허용됨
	}
	*/
	
	// 게시판과 관련된 익셉션
	@ExceptionHandler(ShopException.class)								// 원인이 되는 클래스 넣기
	public ModelAndView handleException(ShopException e) {		// 인스턴스 넣기
		ModelAndView mav= new ModelAndView("error");
		mav.addObject("e", e);
		return mav;
	}
	
	
}
	


