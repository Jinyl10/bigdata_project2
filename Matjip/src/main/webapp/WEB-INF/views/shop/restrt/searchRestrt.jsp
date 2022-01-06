<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>맛집 찾기</title>
<!-- style -->
<%@ include file="../../shop/inc/head_link.jsp"%>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--><style>
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
				<div class="left" ><!-- style="background-color: #bbb;" -->
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

				<div class="right" ><!-- style="background-color: #ddd;" -->
					<h2>검색 결과</h2>
					<%@ include file="../../shop/restrt/listRestrt.jsp" %>
				</div>
			</div>

		</div>
	</div>
	
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
