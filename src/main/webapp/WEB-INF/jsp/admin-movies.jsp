<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@	page import="dao.*,mypack.*,java.util.*"%>
<%
	List<Movie> movielist = (List<Movie>) request.getAttribute("movielist");
	Iterator<Movie> movieitr = movielist.iterator();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	String url = request.getRequestURL().toString();
	String baseUrl = url.substring(0, url.length() - request.getRequestURI().length())
			+ request.getContextPath() + "/";
%>
<link href="<%=baseUrl%>/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template CSS -->
<link href="<%=baseUrl%>/resources/css/modern-business.css"
	rel="stylesheet">
<!-- Theme CSS -->
<link href="<%=baseUrl%>/resources/css/custom.css" rel="stylesheet">
<!-- Datepicker CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

<!-- Custom Fonts -->
<link
	href="<%=baseUrl%>/resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<style>
.image-upload{
	margin-top:40px;
}
.verticalalign {
	margin-top: 20%;
}

h2 {
	padding: 20px;
	text-align: center;
}

.glyphicon {
	font-size: small;
}

body {
	background-color: rgba(0, 140, 186, 0.08);
}

.jumbotron {
	padding: 10px;
	margin: 10px;
	margin-top: 35px;
	margin-bottom: 50px;
}

input {
	padding: 2px;
	border: none;
	background-color: white;
	/* background-color:rgba(216, 216, 216, 0.45098); */
}
</style>

<title>Insert title here</title>
</head>
<body>
	<%@include file="navigation-bar.jsp"%>

	<div class="jumbotron">
		<h2>Movies (Now showing)</h2>
		<form id='editform' action="movies/edit" method="get">
			<table id="movie-table"
				class="table table-responsive table-striped table-hover">
				<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Genre</th>
						<th>Cast</th>
						<th>Rating</th>
						<th>Synopsis</th>
						<th>Releasedate</th>
						<th>Duration</th>
						<th>Poster</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<%
						while (movieitr.hasNext()) {
							Movie m = movieitr.next();
					%>
					<tr id="<%=m.getId()%>">
						<td class="id"><%=m.getId()%></td>
						<td class="name"><%=m.getName()%></td>
						<td class="genre"><%=m.getGenre()%></td>
						<td class="cast"><%=m.getCast()%></td>
						<td class="rating"><%=m.getRating()%></td>
						<td class="synopsis"><%=m.getSynopsis()%></td>
						<td class="releasedate"><%=m.getReleasedate()%></td>
						<td class="duration"><%=m.getDuration()%></td>
						<td class="posteraddress"><%=m.getPosteraddress()%></td>
						<td class="edit"><a onclick="editMovie(<%=m.getId()%>)"><span
								class="glyphicon glyphicon-edit"></span></a></td>
						<td class="delete"><a href="movies/delete/<%=m.getId()%>"><span
								class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</form>
	</div>
	<div class="row">
		<div class="col-sm-3 verticalalign">
			<h2>Add Movies here</h2>
		</div>
		<div class="col-sm-5">
			<div class="jumbotron" style="padding: 20px; padding-bottom: 50px">
				<form class="form-horizontal" action='movies/add' method='get'>
					<div class="form-group">
						<label class="control-label col-sm-4" for="id">Movie id:</label>
						<div class="col-sm-8">
							<input type="number" name="id" class="form-control" id="id">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="name">Name:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name='name' id="name">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="genre">Genre:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name='genre' id="genre">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="cast">Cast:</label>
						<div class="col-sm-8">
							<textarea name="cast" class="form-control" id="cast"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="rating">Rating:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name='rating' id="rating">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="releasedate">Release
							date:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name='releasedate'
								id="releasedate">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="synopsis">Synopsis:</label>
						<div class="col-sm-8">
							<textarea name="synopsis" class="form-control" id="synopsis"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="duration">Duration:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name='duration'
								id="duration">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-4" for="posteraddress">Poster (file name with format)
							:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name='posteraddress'
								id="posteraddress">
						</div>
					</div>
					<div>
						<a href="/movies/add">
							<button style="float: right" type="submit"
								class="btn btn-default">
								Add Movie <span class="glyphicon glyphicon-plus-sign"></span>
							</button>
						</a>
					</div>
				</form>
			</div>
		</div>
		<div class="col-sm-3 image-upload">
			<h4>Upload poster here</h4>
			<hr>
			<form class="form-horizontal" action="savefile" method="post" enctype="multipart/form-data">
				Select image*: <input class="form-control" type="file" name="file" />
				<!-- <input class="form-control" type="submit" value="Upload File" /> -->
				<br>
				<div>
						<a href="/savefile">
							<button type="submit" class="btn btn-default">
								Upload<span class="glyphicon glyphicon-plus-sign"></span>
							</button>
						</a>
				</div>
			</form>
			<br>
			<p>*Image name must be same as mentioned in last field Poster.</p>
		</div>
	</div>

	<!-- jQuery -->
	<script type="text/javascript" src="<%=baseUrl%>resources/js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script type="text/javascript"
		src="<%=baseUrl%>resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=baseUrl%>resources/js/custom.js"></script>

</body>
</html>