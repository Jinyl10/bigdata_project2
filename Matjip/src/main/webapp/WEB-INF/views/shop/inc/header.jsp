<%@ page contentType="text/html; charset=UTF-8"%>
 
	<div class="header">
		<h1>
			<a> 경 기 맛 집 발 전 진 흥 회</a>
		</h1>
	</div>

	<div class="navbar">
		<div class="navbar-right" style="float: right">
			<%-- <% session.getAttribute %> --%>
			<%if(session.getAttribute("member")!=null){ //로그인 한 사람만 ..%> 
				<a href="/myPage">My Page</a>
				<a href="/logout">Logout</a> 
			<%}else{%>
				<a href="/login/form">Login</a> 
				<a href="/join/form">Join</a> 
				
		 <%} %>
		</div>
	</div>

