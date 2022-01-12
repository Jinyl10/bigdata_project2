<%@page import="java.util.List"%>
<%@page import="com.koreait.matjip.util.Pager"%>
<%@ page import="com.koreait.matjip.domain.Member" %>
<%@ page import="com.koreait.matjip.domain.Review" %>
<%@ page import="com.koreait.matjip.domain.Jjim" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Review> reviewList = (List)request.getAttribute("reviewList");
	Pager pager = (Pager) request.getAttribute("pager");
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
		
			<div style="text-align:center">
			  <h2>Expanding Grid</h2>
			</div>
			
			<!-- Three columns -->
			<div class="row">
			  <div class="column" onclick="openTab('b1');" style="background:#ccc;">
			    <a href="/myReview">내가 쓴 리뷰</a>
			  </div>
			  <div class="column" onclick="openTab('b2');" style="background:#bbb;">
			    <a href="/member/myjjim">내가 찜한 맛집</a>
			  </div>
			  <div class="column" onclick="openTab('b3');" style="background:#aaa;">
			    <a href="member/change">내 정보 관리</a>
			  </div>
			</div>
			
			<!-- Full-width columns: (hidden by default) -->
			<div id="b1" class="containerTab" style="display:none;background:#ccc">
				<span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
				<!-- myReview -->
				
					<div>
						<h2>리뷰 목록</h2>
						<table>
							<thead>
								<tr>
									<th>No</th>
									<th>가게 번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
								</tr>
							</thead>
				
							<% int curPos = pager.getCurPos(); %>
							<% int num = pager.getNum(); %>
							<% for (int i = 1; i <= pager.getPageSize(); i++) { %>
							<% if (num < 1)
								break; %>
							<% Review review = reviewList.get(curPos++); %>
				
							<tr>
								<td><%=num--%></td>
								<td><%=review.getMember().getMember_id() %></td>
								<td><a
									href="/review/detailReview?review_id=<%=review.getReview_id()%>"><%=review.getReview_title()%></a></td>
								<td><%=review.getRestrt().getRESTRT_NM() %></td>
								<td><%=review.getReview_regdate()%></td>
							</tr>
				
							<% }%>
				
						</table>
					</div>
					<div style="padding-top: 20px">
					<div class="pagination" >
							<% for (int i = pager.getFirstPage(); i <= pager.getLastPage(); i++) { %>
							<% if (i > pager.getTotalPage())
									break;
							%>
							<a class="<%if (i == pager.getCurrentPage()) {%>active<%}%>" aria-current="page" href="/review/listReview?currentPage=<%=i%>"><%=i%></a>
							<% } %>
						</div>
					</div>
				
				
			</div>
			
			<div id="b2" class="containerTab" style="display:none;background:#bbb">
				<span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
				<!-- myJjim -->
			</div>
			
			<div id="b3" class="containerTab" style="display:none;background:#aaa">
				<span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
				<!-- 비밀번호 수정 or 회원 탍퇴 -->
			</div>
			
		</div>
	</div>
	
<script>
function openTab(tabName) {
  var i, x;
  x = document.getElementsByClassName("containerTab");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  document.getElementById(tabName).style.display = "block";
}
</script>

</body>
</html>
