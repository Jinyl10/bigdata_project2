package com.koreait.matjip.controller.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.koreait.matjip.domain.Notice;
import com.koreait.matjip.exception.NoticeException;
import com.koreait.matjip.model.notice.NoticeService;
import com.koreait.matjip.util.Message;

@RestController
public class RestNoticeController {

	@Autowired
	private NoticeService noticeService; 
	
	@GetMapping("/shop/notice")
	public List getList(HttpServletRequest request) {
		//게시물 목록
		List<Notice> noticeList=noticeService.selectAll();
		
		return noticeList; //   
	}
	
	//한건의 데이터 rest 요청 처리   /admin     /rest/notice/1
	@RequestMapping(value="/rest/notice/{notice_id}", method=RequestMethod.GET)
	public Notice getDetail(@PathVariable(name = "notice_id") int  notice_id) {
		Notice notice = noticeService.select(notice_id);
		return notice;
	}
	
	
	@ExceptionHandler(NoticeException.class)
	public ResponseEntity<Message> handle(NoticeException e) {
		Message message=new Message();
		message.setMsg(e.getMessage());
		message.setCode(0);
		
		ResponseEntity<Message> entity=new ResponseEntity<Message>(message , HttpStatus.OK); //200
		
		return entity;
	}
}