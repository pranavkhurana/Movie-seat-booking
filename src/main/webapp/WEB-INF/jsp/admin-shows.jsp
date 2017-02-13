<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@	page import="dao.*,mypack.*,java.util.*,java.io.PrintWriter"%>
<%
	String url = request.getRequestURL().toString();
	String baseUrl = url.substring(0, url.length() - request.getRequestURI().length())
			+ request.getContextPath() + "/";
	List<ShowPlusMoviename> showlist = (List<ShowPlusMoviename>) request.getAttribute("showlist");
	Iterator<ShowPlusMoviename> showitr = showlist.iterator();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
.glyphicon {
	font-size: small;
}

input {
	padding: 2px;
	border: none;
	width: 40px;
	background-color: white;
	/* background-color:rgba(216, 216, 216, 0.45098); */
}

#time {
	width: 90px;
}

#date {
	width: 120px;
}

#seatstatus {
	width: 400px;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<%@include file="navigation-bar.jsp"%>

	<div class="jumbotron">
		<h3>Shows</h3>
		<form id='editform' action="shows/edit" method="post">
			<table id="show-table"
				class="table table-striped table-responsive table-hover">
				<thead>
					<tr>
						<th>Show-id</th>
						<th>Movie-id</th>
						<th>Movie</th>
						<th>Date</th>
						<th>Time</th>
						<th>Price</th>
						<th>Seat Status</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<%
						while (showitr.hasNext()) {
							ShowPlusMoviename s = showitr.next();
					%>
					<tr id="<%=s.getShowid()%>">
						<td class="showid"><%=s.getShowid()%></td>
						<td class="movieid"><%=s.getMovieid()%></td>
						<td class="moviename"><%=s.getMoviename()%></td>
						<td class="date"><%=s.getDate()%></td>
						<td class="time"><%=s.getTime()%></td>
						<td class="prices"><%=s.getPrice()%></td>
						<td class="seatstatus"><%=s.getSeatstatus()%></td>
						<td class="edit"><a onclick="editShow(<%=s.getShowid()%>)"><span
								class="glyphicon glyphicon-edit"></span></a></td>
						<td class="delete"><a href="shows/delete/<%=s.getShowid()%>"><span
								class="glyphicon glyphicon-remove"></span></a></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</form>
		<div>
			<h4>Add new show here</h4>
			<form class="form-inline" action='shows/add' method='get'>
				<div class="form-group">
					<label for="mid">Movie id:</label> <input type="number"
						name="movieid" class="form-control" id="mid">
				</div>
				<div class="form-group">
					<label for="dt">Date:</label> <input type="date"
						class="form-control" name='date' id="dt">
				</div>
				<div class="form-group">
					<label for="tm">Time:</label> <input type="time"
						class="form-control" name='timestring' id="tm">
				</div>
				<div class="form-group">
					<label for="prc">Price:</label> <input type="text"
						class="form-control" name='price' id="prc">
				</div>
				<a href="/shows/add"><button type="submit"
						class="btn btn-default">
						<span class="glyphicon glyphicon-plus-sign"></span>
					</button></a>
			</form>
		</div>
	</div>

	<!-- jQuery -->
	<script type="text/javascript" src="<%=baseUrl%>resources/js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script type="text/javascript"
		src="<%=baseUrl%>resources/js/bootstrap.min.js"></script>
	<!-- jQuery -->
	<script type="text/javascript" src="<%=baseUrl%>resources/js/custom.js"></script>
</body>
</html>