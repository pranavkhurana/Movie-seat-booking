<%-- <%@page import="dao.*,mypack.*,java.util.*"%>
<%
	MovieDao md = new MovieDao();
	List<Movie> list = md.getAllMovies();
%> --%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>MovieTime | Pre-book movie seats</title>

<!-- Bootstrap Core CSS -->
<link
	href="http://localhost:8088/MVCfirst/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template CSS -->
<link
	href="http://localhost:8088/MVCfirst/resources/css/modern-business.css"
	rel="stylesheet">
<!-- Theme CSS -->
<link href="http://localhost:8088/MVCfirst/resources/css/custom.css"
	rel="stylesheet">
<!-- Datepicker CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

<!-- Custom Fonts -->
<link
	href="http://localhost:8088/MVCfirst/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<%-- <%@include file="WEB-INF/jsp/test-page.jsp"%> --%>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="">MovieTime</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="">About</a></li>
					<li><a href="">Services</a></li>
					<li><a href="">Contact</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Portfolio <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="">1 Column Portfolio</a></li>
							<li><a href="">2 Column Portfolio</a></li>
							<li><a href="">3 Column Portfolio</a></li>
							<li><a href="">4 Column Portfolio</a></li>
							<li><a href="">Single Portfolio Item</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Blog <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="">Blog Home 1</a></li>
							<li><a href="">Blog Home 2</a></li>
							<li><a href="">Blog Post</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Other Pages <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="">Full Width Page</a></li>
							<li><a href="">Sidebar Page</a></li>
							<li><a href="">FAQ</a></li>
							<li><a href="">404</a></li>
							<li><a href="">Pricing Table</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Header Carousel -->
	<header id="myCarousel" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<div class="fill"
					style="background-image: url('resources/Images/top-slider1.jpg');"></div>
				<div class="carousel-caption">
					<h2>The Dark Knight Rises.</h2>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url('resources/Images/top-slider2.jpg');"></div>
				<div class="carousel-caption">
					<h2></h2>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url('resources/Images/top-slider3.jpg');"></div>
				<div class="carousel-caption">
					<h2>Guardians of The Galaxy</h2>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</header>
	<!-- header carousel ends -->

	<!-- Page Content -->
	<div class="container">

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Now Showing</h1>
			</div>
			<!-- thumbnails begin-->
			<div class="row">
				<%-- <%
					for (int i = 0; i < list.size(); i++) {
				%> --%>
				<div class="col-sm-4 col-md-3">
					<div class="thumbnail">
						<img src="resources/Images/thumbnail.jpg" alt="thumb">
						<div class="caption">
							<div class="text-center">
								<h3>
									<%-- <%=list.get(i).getName()%> --%>
								</h3>
							</div>
							<p>
								<a
									href=<%-- <%="'choose-slot/" + i + "'"%> --%>
									class="btn btn-default pull-left"
									role="button">Book Seats</a> <a href="#"
									class="btn btn-default pull-right" role="button">Details</a>
							</p>
						</div>
					</div>
				</div>
				<%-- <%
					}
				%> --%>
			</div>
			<!--thumbnails end-->
		</div>
		<hr />

		<div>
			<!-- <div class="col-lg-12">
                    <h1 class="page-header">Top Chart</h1>
                </div> -->
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-4">
					<div class="jumbotron">
						<h2 class="page-header">Top Chart</h2>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
						eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
						enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
						reprehenderit in voluptate velit esse cillum dolore eu fugiat
						nulla pariatur. Excepteur sint occaecat cupidatat non proident,
						sunt in culpa qui officia deserunt mollit anim id est laborum.
					</div>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-5">
					<div class="jumbotron">
						<h2 class="page-header">Book Ticket</h2>
						<form action="book" method="post">

							<div class="form-group">
								<label for="movie">Choose Movie:</label> <select
									class="form-control" id="movie">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
								</select>
							</div>
							<div class="input-group date" data-provide="datepicker">
								<label for="date">Select Date:</label> <input type="text"
									class="form-control" id="date">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-th"></span>
								</div>
							</div>
							<div>
								<label for="show">Select Show:</label> <select
									class="form-control" id="movie">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
								</select>
							</div>
							<div class="form-group">
								<label for="seats">No of seats:</label> <input type="text"
									class="form-control" id="seats">
							</div>
							<button type="submit" class="btn btn-default">Check
								Availability</button>
						</form>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
		<hr />
		<!-- Trailers -->
		<div class="container">
			<div class="col-lg-12">
				<h1 class="page-header text-center">Trailers</h1>
			</div>
			<div class="row">
				<div class="col-sm-4">
					<iframe width="100%" height="315"
						src="https://www.youtube.com/embed/wX0aiMVvnvg" frameborder="0"
						allowfullscreen></iframe>
				</div>
				<div class="col-sm-4">
					<iframe width="100%" height="315"
						src="https://www.youtube.com/embed/r4O4Xec60_k" frameborder="0"
						allowfullscreen></iframe>
				</div>
				<div class="col-sm-4">
					<iframe width="100%" height="315"
						src="https://www.youtube.com/embed/dq3-HSY08x4" frameborder="0"
						allowfullscreen></iframe>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; MovieTime 2016</p>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>

	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		})
	</script>
	<!-- Datepicker script -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>

</body>

</html>
