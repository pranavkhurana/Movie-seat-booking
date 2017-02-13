<%@page import="dao.*,mypack.*,java.util.*"%>
<%
	String url = request.getRequestURL().toString();
	String baseUrl = url.substring(0, url.length() - request.getRequestURI().length())
			+ request.getContextPath() + "/";
	List<Movie> list = (List<Movie>) request.getAttribute("list");
%>
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
<link href="<%=baseUrl%>resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template CSS -->
<link href="<%=baseUrl%>resources/css/modern-business.css"
	rel="stylesheet">
<!-- Theme CSS -->
<link href="<%=baseUrl%>resources/css/custom.css" rel="stylesheet">
<!-- Datepicker CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

<!-- Custom Fonts -->
<link href="<%=baseUrl%>resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<jsp:include page="navigation-bar.jsp"></jsp:include>

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

		<!-- Now Showing Section -->
		<section id="now-showing">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Now Showing</h1>
			</div>
			<!-- thumbnails begin-->
			<div class="row">
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<div class="col-sm-4 col-md-3">
						<img class="img-responsive"  src=<%="resources/Images/"+list.get(i).getPosteraddress()%> alt="thumb">
					<div class="thumbnail">
						
						<%-- src=<%="resources/Images/thumbnail" + (i + 1) + ".jpg"%> --%><!-- src="resources/Images/tip.png" -->
						
						<div class="caption">
							<div class="text-center">
								<h3>
									<%=list.get(i).getName()%>
								</h3>
							</div>
							<p>
								<a href=<%="'choose-slot/" + (i + 1) + "'"%>
									class="btn btn-default pull-left" role="button">Book Seats</a>
								<a href="#" class="btn btn-default pull-right" role="button">Details</a>
							</p>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
			<!--thumbnails end-->
		</div>
		</section>
		<hr />

		<!-- Top chart and Book tickets section -->
		<section id="top-chart">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-5">
				<div class="jumbotron">
					<h2 class="page-header">Top Chart</h2>
					<table class="table">
						<thead>
							<tr>
								<th><h4 class="text-primary">No.</h4></th>
								<th><h4 class="text-primary">Movie</h4></th>
								<th><h4 class="text-primary">Rating</h4></th>
							</tr>
						</thead>
						<tbody>
							<%
								Collections.sort(list);
								int topchartLength;
								if (list.size() > 5)
									topchartLength = 5;
								else
									topchartLength = list.size();
								for (int i = 0; i < topchartLength; i++) {
									Movie m = list.get(i);
									out.print("<tr><td><h4>" + (i + 1) + "</h4></td>");
									out.print("<td><h4>" + m.getName() + "</h4></td>");
									out.print("<td><h4>" + m.getRating() + "<span class='glyphicon glyphicon-star'></span></h4></td></tr>");
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="col-md-1"></div>
			<div class="col-md-4">
				<div class="jumbotron">
					<h2 class="page-header">Book Tickets</h2>

					<form action="choose-seat" method="post">

						<div class="form-group">
							<label for="movie">Choose movie:</label> <select
								class="form-control" id="movie">
								<%
									for (Movie m : list) {
								%>
								<option>
									<%=m.getName()%>
								</option>
								<%
									}
								%>
							</select>
						</div>
						<div class="input-group date" data-provide="datepicker">
							<label for="date">Pick date:</label> <input type="text"
								class="form-control" id="date">
						</div>
						<div class="form-group input-group">
							<label for="show">Select show:</label> <select
								class="form-control" id="movie">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
							</select>
						</div>
						<hr />
						<button type="submit" class="btn btn-default">Check
							Availability</button>
					</form>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		</section>
		<hr />
		<section id="trailers">
		<!-- Trailers and Promos section -->
		<div class="container">
			<div class="col-lg-12">
				<h1 class="page-header text-center">Trailers and Promos</h1>
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
		</section>
		
	</div>
	<!-- /.container -->
	<!-- Footer -->
	<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; MovieTime 2016</p>
			</div>
		</div>
	</footer>

	<!-- jQuery -->
	<script src="<%=baseUrl%>resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=baseUrl%>resources/js/bootstrap.min.js"></script>

	<!-- Script to Activate the Carousel -->
	<script>
		//carousel speed
		$('.carousel').carousel({
			interval : 3000
		//changes the speed
		})
	</script>
	<!-- Datepicker script -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
</body>

</html>
