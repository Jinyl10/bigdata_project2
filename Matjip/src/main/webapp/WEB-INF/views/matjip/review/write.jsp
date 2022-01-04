<%@page import="com.koreait.matjip.domain.Review"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	Review review = (Review)request.getAttribute("review");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
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
	<input type="text"  	name="restrt_id" placeholder="9까지_restrt_id_숫자만_restrt 필요">
	<input type="text"  		name="member_id" placeholder="4까지_member_id_숫자만_세션아이디 필요">
    <input type="text"  		name="review_title" placeholder="Review Title..">
    <textarea						name="review_content" placeholder="리뷰를 적어주세요~" style="height:200px"></textarea>
    <input type="file" 			name="myFile">
    <p>
    <input type="button" value="등록" onClick="regist()">
  </form>
</div>

</body>
</html>