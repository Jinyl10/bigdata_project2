<%-- <%@page import="com.koreait.matjip.util.Pager"%>
<%@page import="com.koreait.matjip.domain.Review"%>
<%@page import="java.util.List"%> --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
//	List<Review> reviewList =(List)request.getAttribute("reviewList");
//Pager pager = (Pager) request.getAttribute("pager");
%>
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
 
 table:hover tbody tr:hover td{
 background: #eee;
 color: black;
 }
</style>
</head>
<body>

	<div>
		<table>
			<thead>
			<tr>
				<th>No</th>
				<th>가게명</th>
				<th>대표 음식</th>
				<th>리뷰 수</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
			</tr>
			<tr>
				<td>2</td>
				<td>2</td>
				<td>2</td>
				<td>2</td>
			</tr>
			<tr>
				<td>3</td>
				<td>3</td>
				<td>3</td>
				<td>3</td>
			</tr>
			<tr>
				<td>4</td>
				<td>4</td>
				<td>4</td>
				<td>4</td>
			</tr>
			</tbody>
		</table>
	</div>


</body>
</html>
