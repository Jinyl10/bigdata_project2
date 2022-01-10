package com.koreait.matjip.aop;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.matjip.exception.MemberException;

//멤버 관련 모든 요청시에 발생하는 예외를 감지할 수 있는 글로벌 익셉션 핸들러 객체

@ControllerAdvice
public class MemberExceptionAdvice {
	
	@ExceptionHandler(MemberException.class)
	public ModelAndView handle(MemberException e) {
		ModelAndView mav = new ModelAndView();
		MemberException memberException = new MemberException("로그인이 필요한 서비스 입니다.");
		mav.addObject("e", memberException);
		mav.setViewName("member/error/result");
		return mav;
	}

}
