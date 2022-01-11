package com.koreait.matjip.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;

import com.koreait.matjip.exception.MemberException;

public class MemberSessionCheckAspect {
	
	public Object sessionCheck(ProceedingJoinPoint joinPoint) throws MemberException, Throwable {
		Object result=null; 	//최종적으로 반환될 반환값
		
		//원래 호출하려던 타겟(Controller)이 되는 객체
		Object target=joinPoint.getTarget();
		Class targetClass = target.getClass();
		Signature method = joinPoint.getSignature();
		Object[] args = joinPoint.getArgs();	//원래 타겟이 보유한 메서드의 매개변수
		
		//HttpServletRequest가 몇 번째에 있는지 알 수가 없으므로, 반복문으로 꺼내기
		HttpServletRequest request = null;
		for(int i=0; i<args.length; i++) {
			if(args[i] instanceof HttpServletRequest) {
				request=(HttpServletRequest)args[i];
			}
		}
		//System.out.println("원래 호출하려던 컨트롤러와 메서드는 "+targetClass.getName()+","+method);
		
		// 세션 체크하기
		
		String uri = request.getRequestURI();
		
		if( uri.equals("/login/form") || uri.equals("/login/check")) {
			// 그냥 진행하도록함
			result=joinPoint.proceed();
		} else {	
			if(request !=null ) {
				HttpSession session = request.getSession();
				if(session.getAttribute("member")==null) {
					//로그인 에러페이지
					throw new MemberException("로그인이 필요한 서비스입니다.");
				} else {
					result=joinPoint.proceed(); //원래 호출하려던 target의 메서드 호출; 계속 가라..
				}
			}
		}
		return result;
	}
}
