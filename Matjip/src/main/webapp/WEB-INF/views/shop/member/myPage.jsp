<%@page import="java.util.List"%>
<%@ page import="com.koreait.matjip.domain.Member" %>
<%@ page import="com.koreait.matjip.domain.Review" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
//	List<Review> reviewList = (Review)request.getAttribute("review");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>맛집 찾기</title>

<!-- style -->
<%@ include file="../../shop/inc/head_link.jsp" %>

<style>
* {
  box-sizing: border-box;
}

.row {
  margin-left:-5px;
  margin-right:-5px;
}
  
.column {
  float: left;
  width: 50%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}

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

tr:nth-child(even) {
  background-color: #f2f2f2;
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
			
			<!--  -->
			<div class="row">
			  <div class="column">
			    <table>
			      <tr>
			        <th>First Name</th>
			        <th>Last Name</th>
			        <th>Points</th>
			      </tr>
			      <tr>
			        <td>Jill</td>
			        <td>Smith</td>
			        <td>50</td>
			      </tr>
			    </table>
			  </div>
			  <div class="column">
			    <table>
			      <tr>
			        <th>First Name</th>
			        <th>Last Name</th>
			        <th>Points</th>
			      </tr>
			      <tr>
			        <td>Jill</td>
			        <td>Smith</td>
			        <td>50</td>
			      </tr>
			     
			    </table>
			  </div>
			</div>

			

		</div>
	</div>

</body>
</html>
