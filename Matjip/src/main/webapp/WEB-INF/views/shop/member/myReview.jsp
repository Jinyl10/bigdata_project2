<%@page import="com.koreait.matjip.domain.Member"%>
<%@page import="com.koreait.matjip.util.Pager"%>
<%@page import="com.koreait.matjip.domain.Review"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Member member=(Member)session.getAttribute("member");	

	List<Review> reviewList = (List) request.getAttribute("reviewList");
	Pager pager = (Pager) request.getAttribute("pager");
%>

<!DOCTYPE html>
<html>
<head>
<title>리뷰 리스트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
 -->
<%@ include file="../../shop/inc/head_link.jsp"%>
<style>
table {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
}

th, td {
	text-align: left;
	padding: 16px;
}

/* th{background-color:#eee}
 tr:hover {background-color: #eee} */
table:hover tbody tr:hover td {
	background: #eee;
	color: black;
}

.pagination {
	margin: auto;
	display: inline-block;
	position: absolute;
	left: 50%;
	margin-left:-60px;
	padding: 10px
}

.pagination a {
	border-radius: 5px;
	color: black;
	float: center;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	text-align: center;
}

.pagination a.active {
	background-color: #ddd;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

.button {
  border-radius: 4px;
  background-color: #ddd;
  border: none;
  color: black;
  text-align: center;
  font-size: 18px;
  padding: 10px;
  width: 100px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

</style>

<script type="text/javascript">
	function writeForm() {
		location.href = "/review/write";
	}
</script>

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
			<div>
				<h2><%= member.getEmail() %> 님이 작성한 리뷰</h2>
				<table>
					<thead>
						<tr>
							<th>No</th>
							<th>가게 번호</th>
							<th>이미지</th>
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
						<td><%=review.getRestrt().getRESTRT_NM() %></td>
						<td><img src="/resources/data/<%=review.getFilename()%>"
							width="40px"></td>
						<td><a
							href="/review/detailReview?review_id=<%=review.getReview_id()%>"><%=review.getReview_title()%></a></td>
						<td><%=review.getMember().getMember_id() %></td>
						<td><%=review.getReview_regdate()%></td>
					</tr>
		
					<% }%>
		
				</table>
			</div>
			<div style="padding-top: 20px">
			<div class="pagination" >
					<a>&laquo;</a>
					<% for (int i = pager.getFirstPage(); i <= pager.getLastPage(); i++) { %>
					<% if (i > pager.getTotalPage())
							break;
					%>
					<a class="<%if (i == pager.getCurrentPage()) {%>active<%}%>" aria-current="page" href="/review/listReview?currentPage=<%=i%>"><%=i%></a>
					<% } %>
					<a>&raquo;</a>
				</div>
				<button class="button" onClick="location.href='write'" >리뷰 등록</button>
			</div>
		</div>
		<!-- main -->
	</div>
	<!-- row -->
</body>
</html>
