<%-- <%@page import="com.koreait.matjip.util.Pager"%> --%>
<%@page import="com.koreait.matjip.domain.Restrt"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
//	List<Restrt> restrtList =(List)request.getAttribute("restrtList");
//	Pager pager = (Pager) request.getAttribute("pager");
%>

<!-- search 코드 완성 후 여기에 복사할 예정!;  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
</style>
</head>
<body>
	<div>
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
<%-- 			<% Shop shop = restrtList.get %>
			<tr>
				<td><%=num--%</td>
				<td><%=shop.getSigun_id()%></td>
				<td><%=shop.getCategory_id()%></td>
				<td><%=shop.getRESTRT_NM()%></td>
				<td><%=shop.getREFINE_ROADNM_ADDR()%></td>
			</tr>
		</table>
	</div> --%>
	
<%-- 	<div class="pagination" style="paddiing-top:30px">
			<a>&laquo;</a>
			<%
				for (int i = pager.getFirstPage(); i <= pager.getLastPage(); i++) {
			%>
			<%
				if (i > pager.getTotalPage())
					break;
			%>
			<a class="<%if (i == pager.getCurrentPage()) {%>active<%}%>" aria-current="page" href="/restrt/listRestrt?currentPage=<%=i%>"><%=i%></a>
			<%} %>
			<a>&raquo;</a>
		</div> --%>


</body>
</html>
