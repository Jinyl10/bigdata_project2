<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- sidebar_left -->

<div class="sidebar">
	<a href="/main">Home</a> 
	<a href="/searchRestrt">맛집 찾기</a> 
	
	<a <%if(session.getAttribute("member")!=null){ %> 
		href="/review/listReview" 
		<%} else {%> onClick="alert('로그인이 필요한 서비스입니다.')" <% }%> >
	리뷰 보기</a> 
	
	<a href="#notice">공지사항</a>
</div>
