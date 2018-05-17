<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="resources/facebook/assets/css/bootstrap2.css">
<link rel="stylesheet"
	href="resources/facebook/assets/css/facebook2.css">
<script type="text/javascript" src="assets/js/jquery.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('[data-toggle=offcanvas]')
								.click(
										function() {
											$(this).toggleClass(
													'visible-xs text-center');
											$(this)
													.find('i')
													.toggleClass(
															'glyphicon-chevron-right glyphicon-chevron-left');
											$('.row-offcanvas').toggleClass(
													'active');
											$('#lg-menu').toggleClass(
													'hidden-xs').toggleClass(
													'visible-xs');
											$('#xs-menu').toggleClass(
													'visible-xs').toggleClass(
													'hidden-xs');
											$('#btnShow').toggle();
										});
					});
</script>
</head>
<body>
					<div class="navbar navbar-blue navbar-static-top">
						<!-- 
                     아이콘 영역. 기존 부트스트랩보다 margin-top을 늘림.
                   -->
						<div class="navbar-header">
							<!-- 토글용 버튼인데.... collapse되어있어 비활성화된 듯 함. -->
							<button class="navbar-toggle" type="button"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle</span>
							</button>
							<!-- 아이콘. margin-top을 늘림. -->
							<a href="https://www.naver.com" class="navbar-brand logo">N</a>
						</div>

						<!-- 아이콘을 제외한 오른쪽 영역. -->
						<nav class="navbar-collapse" role="navigation">
							<!-- 검색 폼. -->
							<div class="search_wrap">
								<form class="navbar-form navbar-left" method="post" onsubmit="return checkgo();" id="searchForm">
									<div class="input-group input-group-sm">
										<select id="search_category" style="height: 30px;" >
											<option value="user">사람</option>
											<option value="map">가게</option>
											<option value="board">글</option>
										</select>
										<input class="form-control" placeholder="Search" name="srch-term" id="srch-term" type="text">
										<div class="input-group-btn">
											<button class="btn btn-default" type="submit">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
							<!-- 오른쪽 아이콘 모음집. 가로 957.333px에 찌그러짐-->
							<div class="icon_wrap">
								<ul class="nav navbar-nav navbar-right">
									<li>
										<a href="#">로그인</a>
									</li>
									<li>
										<a href="#postModal" role="button" data-toggle="modal">
										추천 경로+</a>
									</li>
									<li>
										<a href="#">스토리</a>
									</li>
									<!-- 드롭다운(클릭하면 밑으로 튀어나오는 메뉴) -->
									 <li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="glyphicon glyphicon-user"></i></a>
									<ul class="dropdown-menu">
									  <li><a href="">More</a></li>
									  <li><a href="">More</a></li>
									  <li><a href="">More</a></li>
									  <li><a href="">More</a></li>
									  <li><a href="">More</a></li>
									</ul>
								  </li>
								</ul>
							</div>
						</nav>
					</div>
</body>
</html>