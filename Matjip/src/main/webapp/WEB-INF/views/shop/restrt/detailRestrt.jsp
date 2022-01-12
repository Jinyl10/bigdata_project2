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

.btn-group button {
  background-color: #000080; /* Green background */
  border: 1px solid darkblue; /* Green border */
  color: white; /* White text */
  padding: 10px 24px; /* Some padding */
  cursor: pointer; /* Pointer/hand icon */
  float: left; /* Float the buttons side by side */
}

/* Clear floats (clearfix hack) */
.btn-group:after {
  content: "";
  clear: both;
  display: table;
}

.btn-group button:not(:last-child) {
  border-right: none; /* Prevent double borders */
}

/* Add a background color on hover */
.btn-group button:hover {
  background-color: blue;
}

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



.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}


/* .button {
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
} */
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
		<div class="main" style="height:500px">
			<h3>가게 정보</h3>
			
			<div class="container">
			  <form >
			  	<input type="hidden" name="restrt_id" value="<%=restrt.getRestrt_id() %>">
			  	
			    <label for="fname">가게 이름</label>
			    <input type="text" name="restrt_nm"  value="<%=restrt.getRESTRT_NM()%>">
			
			    <label for="lname">가게 주소</label>
			    <input type="text" name="refine_roadnm_addr" value="<%=restrt.getREFINE_ROADNM_ADDR()%>" >
			
			    <!-- <input type="button" value="다른 음식점 찾기" onClick="location.href='/searchRestrt'"> -->
			  </form>
			</div>
			<div class="btn-group" align="right" style="padding-top:20px">
				  <button id="search_bt" onClick="location.href='/searchRestrt'">다른 음식점 찾기</button>
				  <button id="listRe_bt" <%if(session.getAttribute("member")!=null){ %>  onClick="location.href='/review/listReview'" 
				  <%} else {%> onClick="alert('로그인이 필요한 서비스입니다.'); location.href='/login/form'" <% }%> >
				  다녀간 손님들의 리뷰</button>
				  <button id="jjim_bt" >찜한 가게 등록</button>
			</div>
		</div>
		<!-- main -->
	</div>
	<!-- row -->
	<%@ include file="../../shop/inc/footer.jsp"%>
</body>
</html>