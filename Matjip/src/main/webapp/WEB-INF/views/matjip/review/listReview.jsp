
<%@page import="com.koreait.matjip.util.Pager"%>
<%@page import="com.koreait.matjip.domain.Review"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Review> reviewList =(List)request.getAttribute("reviewList");
	Pager pager=(Pager)request.getAttribute("pager");
%>

<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- zebra table
<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
}

th, td {
	text-align: left;
	padding: 16px;
}

zebra 
tr:nth-child(even) {
	background-color: #f2f2f2;
} 
</style> -->
<script type="text/javascript">
function writeForm(){
	location.href="/review/write";	
}
</script>
</head>
<body>

	<!-- 보완; 디자인....
	detailStore에서 넘어와서 가게 번호는 동일; but foreign..
	로그인해야 글 작성 활성화
	member_id  == session.login_id; 수정, 삭제 활성화
	 -->
	<div class="container-fluid">
	  	<h2>리뷰 목록</h2>
		<table class="table table-bordered">
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
			<!-- 질문
			pager 활성화&부트스트랩(pagination; https://getbootstrap.com/docs/4.6/components/pagination/)
			thead, tbody
			 -->
				<%int curPos=pager.getCurPos(); %>
				<%int num=pager.getNum(); %>
				<%for(int i=1;i<=pager.getPageSize();i++){ %>
				<%if(num<1)break; %>
				<%Review review=reviewList.get(curPos++); %>

				<tr>
					<td><%=num-- %></td>
					<td><%=review.getRestrt_id() %></td>
					<td><img src="/resources/data/<%=review.getFilename()%>" width="40px"></td>
					<td><a href="/review/detailReview?review_id=<%=review.getReview_id()%>"><%=review.getReview_title() %></a></td>
					<td><%=review.getMember_id() %></td>
					<td><%=review.getReview_regdate() %></td>
				</tr>

				<%} %>
				<tr>
					<td colspan="6" align="center">
						<%for(int i=pager.getFirstPage();i<=pager.getLastPage();i++){ %>
						<%if(i>=pager.getTotalPage())break;%>
						[<%=i%>]
						<%}%>
					</td>
				</tr>
			<!-- <tr>
				<td colspan="6">
					<button onClick="location.href='write'">글등록</button>
				</td>
			</tr> -->
		</table>
		<button type="button" class="btn btn-outline-secondary" onClick="location.href='write'">글등록</button>		
		
	</div>

	
</body>
</html>
