<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>

<link href="Template/Frontend/css/bootstrap.css" rel="stylesheet">
<link href="Template/Frontend/css/bootstrap-responsive.css"
	rel="stylesheet">
<link href="Template/Frontend/css/style.css" rel="stylesheet">


<!-- font -->
<link rel="stylesheet"
	href="Template/Frontend/font/font-awesome.min.css" />

<script src="Template/Frontend/js/jquery-1.js"></script>
<script src="Template/Frontend/js/bootstrap.min.js"></script>

<style>
#size {
	padding-top: 20px;
	padding-bottom: 10px;
}

#size1 {
	padding-top: 280px;
}
</style>

<script type="text/javascript">
	function Search() {
		var xhttp;
		var grammarname = document.myform.grammarname.value;

		if (grammarname != "") {
			var url = "Searchcontroller?grammarname=" + grammarname;

			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}

			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = xhttp.responseText;
					document.getElementById("searchresult").innerHTML = data;
				}

			}
			xhttp.open("POST", url, true);
			xhttp.send();
		} else {
			document.getElementById("searchresult").innerHTML = "Vui lòng nhập khoá học cần tìm";
		}
	}
</script>

</head>
<body>
	<br />
	<a href="View/index.html" style="margin-right: 20px; float: right">Go
		to page add comment</a>
	<div class="container">
		<div class="row">
			<div class="span6">
				<div id="size">
					<p>Nhập khoá học</p>
					<form name="myform">
						<input type="text" class="form-control" placeholder="Tìm kiếm"
							style="width: 500px" name="grammarname" onkeyup="Search()">
					</form>
				</div>

			</div>
		</div>
	</div>
	<div class="container" id="searchresult"></div>
</body>
</html>