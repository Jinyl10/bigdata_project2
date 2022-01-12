package com.koreait.matjip.controller.shop;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.matjip.domain.Member;
import com.koreait.matjip.exception.MemberException;
import com.koreait.matjip.model.jjim.JjimService;
import com.koreait.matjip.model.member.MemberService;
import com.koreait.matjip.model.review.ReviewService;
import com.koreait.matjip.util.HashBuilder;
import com.koreait.matjip.util.Message;



@RestController
public class RestMemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HashBuilder hashBuilder;
	
	/*로그인 요청 처리; return 값에 반환된 데이터를 viewResolver 해석 하는게 아니라, 메서드 반환형으로 명시한 데이터 자체를 응답 데이터로 전송 */
	@PostMapping("/login/check")
	public Message loginCheck(HttpServletRequest request, Member member) {
		/* 서비스에 일 시키기 전에, 비밀번호를 hash 값으로 변환해서 비교해야함; db의 hash값과 변환한 hash 값이 틀린 경우 인증 실패 */
		String password = hashBuilder.convertStringToHash(member.getPassword());
		member.setPassword(password);
		
		Member result = memberService.select(member);
		//System.out.println("로그인 결과" + result);
		
		Message message = new Message();	//POJO 일반 평범한 클래스
		message.setCode(1); 
		message.setMsg("로그인 성공");
		
		HttpSession session=request.getSession();
		session.setAttribute("member", result); 	//세션에 DTO 저장
	
		return message;
	}
	
	//여기서 부터 수정 필요...
	
	
	
	//회원가입 체크
	@PostMapping("/join/regist")
	public ResponseEntity<Message> insert(Member member) {
		String password = hashBuilder.convertStringToHash(member.getPassword());
		member.setPassword(password);
		
		memberService.insert(member);
		
		Message message = new Message();
		message.setMsg("회원 가입 완료");
		message.setCode(1);
		
		ResponseEntity<Message> entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;
	}

//	수정 전;
//	@ResponseBody	//응답 정보가 데이터다.
//	public Message joinRegist(HttpServletRequest request, Member member) {
//		/* 서비스에 일 시키기 전에, 비밀번호를 hash 값으로 변환해서 비교해야함; db의 hash값과 변환한 hash 값이 틀린 경우 인증 실패 */
//		String password = hashBuilder.convertStringToHash(member.getPassword());
//		member.setPassword(password);
//		
//		memberService.insert(member)	;
//					
//		Message message = new Message();	//POJO 일반 평범한 클래스
//		message.setCode(1); 
//		message.setMsg("회원가입 성공");
//		
//		return message;
//	}	


	// 비밀번호 수정
	@RequestMapping(value="/member/update", method=RequestMethod.PUT)
	public ResponseEntity<Message> update(Member member) {
		memberService.update(member);
		
		Message message = new Message();
		message.setMsg("회원 정보 수정 완료");
		message.setCode(1);
		
		ResponseEntity<Message> entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;
	}

	
	// 회원 탈퇴
	@RequestMapping(value="/member/delete", method=RequestMethod.DELETE)
	public ResponseEntity<Message> delete(Member member) {
		memberService.delete(member);
		
		Message message = new Message();
		message.setMsg("회원 탈퇴 완료");
		message.setCode(1);
		
		ResponseEntity<Message> entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}

//	마이페이지!!!!	
//		@RequestMapping(value="/myPage", method=RequestMethod.GET)
//		public ModelAndView mypage(HttpServletRequest request, Member member) {
//			HttpSession session = request.getSession();
//		}
	
	
	@ExceptionHandler(MemberException.class)
	public ResponseEntity<Message> handle(HttpServletRequest request, MemberException e) {
		/* 한글 및 제대로된 응답 정보를 구성하려면 ResponseEntity header, body {code:1, msg:"실패입니다."} 
		 * Gson을 직접 써도 되지만, 로드존슨이 이미 자동으로 json으로 변환하는 내부적 처리를  함; 객체 --> JSON
		 */
		Message message = new Message();
		message.setMsg(e.getMessage());
		message.setCode(0);
		
		ResponseEntity<Message> entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
	
}
