<%@page import="java.util.List"%>
<%@page import="com.koreait.matjip.util.Pager"%>
<%@ page import="com.koreait.matjip.domain.Member" %>
<%@ page import="com.koreait.matjip.domain.Review" %>
<%@ page import="com.koreait.matjip.domain.Jjim" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
/* 	List<Review> reviewList = (List)request.getAttribute("reviewList");
	Pager pager = (Pager) request.getAttribute("pager"); */
	
	Member member=(Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이 페이지</title>

<!-- style -->
<%@ include file="../../shop/inc/head_link.jsp" %>

<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
}

/* The grid: Three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  padding: 50px;
  text-align: center;
  font-size: 25px;
  cursor: pointer;
  color: black;
}

.containerTab {
  padding: 20px;
  color: black;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Closable button inside the container tab */
.closebtn {
  float: right;
  color: black;
  font-size: 35px;
  cursor: pointer;
}
</style>
</head>

<body>
	<!-- header -->
	<%@ include file="../../shop/inc/header.jsp"%>

	<div class="row">
		<!-- sidebar_left -->
		<div class="side">
			<%@ include file="../../shop/inc/sidebar.jsp"%>
		</div>

		<!-- main -->
		<div class="main">
		
			<div style="text-align:center;padding:10px">
			  <h2><%= member.getEmail() %> 님의 마이페이지</h2>
			</div>
			
			<!-- Three columns -->
			<div class="row" style="height:300px">
			  <div class="column" onClick="location.href='/myReview'" style="background:#ccc;">
			    <h2>내가 쓴 리뷰</h2>
			  </div>
			  <div class="column" onClick="location.href='/myJjim'" style="background:#bbb;">
			    <h2>내가 찜한 맛집</h2>
			  </div>
			  <div class="column" onClick="location.href='/myChange'" style="background:#aaa;">
			    <h2>내 정보 관리<h2>
			  </div>
			</div>
		</div>
	</div>
	<!-- row -->
	
	<%@ include file="../../shop/inc/footer.jsp"%>
		
</body>
</html>
