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
</head>
<body>
	<div class="wrapper">
		<div class="box">
			<div class="row row-offcanvas row-offcanvas-left">
			
						<!--
							원본 왼쪽에 있던 사이드바.
							다만 밑의 메인 화면의 가로 길이를 100%로 하였기 때문에
							글씨가 겹쳐 보이는 문제가 발생함.
						-->
				 		<div class="column col-sm-2 col-xs-1 sidebar-offcanvas" id="sidebar">
					  
						<ul class="nav">
							<li><a href="#" data-toggle="offcanvas" class="visible-xs text-center"><i class="glyphicon glyphicon-chevron-right"></i></a></li>
						</ul>
					   
						<ul class="nav hidden-xs" id="lg-menu">
							<li class="active"><a href="#featured"><i class="glyphicon glyphicon-list-alt"></i> Featured</a></li>
							<li><a href="#stories"><i class="glyphicon glyphicon-list"></i> Stories</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-paperclip"></i> Saved</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-refresh"></i> Refresh</a></li>
						</ul>
						<ul class="list-unstyled hidden-xs" id="sidebar-footer">
							<li>
							  <a href="http://usebootstrap.com/theme/facebook"><h3>Bootstrap</h3> <i class="glyphicon glyphicon-heart-empty"></i> Bootply</a>
							</li>
						</ul>
					  
						tiny only nav
						<ul class="nav visible-xs" id="xs-menu">
							<li><a href="#featured" class="text-center"><i class="glyphicon glyphicon-list-alt"></i></a></li>
							<li><a href="#stories" class="text-center"><i class="glyphicon glyphicon-list"></i></a></li>
							<li><a href="#" class="text-center"><i class="glyphicon glyphicon-paperclip"></i></a></li>
							<li><a href="#" class="text-center"><i class="glyphicon glyphicon-refresh"></i></a></li>
						</ul>
					  
					</div> 
					<!--
						col-sm-12, col-xs-12 둘 다 같은 width 설정 class.
						col-xs-12는 disable된 상태
						
						맨 뒤의 숫자를 변경하면(col-sm-10) 회색 화면의 가로가 줄어들어 
						백그라운드의 회색 화면이 나타남.						
					 -->
				<div id="main" class="column col-sm-10 col-xs-11">
					
					<!-- 
						Topbar. 기존 부트스트랩보다 height를 늘림.
					 -->
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
							<a href="main.do" class="navbar-brand logo">N</a>
						</div>
						
						<!-- 아이콘을 제외한 오른쪽 영역. -->
						<nav class="collapse navbar-collapse" role="navigation">
							<!-- 검색 폼. -->
							<form class="navbar-form navbar-left">
								<div class="input-group input-group-sm"><!--  style="width: 800px;" -->
									<input class="form-control" placeholder="Search"
										name="srch-term" id="srch-term" type="text">
									<div class="input-group-btn">
										<button class="btn btn-default" type="submit">
											<i class="glyphicon glyphicon-search"></i>
										</button>
									</div>
								</div>
							</form>
							<!-- 오른쪽 아이콘 모음집. -->
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
						</nav>
					</div>
					<div class="padding">
							<div class="full col-sm-9">
								<div class="row">
									<div class="col-sm-12">
										<div class="panel panel-default">
											<div class="panel-thumbnail">
												<img src="고기.jpg" class="img-responsive">
											</div>
											<div class="panel-body">
												<p class="lead">배고프다</p>
												<p>잉여 붕여</p>
												<p>
													<img src="resources/facebook/assets/img/uFp_tsTJboUY7kue5XAsGAs28.png" height="28px" width="28px">
												</p>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-thumbnail">
												<img src="고기.jpg" class="img-responsive">
											</div>
											<div class="panel-body">
												<p class="lead">배고프다</p>
												<p>잉여 붕여</p>
												<p>
													<img src="resources/facebook/assets/img/uFp_tsTJboUY7kue5XAsGAs28.png" height="28px" width="28px">
												</p>
											</div>
										</div>
									</div>
									
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('[data-toggle=offcanvas]').click(function() {
				$(this).toggleClass('visible-xs text-center');
				$(this).find('i').toggleClass('glyphicon-chevron-right glyphicon-chevron-left');
				$('.row-offcanvas').toggleClass('active');
				$('#lg-menu').toggleClass('hidden-xs').toggleClass('visible-xs');
				$('#xs-menu').toggleClass('visible-xs').toggleClass('hidden-xs');
				$('#btnShow').toggle();
			});
        });
</script>
</body>
</html>