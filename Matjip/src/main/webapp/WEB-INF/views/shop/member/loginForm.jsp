<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="../../shop/inc/head_link.jsp"%>
<style>

.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

.icon {
  padding: 10px;
  background: #000080;
  color: white;
  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.btn {
  background-color: #000080;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("button").click(function(){
		loginCheck();
	});
});
//RestController;
function loginCheck(){
	$.ajax({
		url:"/login/check",
		type:"POST",
		data:{
			email:$("input[name='email']").val(), 
			password:$("input[name='password']").val()
		},
		success:function(result, status, xhr){ //200 요청에 대한 처리메서드
			alert(result.msg);//메시지 출력
			
			if(result.code==1){
				location.href="/main";
			}
		}
	});
	
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

		<div class="main" style="height:500px">
			<form name="joinForm" style="margin:auto">
			  <h2>로그인</h2>
			
			
			  <div class="input-container">
			    <i class="fa fa-envelope icon"></i>
			    <input class="input-field" type="email" placeholder="이메일을 입력하세요" name="email">
			  </div>
			  
			  <div class="input-container">
			    <i class="fa fa-key icon"></i>
			    <input class="input-field" type="password" placeholder="비밀번호를 입력하세요" name="password">
			  </div>
			  
			  <button type="button" class="btn">로그인</button>
			</form>
		</div>
	<!-- /main -->
	</div>

	<%@ include file="../../shop/inc/footer.jsp"%>
	
			

</body>
</html>
    