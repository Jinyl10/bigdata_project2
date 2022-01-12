<%@page import="com.koreait.matjip.domain.Restrt"%>
<%@page import="com.koreait.matjip.domain.Member"%>
<%@page import="com.koreait.matjip.domain.Review"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Review review = (Review)request.getAttribute("review");
	Member member = (Member)session.getAttribute("member");
	/* int restrt_id =  */
%>
<!DOCTYPE html>
<html>
<head>
<title>리뷰 리스트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../shop/inc/head_link.jsp"%>
<style>
body 
* {box-sizing: border-box;}
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
  
}
</style>
<script type="text/javascript">
function regist(){
	form1.action="/review/regist";
	form1.method="post";
	form1.encoding="multipart/form-data";
	form1.submit();
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

			<h3>리뷰 등록</h3>
			
			<div class="container">
			  <form name="form1" enctype="multipart/form-data">
				<!-- 
				<div class="make_star">
					<select name="" id="makeStar">
						<option value="1">★(1)</option>
						<option value="2">★★(2)</option>
						<option value="3">★★★(3)</option>
						<option value="4">★★★★(4)</option>
						<option value="5">★★★★★(5)</option>
					</select>
					<div class="rating" data-rate="3">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>	
					</div>
				</div>
				-->
				<!-- <input type="text"  	name="review_id" placeholder="reviewid_숫자만 입력하세요"> -->
				<input type="text"  		name="restrt_id" placeholder="식당번호: 1~8">
				<input type="text"  		name="member_id" placeholder="멤버번호: 1~4">
			    <input type="text"  		name="review_title" placeholder="제목을 적어주세요">
			    <textarea						name="review_content" placeholder="리뷰를 적어주세요~" style="height:200px"></textarea>
 			    <input type="file" 			name="myFile">
			    <p>
			    <button type="button" value="등록" onClick="regist()"> 등록</button> 
			  </form>
			</div>
		</div>
		<!-- main -->
	</div>
	<!-- row -->
	<%@ include file="../../shop/inc/footer.jsp"%>
</body>
</html>