<%@page import="com.koreait.matjip.domain.Category"%>
<%@page import="com.koreait.matjip.util.Pager"%>
<%@page import="com.koreait.matjip.domain.Restrt"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	List<Category> categoryList = (List) request.getAttribute("categoryList");
	List<Restrt> restrtList = (List) request.getAttribute("restrtList");
	Pager pager = (Pager) request.getAttribute("pager");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>맛집 찾기</title>
<!-- style -->
<%@ include file="../../shop/inc/head_link.jsp"%>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
<style>
* {
	box-sizing: border-box;
}

/* Create a column layout with Flexbox */
.row {
	display: flex;
}

/* Left column (menu) */
.left {
	flex: 30%;
	padding: 15px 0;
}

.left h2 {
	padding-left: 8px;
}

/* Right column (page content) */
.right {
	flex: 70%;
	padding: 15px;
}

/* Style the search box */
#mySearch {
	width: 100%;
	font-size: 18px;
	padding: 11px;
	border: 1px solid #ddd;
}

/* Style the navigation menu inside the left column */
#myMenu {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

#myMenu li a {
	padding: 12px;
	text-decoration: none;
	color: black;
	display: block
}

#myMenu li a:hover {
	background-color: #eee;
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

.tbody{
	height: 500px;
	overflow-y:auto; 
	overflow-x: hidden;
}

/* th{background-color:#eee}
 tr:hover {background-color: #eee} */
table:hover tbody tr:hover td {
	background: #eee;
	color: black;
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
			<div class="row">
				<div class="left">
					<!-- style="background-color: #bbb;" -->
					<h2>맛집 검색</h2>
					<input type="text" id="mySearch" onkeyup="myFunction()"
						placeholder="Search.." title="Type in a category">
						
					<ul id="myMenu">
						<% for(Category category: categoryList) { %>
							<li><a href="#"><%= category.getCategory_name() %></a></li>
						<%} %>
					</ul>
				</div>

				<div class="right">
					<!-- style="background-color: #ddd;" -->
					<h2>맛집 목록</h2>

  					<div>
						<table>
							<thead>
								<tr>
									<th>No</th>
									<th>카테고리</th>
									<th>음식점 명</th>
									<th>주소</th>
								</tr>
							</thead>
							
							<tbody>
								<% int curPos = pager.getCurPos(); %>
								<% int num = pager.getNum(); %>
								<% for (int i = 1; i <= pager.getPageSize(); i++) { %>
								<% if (num < 1)
									break; %>
								<% Restrt restrt = restrtList.get(curPos++); %>
								<tr>
									<td><%=num-- %></td>
									<td><%=restrt.getCategory().getCategory_name()%></td>
									<td><a href="/restrt/detailRestrt?restrt_id=<%= restrt.getRestrt_id() %>"><%=restrt.getRESTRT_NM()%></td>
									<td><%=restrt.getREFINE_ROADNM_ADDR()%></td>
								</tr>	 
								<% } %>
							</tbody>
						</table>
					</div>
					<div style="padding-top: 20px">
					<div class="pagination" >
							<% for (int i = pager.getFirstPage(); i <= pager.getLastPage(); i++) { %>
							<% if (i > pager.getTotalPage())
									break;
							%>
							<a class="<%if (i == pager.getCurrentPage()) {%>active<%}%>" aria-current="page" href="/restrt/searchRestrt?currentPage=<%=i%>"><%=i%></a>
							<% } %>
						</div>
					</div>
					
				</div>
			</div>

		</div>
		<!-- main -->
	</div>
	<!-- row -->
	
<!-- <script>
javascript:selCategory('
%=category.getCategory_name() %>', 
%=category.getCategory_id() %>)
//select 컴포넌트에 선택한 카테고리 반영하기!!
function selCategory(category_name, category_id){
	var sel = document.querySelector("#category_id");
	sel.options[0].text=category_name; //사용자가 보게될 옵션의 제목 	
	sel.options[0].value=category_id; //사용자가 보게될 옵션의 값 	
}	
</script> -->

<!-- <script>
function myFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("mySearch");
  filter = input.value.toUpperCase();
  ul = document.getElementById("myMenu");
  li = ul.getElementsByTagName("li");
  for (i = 0; i < li.length; i++) {
    a = li[i].getElementsByTagName("a")[0];
    if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
      li[i].style.display = "";
    } else {
      li[i].style.display = "none";
    }
  }
}
</script> -->
	<%@ include file="../../shop/inc/footer.jsp"%>
</body>
</html>
