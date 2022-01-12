package com.koreait.matjip.controller.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.matjip.domain.Notice;
import com.koreait.matjip.model.notice.NoticeService;
import com.koreait.matjip.util.Pager;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private Pager pager;
	
	@GetMapping("/notice")
	public String getList(HttpServletRequest request, Model model) {
		List noticeList = noticeService.selectAll();
		pager.init(noticeList, request);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pager", pager);
		
		return "shop/notice/listNotice";
	}
	
//상세보기 요청 처리
	@GetMapping("/detailNotice")
	public ModelAndView getDetail(HttpServletRequest request, @RequestParam(name = "notice_id", defaultValue = "0")int notice_id) {
		Notice notice=noticeService.select(notice_id);
		ModelAndView mav = new ModelAndView("shop/notice/detailNotice");
		mav.addObject("notice", notice);
		
		return mav;
	}
	
}
