<%@page import="com.koreait.matjip.domain.Review"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Review review = (Review)request.getAttribute("review");
%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰 정보</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../shop/inc/head_link.jsp"%>
<style>
body 
* {box-sizing: border-box;}

.btn-group button {
  background-color: #228b22; /* Green background */
  border: 1px solid darkgreen; /* Green border */
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
  background-color: green;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
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
</style>
<script type="text/javascript">
<%-- 	<![CDATA[ 
	var member = [[ ${session.member} ]];
	]]

function member_check(){
	if (member != <%= review.getMember() %>) {
		document.getElementById('update_bt').style.visibility = 'hidden';
	} 	
} --%>


function del(){
	if(confirm("삭제하시겠어요?")){
		location.href="/review/delete?review_id=<%=review.getReview_id()%>";
	}	
}
function edit(){
	if(confirm("수정하시겠어요?")){
		form1.action="/review/update";
		form1.method="post";
		form1.submit();	
		// 
	}
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
				<h3>리뷰 내용</h3>
				
				<div class="container">
				  <form name="form1">
				    <input type="hidden"  	name="review_id" 			value="<%=review.getReview_id()%>">
				    <input type="text"  		name="review_title" 		value="<%=review.getReview_title()%>">
				    <textarea						name="review_content" style="height:200px"><%=review.getReview_content()%></textarea>
				   	
					<div class="btn-group" align="right" style="padding-top:20px">
						<button id="list_bt" value="list" onClick="location.href='/review/listReview'">목록</button>
						<button id="update_bt" value="update" onClick="edit()">수정</button>
						<button id="delete_bt" value="delete" onClick="del()" >삭제</button>
					</div>
				</form>
				</div>
			</div>
		</div>
		<!-- main -->
	</div>
	<!-- row -->
</body>
</html>
