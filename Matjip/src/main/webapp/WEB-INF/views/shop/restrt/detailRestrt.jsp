<%@page import="com.koreait.matjip.domain.Review"%>
<%@page import="com.koreait.matjip.domain.Restrt"%>
<%@page import="com.koreait.matjip.util.Pager"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	Restrt restrt=(Restrt)request.getAttribute("restrt");
	Pager pager = (Pager) request.getAttribute("pager");
	List<Review> reviewList = (List) request.getAttribute("reviewList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>맛집 정보</title>
<%@ include file="../../shop/inc/head_link.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body 
* {box-sizing: border-box;}

.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.fa {
  font-size: 50px;
  cursor: pointer;
  user-select: none;
}

.fa:hover {
  color: darkblue;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

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
			<h3>가게 정보</h3>
			<div align="right">
				<label class="switch">
				  <input type="checkbox">
				  <span class="slider round"></span>
				</label>
			</div>
			
			<div class="container">
			  <form >
			  	<input type="hidden" name="restrt_id" value="<%=restrt.getRestrt_id()%>">
			  	
			    <label for="fname">가게 이름</label>
			    <input type="text" name="restrt_nm"  value="<%=restrt.getRESTRT_NM()%>">
			
			    <label for="lname">가게 주소</label>
			    <input type="text" name="refine_roadnm_addr" value="<%=restrt.getREFINE_ROADNM_ADDR()%>" >
			    
			
			    <h2>음식점을 다녀가신 손님들의 리뷰</h2>
					<table>
						<thead>
							<tr>
								<th>No</th>
								<th>리뷰 제목</th>
								<th>리뷰 날짜</th>
								<th>리뷰 내용</th>
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
							<td><%=review.getReview_title()%></td>
							<td><%=review.getReview_regdate()%></td>
							<td><%=review.getReview_content()%></td>
						</tr>
						<% } %>
					</table>
					
					<div class="pagination" style="paddiing-top: 30px">
						<%
							for (int i = pager.getFirstPage(); i <= pager.getLastPage(); i++) {
						%>
						<% if (i > pager.getTotalPage())
							break; %>
						<a class="<%if (i == pager.getCurrentPage()) {%>active<%}%>"
							aria-current="page" href="/restrt/detailRestrt?currentPage=<%=i%>"><%=i%></a>
						<%} %>
					</div>
			
			    <input type="button" value="다른 음식점 찾기" onClick="location.href='/searchRestrt'">
			  </form>
			</div>
		</div>
		<!-- main -->
	</div>
	<!-- row -->
	<%@ include file="../../shop/inc/footer.jsp"%>
</body>
</html>