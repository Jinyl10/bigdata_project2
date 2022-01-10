<%@page import="com.koreait.matjip.util.Pager"%>
<%@page import="com.koreait.matjip.domain.Restrt"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
List<Restrt> restrtList = (List) request.getAttribute("restrtList");
//Pager pager = (Pager) request.getAttribute("pager");
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

/* th{background-color:#eee}
 tr:hover {background-color: #eee} */
table:hover tbody tr:hover td {
	background: #eee;
	color: black;
}

.progress-container {
  width: 100%;
  height: 8px;
  background: #ccc;
}

.progress-bar {
  height: 8px;
  background: #04AA6D;
  width: 0%;
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
						<li><a href="#">한식</a></li>
						<li><a href="#">중식, 일식, 양식</a></li>
						<li><a href="#">고기</a></li>
						<li><a href="#">해산물</a></li>
					</ul>
				</div>

				<div class="right">
					<!-- style="background-color: #ddd;" -->
					<h2>맛집 목록</h2>
					<div class="progress-container">
    					<div class="progress-bar" id="myBar"></div>
  					</div> 
  					<div class="contenct">
						<table>
							<thead>
								<tr>
									<th>No</th>
									<th>시군 아이디</th>
									<th>카테고리 아이디</th>
									<th>음식점 명</th>
									<th>주소</th>
								</tr>
							</thead>
							
							<%for(int i=0;i<restrtList.size();i++) { %>
							
							<tr>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
							</tr>
							
<%--						<tr>
								<td><%=restrtList.g %></td>
								<td><%=restrt.getSigun_id()%></td>
								<td><%=restrt.getCategory_id()%></td>
								<td><%=restrt.getRESTRT_NM()%></td>
								<td><%=restrt.getREFINE_ROADNM_ADDR()%></td>
							</tr>	  --%>
							<% } %>
						</table>
					</div>
				</div>
			</div>

		</div>
		<!-- main -->
	</div>
	<!-- row -->
	
	<script>
// When the user scrolls the page, execute myFunction 
window.onscroll = function() {myFunction()};

function myFunction() {
  var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
  var scrolled = (winScroll / height) * 100;
  document.getElementById("myBar").style.width = scrolled + "%";
}
</script>

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
