<%@page import="com.koreait.matjip.util.Pager"%>
<%@page import="com.koreait.matjip.domain.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	List<Notice> noticeList = (List)request.getAttribute("noticeList");
	Pager pager = (Pager) request.getAttribute("pager");
%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<!-- style -->
<%@ include file="../../shop/inc/head_link.jsp"%>
<style type="text/css">

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

		<div class="main">
			
			<div>
				<h2>공지 사항</h2>
				<table>
					<thead>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>내용</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<% int curPos = pager.getCurPos(); %>
						<% int num = pager.getNum(); %>
						<% for (int i = 1; i <= pager.getPageSize(); i++) { %>
						<% if (num < 1)
							break; %>
						<% Notice notice = noticeList.get(curPos++); %>
			
					<tr>
						<td><%=num--%></td>
						<td><a
							href="/detailNotice?notice_id=<%=notice.getNotice_id()%>"><%=notice.getNotice_title()%></a></td>
						<td><%=notice.getNotice_content() %></td>
						<td><%=notice.getNotice_regdate()%></td>
					</tr>
		
					<% }%>
					
					</tbody>
                </table>
			</div>
			<div class="pagination" style="padding-top: 20px">
				<% for (int i = pager.getFirstPage(); i <= pager.getLastPage(); i++) { %>
				<% if (i > pager.getTotalPage())
						break;
				%>
				<a class="<%if (i == pager.getCurrentPage()) {%>active<%}%>" aria-current="page" href="/notice?currentPage=<%=i%>"><%=i%></a>
				<% } %>
			</div>
		</div>
		<!-- /main -->
	</div>
	
	<%@ include file="../../shop/inc/footer.jsp"%>

<!-- <script type="text/javascript">
$(function(){
	getList();
});
//서버에 비동기 요청으로 게시물 목록 가져오기(json배열로)
function getList(){
	$.ajax({
		url:"/shop/notice",
		type:"get",
		success:function(result, status, xhr){
			//실제 데이터를 tr에 dom생성 후 반영
			
			console.log(result);
			
			var tag="";
			
			for(var i=0; i<result.length;i++){
				var json=result[i]; //i번째 요소 가져오기
				tag+="<tr>";
				tag+="<td></td>";
				tag+="<td><a href='/detailNotice?notice_id="+json.notice_id+"'>"+json.title+"</a></td>";
				tag+="<td>"+json.notice_content+"</td>";
				tag+="<td>"+json.notice_regdate+"</td>";
				tag+="</tr>";
			}
			$("#dataList").append(tag);
		}
	});
}
</script>
 -->
</body>
</html>
